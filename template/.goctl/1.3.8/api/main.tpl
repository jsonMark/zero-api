package main

import (
	"zero-api/common/result"
	"zero-api/common/xerr"
	"flag"
	"fmt"
    "github.com/zeromicro/go-zero/rest/httpx"
	{{.importPackages}}
)

var configFile = flag.String("f", "etc/{{.serviceName}}.yaml", "the config file")

func main() {
	flag.Parse()

	var c config.Config
	conf.MustLoad(*configFile, &c)

	//server := rest.MustNewServer(c.RestConf)


    //自定义jwt错误信息
    server := rest.MustNewServer(c.RestConf, rest.WithCors(), rest.WithUnauthorizedCallback(func(w http.ResponseWriter, r *http.Request, err error) {
        authErr := xerr.NewErrCode(xerr.TOKEN_GENERATE_ERROR)
        var resp interface{}
        result.HttpResult(r, w, resp, authErr)

        //等同于
        //httpx.Error(w, body)
    }))
    //server = rest.MustNewServer(c.RestConf, rest.WithCors())  //解决跨域
    //server := rest.MustNewServer(c.RestConf, rest.WithCustomCors(nil, notAllowedFn,"*"))


	defer server.Stop()

	ctx := svc.NewServiceContext(c)
	handler.RegisterHandlers(server, ctx)

	// 自定义错误代码开始
	//这里主要是展示中间件的异常结果
	httpx.SetErrorHandler(func(err error) (int, interface{}) {
		switch e := err.(type) {
		case *xerr.CodeError:
			return http.StatusOK, e.Error()
		default:
			return http.StatusInternalServerError, nil
		}
	})
	// 自定义错误代码结束


	fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
	server.Start()
}
