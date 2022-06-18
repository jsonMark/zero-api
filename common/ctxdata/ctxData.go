package ctxdata

import (
	"context"
	"encoding/json"
)


//从ctx获取uid  数据未使用
var CtxKeyJwtUserId = "jwtUserId"

func GetUidFromCtx(ctx context.Context) int64 {
	uid, _ := ctx.Value(CtxKeyJwtUserId).(int64)
	return uid
}


//从Context获取userId
func GetUserIdFromCtx(ctx context.Context) (int64, error) {
	IdNumber := ctx.Value("UserId")
	userId, err := IdNumber.(json.Number).Int64()
	return userId, err
}
