package sign

import (
	"fmt"
	"github.com/zeromicro/go-zero/core/logx"
	"reflect"
	"sort"
)

type CRPC struct {
	Host      string
	AppId     string
	SecretKey string
}

func  New() *CRPC {
	return &CRPC{
		Host: "127.0.0.1",
		AppId: "111",
		SecretKey: "SFDFSD",
	}
}

//使用反射方法将结构体组装成map[string]string格式
func (self *CRPC) BreedMap(input interface{}) map[string]string{
	getType := reflect.TypeOf(input)
	getValue := reflect.ValueOf(input)

	var signMap = make(map[string]string,getType.NumField())
	for i := 0; i < getType.NumField(); i++ {
		field := getType.Field(i)
		value := getValue.Field(i).Interface()
		if field.Name != "Sign"{
			strValue := fmt.Sprintf("%v", value)
			signMap[field.Name] = strValue
		}
		//fmt.Printf("%s: %v = %v\n", field.Name, field.Type, value)
	}
	return signMap
}



// 創建簽名數據
func (self *CRPC) Sign(params map[string]string) string {
	var keys []string
	for k := range params {
		keys = append(keys, k)
	}
	// 排序
	sort.Strings(keys)

	//拼接
	var dataParams = "appkey=" + self.SecretKey
	for _, k := range keys {
		// 去除sign字段
		if k != "sign" {
			dataParams += "&" + k + "=" + params[k]
		}
	}
	logx.Info("sign params:", dataParams)
	// 获取签名
	return Md5(dataParams)
}


// 創建簽名數據
func (self *CRPC) SignWithKey(secretKey string, params map[string]string) string {
	var keys []string
	for k := range params {
		keys = append(keys, k)
	}
	// 排序
	sort.Strings(keys)

	//拼接
	var dataParams = "appkey=" + secretKey
	for _, k := range keys {
		// 去除sign字段
		if k != "sign" {
			dataParams += "&" + k + "=" + params[k]
		}
	}
	logx.Info("sign params:", dataParams)
	// 获取签名
	return Md5(dataParams)
}