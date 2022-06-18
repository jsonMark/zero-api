package jwt

import (
	"github.com/golang-jwt/jwt"
)


/**
* @Description 生成jwt
* @Author
* @Date 2022/04/04
* @Version
**/

/**
* @  使用方式
	claims := make(map[string]interface{})

	claims["Id"] = item.Id
	claims["Username"] = item.Username

	now := time.Now().Unix()
	var accessExpire = l.svcCtx.Config.Auth.AccessExpire
	accessToken, err := jwt.GenToken(now, l.svcCtx.Config.Auth.AccessSecret, claims, accessExpire)
* @
**/

func GenToken(iat int64, secretKey string, payloads map[string]interface{}, seconds int64) (string, error) {
	claims := make(jwt.MapClaims)
	claims["exp"] = iat + seconds
	claims["iat"] = iat
	for k, v := range payloads {
		claims[k] = v
	}

	token := jwt.New(jwt.SigningMethodHS256)
	token.Claims = claims

	return token.SignedString([]byte(secretKey))
}
