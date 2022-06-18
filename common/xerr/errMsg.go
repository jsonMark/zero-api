package xerr

var message map[uint32]string

func init() {
	message = make(map[uint32]string)
	message[OK] = "SUCCESS"
	message[FAIL] = "失败！"
	message[PAGE_NOT_FOUND] = "页面不存在!"
	message[NOT_ALLOWED] = "当前请求路径不存在!"
	message[SERVER_COMMON_ERROR] = "服务器开小差啦,稍后再来试一试"
	message[REUQEST_PARAM_ERROR] = "参数错误"
	//message[TOKEN_EXPIRE_ERROR] = "token失效，请重新登陆"
	message[TOKEN_GENERATE_ERROR] = "登录过期,请重新登录"
	message[DB_ERROR] = "数据库繁忙,请稍后再试"
	message[DB_UPDATE_AFFECTED_ZERO_ERROR] = "更新数据影响行数为0"
	//message[SIGN_PARAM_ERROR] = "解签失败"
	//message[SIGN_CHECK_ERROR] = "验签失败"
	message[USER_NOT_FOUND_ERROR] = "用户数据不存在"
	message[WX_TOKEN_NOT_FOUND_ERROR] = "用户数据不存在"
	message[WX_TOKEN_FAIL] = "更新过期时间失败"
	message[CHAT_FAIL] = "操作失败"
	message[USER_INCORRECT_PASSWORD] = "密码不正确"
	message[USER_FAIL] = "登录失败"
	message[USER_PASSWORD_ERROR] = "用户名或者密码错误"
	message[REGISTER_PASSWD_NOT_MATCH] = "两次输入的密码不同"
	message[REGISTER_USER_EXIST] = "用户已存在"
	message[REGISTER_PASSWD_SHORT] = "密码不能小于6位"
	message[REGISTER_USERNAME_EMPTY] = "用户名不能为空"
}

func MapErrMsg(errcode uint32) string {
	if msg, ok := message[errcode]; ok {
		return msg
	} else {
		return "服务器开小差啦,稍后再来试一试"
	}
}

func IsCodeErr(errcode uint32) bool {
	if _, ok := message[errcode]; ok {
		return true
	} else {
		return false
	}
}
