package wx

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"math/rand"
	"net/http"
	"time"

	"github.com/pkg/errors"
	"github.com/zeromicro/go-zero/core/logx"

	"zero-api/common/xerr"
	"zero-api/service/rpc/model/mysql"
)

const (
	//公众号相关
	getTicketURL          = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi"
	oathAccessTokenURL    = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code"
	refreshAccessTokenURL = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%s&grant_type=refresh_token&refresh_token=%s"
	userInfoURL           = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=%s"
	checkAccessTokenURL   = "https://api.weixin.qq.com/sns/auth?access_token=%s&openid=%s"
	code2SessionURL       = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code"

	//小程序相关
	checkEncryptedDataURL = "https://api.weixin.qq.com/wxa/business/checkencryptedmsg?access_token=%s"
	getPhoneNumber        = "https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=%s"
	//小程序access_token
	accessTokenURL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s"
	getMediaUrl    = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=%s&media_id=%s"
)

type CommonError struct {
	apiName string
	ErrCode int64  `json:"errcode"`
	ErrMsg  string `json:"errmsg"`
}

// ResAccessToken 获取用户授权access_token的返回结果
// 这是微信网页授权的token，非接口请求凭证token
type ResAccessToken struct {
	CommonError

	AccessToken  string `json:"access_token"`
	ExpiresIn    int64  `json:"expires_in"`
	RefreshToken string `json:"refresh_token"`
	OpenID       string `json:"openid"`
	Scope        string `json:"scope"`

	// UnionID 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
	// 公众号文档 https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421140842
	UnionID string `json:"unionid"`
}

// GetUserAccessToken 通过网页授权的code 换取access_token(区别于context中的access_token)
func GetUserAccessToken(ctx context.Context, appId, secret, code string) (result ResAccessToken, err error) {
	urlStr := fmt.Sprintf(oathAccessTokenURL, appId, secret, code)
	var response []byte
	response, err = HTTPGet(ctx, urlStr)
	if err != nil {
		return
	}
	err = json.Unmarshal(response, &result)
	if err != nil {
		return
	}
	if result.ErrCode != 0 {
		err = fmt.Errorf("GetUserAccessToken error : errcode=%v , errmsg=%v", result.ErrCode, result.ErrMsg)
		return
	}
	return
}

// RefreshAccessToken 刷新access_token
func RefreshAccessToken(ctx context.Context, refreshToken, appid string) (result ResAccessToken, err error) {
	urlStr := fmt.Sprintf(refreshAccessTokenURL, appid, refreshToken)
	var response []byte
	response, err = HTTPGet(ctx, urlStr)
	if err != nil {
		return
	}
	err = json.Unmarshal(response, &result)
	if err != nil {
		return
	}
	if result.ErrCode != 0 {
		err = fmt.Errorf("GetUserAccessToken error : errcode=%v , errmsg=%v", result.ErrCode, result.ErrMsg)
		return
	}
	return
}

// CheckAccessToken 检验access_token是否有效
func CheckAccessToken(ctx context.Context, accessToken, openID string) (b bool, err error) {
	urlStr := fmt.Sprintf(checkAccessTokenURL, accessToken, openID)
	var response []byte
	response, err = HTTPGet(ctx, urlStr)
	if err != nil {
		return
	}
	var result CommonError
	err = json.Unmarshal(response, &result)
	if err != nil {
		return
	}
	if result.ErrCode != 0 {
		b = false
		return
	}
	b = true
	return
}

// UserInfo 用户授权获取到用户信息
type UserInfo struct {
	CommonError

	OpenID     string   `json:"openid"`
	Nickname   string   `json:"nickname"`
	Sex        int64    `json:"sex"`
	Province   string   `json:"province"`
	City       string   `json:"city"`
	Country    string   `json:"country"`
	HeadImgURL string   `json:"headimgurl"`
	Privilege  []string `json:"privilege"`
	Unionid    string   `json:"unionid"`
}

// GetUserInfo 如果scope为 snsapi_userinfo 则可以通过此方法获取到用户基本信息
func GetUserInfo(ctx context.Context, accessToken, openID, lang string) (result UserInfo, err error) {
	if lang == "" {
		lang = "zh_CN"
	}
	urlStr := fmt.Sprintf(userInfoURL, accessToken, openID, lang)
	var response []byte
	response, err = HTTPGet(ctx, urlStr)
	if err != nil {
		return
	}
	err = json.Unmarshal(response, &result)
	if err != nil {
		return
	}
	if result.ErrCode != 0 {
		err = fmt.Errorf("GetUserInfo error : errcode=%v , errmsg=%v", result.ErrCode, result.ErrMsg)
		return
	}
	return
}

//小程序登录授权接口
// ResCode2Session 登录凭证校验的返回结果
type ResCode2Session struct {
	CommonError

	OpenID     string `json:"openid"`      // 用户唯一标识
	SessionKey string `json:"session_key"` // 会话密钥
	UnionID    string `json:"unionid"`     // 用户在开放平台的唯一标识符，在满足UnionID下发条件的情况下会返回
}

// Code2Session 登录凭证校验。
func Code2Session(ctx context.Context, miniAppid, miniAppSecret, jsCode string) (result ResCode2Session, err error) {

	urlStr := fmt.Sprintf(code2SessionURL, miniAppid, miniAppSecret, jsCode)
	var response []byte
	response, err = HTTPGet(ctx, urlStr)
	if err != nil {
		return
	}
	err = json.Unmarshal(response, &result)
	if err != nil {
		return
	}
	if result.ErrCode != 0 {
		err = fmt.Errorf("Code2Session error : errcode=%v , errmsg=%v", result.ErrCode, result.ErrMsg)
		return
	}
	return
}

// 微信小程序access_token
type AccessToken struct {
	CommonError

	AccessToken string `json:"access_token"`
	ExpiresIn   int64  `json:"expires_in"`
}

/**
获取token
tp则代表类型， 0是微信公众号token 2是小程序的token
*/
func GetAccessToken(ctx context.Context, wxTokenModel mysql.WxTokenModel, miniAppid, miniAppSecret string, tp int64) (token string, err error) {
	item, err := wxTokenModel.FindOneByType(ctx, tp)
	//fmt.Println("token:", item, miniAppid, miniAppSecret, tp, err)
	if err != nil && err != mysql.ErrNotFound {
		err = xerr.NewErrMsg(fmt.Sprintf("数据库查找Token失败err: %+v", err))
		logx.WithContext(ctx).Error(err)
		return "", err
	}
	var nowTime = time.Now()
	//defaultTime := nowTime.Unix() - 10
	if item == nil {
		//未查询到相关信息
		urlStr := fmt.Sprintf(accessTokenURL, miniAppid, miniAppSecret)

		AccessToken, err := getTokenFromServer(ctx, urlStr)
		if err != nil {
			logx.Error("getTokenFromServer0:::", err)
			return "", err
		}
		token = AccessToken.AccessToken
		tokenInfo := &mysql.WxToken{
			Appid:      miniAppid,
			Token:      token,
			ExpireTime: nowTime.Add(time.Hour * 1).Unix(),
			Tp:         tp,
		}

		_, err = wxTokenModel.Insert(ctx, tokenInfo)
		if err != nil {
			return "", err
		}
		return token, nil

	} else {

		timeCheck := nowTime.Unix() - item.ExpireTime
		if timeCheck >= 0 { //过期重新获取

			urlStr := fmt.Sprintf(accessTokenURL, miniAppid, miniAppSecret)
			AccessToken, err1 := getTokenFromServer(ctx, urlStr)
			if err1 != nil {
				logx.Error("getTokenFromServer1:::", err1)
				return "", err1
			}
			token = AccessToken.AccessToken
			tokenInfo := &mysql.WxToken{
				Appid:      miniAppid,
				Token:      token,
				ExpireTime: nowTime.Add(time.Hour * 1).Unix(),
				Tp:         tp,
			}

			err = wxTokenModel.Update(ctx, tokenInfo)
			if err != nil {
				logx.Error("数据库直接查询access_token错误:::", err)
				//return "", xerr.NewErrMsg(fmt.Sprintf("access_token更新失败 err: %+v", err))
				return "", err
			}
			return token, nil
		} else {
			logx.Info("数据库直接查询access_token结果:::", item.Token)
			return item.Token, nil
		}
	}

}

// 从微信服务器请求数据
func getTokenFromServer(ctx context.Context, url string) (AccessToken AccessToken, err error) {
	var body []byte
	body, err = HTTPGet(ctx, url)
	if err != nil {
		return
	}
	err = json.Unmarshal(body, &AccessToken)
	if err != nil {
		return
	}
	if AccessToken.ErrCode != 0 {
		err = fmt.Errorf("get access_token error : errcode=%v , errormsg=%v", AccessToken.ErrCode, AccessToken.ErrMsg)
		return
	}
	return
}

// ResTicket 请求jsapi_tikcet返回结果
type ResTicket struct {
	CommonError

	Ticket    string `json:"ticket"`
	ExpiresIn int64  `json:"expires_in"`
}

func GetJsapiTicket(ctx context.Context, appid, secret string, wxTokenModel mysql.WxTokenModel) (string, error) {
	item, err := wxTokenModel.FindOneByType(ctx, 1)
	if err != nil && err != mysql.ErrNotFound {
		err = xerr.NewErrCodeMsg(xerr.SERVER_COMMON_ERROR, fmt.Sprintf("接口GetJsapiTicket发生异常%v", err))
		logx.WithContext(ctx).Error(err)
		return "", err
	}

	var nowTime = time.Now()

	if err == mysql.ErrNotFound { //查不到就新增
		err = nil

		ticketInfo, err := GetTicketFromServer(ctx, appid, secret, wxTokenModel)
		if err != nil {
			logx.WithContext(ctx).Error("GetTicketFromServer:::", err)
			return "", err
		}
		tokenInfo := &mysql.WxToken{
			Appid:      appid,
			Token:      ticketInfo.Ticket,
			ExpireTime: nowTime.Add(time.Hour * 1).Unix(),
			Tp:         1,
		}

		_, err = wxTokenModel.Insert(ctx, tokenInfo)
		if err != nil {
			return "", errors.Wrapf(err, "--access_ticket insert err : %+v", err)
		}
		return ticketInfo.Ticket, nil
	} else {
		checkTime := nowTime.Unix() - item.ExpireTime
		if checkTime > 0 { //token过期，重新获取

			ticketInfo, err := GetTicketFromServer(ctx, appid, secret, wxTokenModel)
			if err != nil {
				logx.WithContext(ctx).Error("GetTicketFromServer:::", err)
				return "", err
			}

			tokenInfo := &mysql.WxToken{
				Id:         item.Id,
				Appid:      appid,
				Token:      ticketInfo.Ticket,
				ExpireTime: nowTime.Add(time.Hour * 1).Unix(),
				Tp:         1,
			}

			err = wxTokenModel.Update(ctx, tokenInfo)
			if err != nil {
				err = xerr.NewErrCodeMsg(xerr.FAIL, fmt.Sprintf("GetJsapiTicket更新失败:%v", err))
				logx.WithContext(ctx).Error("wxTokenModel.Update ticker err:::", err)
				return "", err
			}
			return ticketInfo.Ticket, nil

		} else { //直接从数据库获取
			logx.Info("数据库返回GetJsapiTicket数据:", item.Token)
			return item.Token, nil
		}

	}
}

// GetTicket 获取jsapi_ticket
func GetTicketFromServer(ctx context.Context, appid, secret string, wxTokenModel mysql.WxTokenModel) (ticket ResTicket, err error) {
	//先获取access_token
	accessToken, err := GetAccessToken(ctx, wxTokenModel, appid, secret, 0)
	if err != nil {
		logx.WithContext(ctx).Error("数据库直接查询access_token错误:::", err)
		err = xerr.NewErrCodeMsg(xerr.FAIL, fmt.Sprintf("GetJsapiTicket获取getAccessToken失败%v", err))
		return
	}
	//发起请求
	url := fmt.Sprintf(getTicketURL, accessToken)

	var response []byte
	response, err = HTTPGet(ctx, url)
	if err != nil {
		return
	}
	err = json.Unmarshal(response, &ticket)
	if err != nil {
		return
	}
	if ticket.ErrCode != 0 {
		err = fmt.Errorf("getTicket Error : errcode=%d , errmsg=%s", ticket.ErrCode, ticket.ErrMsg)
		return
	}
	return
}

/**
获取随机数
*/
func GetNonceStr(length int) string {
	var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	b := make([]rune, length)
	for i := range b {
		b[i] = letters[r.Intn(len(letters))]
	}
	return string(b)
}

func DownFileByIUtil(mediaId string, accessToken string) ([]byte, error) {
	url := fmt.Sprintf(getMediaUrl, accessToken, mediaId)
	logx.Info("对应的下载URL参数:", url)
	resp, err := http.Get(url)
	if err != nil {
		err = xerr.NewErrMsg(fmt.Sprintf("下载http.Get失败err: %+v", err))
		logx.Error(err)
		return nil, err
	}
	fmt.Println("DownFileByIUtil:", resp.Header)
	body, err := io.ReadAll(resp.Body)
	err = resp.Body.Close()
	if err != nil {
		err = xerr.NewErrMsg(fmt.Sprintf("读取io.ReadAll失败err: %+v", err))
		logx.Error(err)
		return nil, err
	}

	return body, nil
}
