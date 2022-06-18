package qiniu

import (
	"context"
	"fmt"
	"github.com/qiniu/go-sdk/v7/auth"
	"github.com/qiniu/go-sdk/v7/auth/qbox"
	"github.com/qiniu/go-sdk/v7/storage"
	"github.com/zeromicro/go-zero/core/logx"
)

type QiNiu struct {
	AccessKey string
	SecretKey string
	Bucket    string
	QiNiuAddr string
	Domain    string
}


// 上传图片到七牛云，然后返回状态和图片的url
func (l *QiNiu) GetToken() (upToken string, domain string, qiNiuAddr string) {

	putPolicy := storage.PutPolicy{
		Scope: l.Bucket,
	}

	mac := qbox.NewMac(l.AccessKey, l.SecretKey)

	// 获取上传凭证
	token := putPolicy.UploadToken(mac)

	return token, l.Domain, l.QiNiuAddr
}

//上传文件
func (l *QiNiu) UploadToQiNiu(key string, localFile string) (int, string) {
	fmt.Println("------UploadToQiNiu :")

	putPlicy := storage.PutPolicy{
		Scope: l.Bucket,
	}
	mac := qbox.NewMac(l.AccessKey, l.SecretKey)

	// 获取上传凭证
	upToken := putPlicy.UploadToken(mac)
	fmt.Println("------upToken :", upToken)

	// 配置参数
	cfg := storage.Config{
		Zone:          &storage.ZoneHuanan, // 华南区
		UseCdnDomains: false,               //使用cdn
		UseHTTPS:      false,               // 非https
	}
	formUploader := storage.NewFormUploader(&cfg)

	ret := storage.PutRet{}        // 上传后返回的结果
	putExtra := storage.PutExtra{} // 额外参数

	// 上传 自定义key，可以指定上传目录及文件名和后缀，
	err := formUploader.PutFile(context.Background(), &ret, upToken, key, localFile, &putExtra)

	if err != nil {
		logx.Error("上传七牛云失败:", err)
		code := 501
		return code, err.Error()
	}

	url := l.QiNiuAddr + ret.Key // 返回上传后的文件访问路径
	fmt.Println("------QiniuAddr :", url)
	return 0, url
}

func (l *QiNiu) ListFiles(prefix, delimiter, marker string, limit int) (entries []storage.ListItem,
	commonPrefixes []string, nextMarker string, hasNext bool, err error) {

	bucketManager := storage.NewBucketManager(&auth.Credentials{
		l.AccessKey,
		[]byte(l.SecretKey),
	}, nil)

	return bucketManager.ListFiles(l.Bucket, prefix, delimiter, marker, limit)
}
