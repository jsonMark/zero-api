package rediskey

import "fmt"


//暂时没使用

const TokenExpireDuration =  60 * 60 * 24 * 30 // 过期时间(秒)
const EmotionExpireDuration =  60 * 60 * 24 * 30 // 过期时间(秒)
const (
	SessionKey = "session" //session的key值,放redis代替之前的session
	StackKey = "stack"
	ModuleKey = "module"
	//EmotionKey = "emotion"
	DiaryKey = "diary"
	GlobalTimeRangeKey = "%d-全局_时间段"
)

//商户后台首页活跃用户key
func GetSessionKey(userId int64) string {
	return fmt.Sprintf(SessionKey+"_%d",userId)
}

func GetStackKey(userId int64) string {
	return fmt.Sprintf(StackKey+"_%d",userId)
}

func GetModuleKey(userId int64) string {
	return fmt.Sprintf(ModuleKey+"_%d",userId)
}

func GetDiaryKey(userId int64) string {
	return fmt.Sprintf(DiaryKey+"_%d",userId)
}

func GetGlobalTimeRangeKey(userId int64) string {
	return fmt.Sprintf(GlobalTimeRangeKey,userId)
}

/*func GetEmotionKey(userId int64) string {
	return fmt.Sprintf(EmotionKey+"_%d",userId)
}*/