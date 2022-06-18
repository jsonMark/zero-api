package sign

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"strings"
)

func Md5(text string) string {
	h := md5.New()
	h.Write([]byte(text))                 //
	return hex.EncodeToString(h.Sum(nil)) // 输出加密结果
}

//md5加盐
func Md5WithSalt(str string) string {
	salt := "#!@W.?Q"
	return Md5CryptWithSalt(str,salt)
}


//给字符串生成md5
//@params str 需要加密的字符串
//@params salt interface{} 加密的盐
//@return str 返回md5码
func Md5CryptWithSalt(str string, salt ...interface{}) (CryptStr string) {
	if l := len(salt); l > 0 {
		slice := make([]string, l+1)
		str = fmt.Sprintf(str+strings.Join(slice, "%v"), salt...)
	}
	return fmt.Sprintf("%x", md5.Sum([]byte(str)))
}

