package xerr

//成功返回
const OK uint32 = 200

/**(前3位代表业务,后三位代表具体功能)**/

//全局错误码
const SERVER_COMMON_ERROR uint32 = 100001
const REUQEST_PARAM_ERROR uint32 = 100002
//const TOKEN_EXPIRE_ERROR uint32 = 100003
const TOKEN_GENERATE_ERROR uint32 = 100004
const DB_ERROR uint32 = 100005
const DB_UPDATE_AFFECTED_ZERO_ERROR uint32 = 100006

const PAGE_NOT_FOUND uint32 = 404000
const NOT_ALLOWED uint32 = 502000
const FAIL uint32 = 101001

//验签中间件
//const SIGN_PARAM_ERROR uint32 = 100020
//const SIGN_CHECK_ERROR uint32 = 100021

//用户模块
const USER_NOT_FOUND_ERROR uint32 = 100030    // 未找到用户
const USER_INCORRECT_PASSWORD uint32 = 100031 // 密码错误
const USER_FAIL uint32 = 100032               // 操作失败
const USER_PASSWORD_ERROR uint32 = 100033     // 用户名或密码错误

//wx_token表模块
const WX_TOKEN_NOT_FOUND_ERROR uint32 = 100040
const WX_TOKEN_FAIL uint32 = 100041

//chat模块
const CHAT_FAIL uint32 = 100051

// 注册模块
const REGISTER_PASSWD_NOT_MATCH uint32 = 100060 // 两次输入的密码不同
const REGISTER_USER_EXIST uint32 = 100061       // 用户已存在
const REGISTER_PASSWD_SHORT uint32 = 100062     // 密码不能小于6位
const REGISTER_USERNAME_EMPTY uint32 = 100063   // 用户名不能为空
