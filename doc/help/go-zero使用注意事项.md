# go-zero使用注意事项
## 强制性要求:


### 日志处理:
1.【强制要求】错误日志[必须]统一使用logx包,业务层面[可以]不需要打印错误。开发阶段非return参数调试性质的fmt.Println()可以使用，上线前需要删除。
2.【强制要求】return 返回的错误[禁止]使用fmt系列函数。
3.【强制要求】使用fmt.Println()等方法只能在console控制台输出，一旦切换到容器环境运行这种方式打印的错误就会丢失。
4. 【说明】
(1). 使用fmt.Println()等方法只能在console控制台输出，一旦切换到容器环境运行这种方式打印的错误就会丢失。
(2). 所有的error都会在文件zero-api/common/interceptor/rpcserver/loggerInterceptor.go和zero-api/common/result/httpResult.go使用logx包封装统一处理。
(3). 数据库和框架级别错误统一在zero-api/common/result/httpResult.go过滤了,不会给用户展示。


### 错误处理:
1. 【强制要求】rpc模块return返回的错误统一使用:
```go
return nil, errors.Wrapf(xerr.NewErrCode(xerr.SERVER_COMMON_ERROR), "系统异常 err:%v in : %+v", err, in)
//1). errors.Wrapf包目的是将RPC的错误通过指定方式包装，方便在api模块解析成指定格式，最终形成统一响应值格式。
//2). xerr.NewErrCode作用是统一错误格式。
```
2. api模块错误统一处理:
   (1). 【强制要求】rpc返回的错误直接返回，不需要再做处理
```go
	if err != nil {
		return nil, err
	}
```
   (2).【强制要求】api模块逻辑错误使用如下方式返回
```go
    return nil, xerr.NewErrCodeMsg(xerr.FAIL, "userId获取失败")
    return nil, xerr.NewErrCode(xerr.FAIL)
```
3. 其他


### Model模块:
1. 【强制要求】生成命令统一使用goctl model mysql datasource命令，这一块代码模板没有修改。
```go
goctl model mysql datasource -url="root:123456@tcp(127.0.0.1:3306)/cbt" -table="answers"  -dir="./"
```
2. 【强制要求】每次修改数据库[必须]重新生成XXX_gen.go的model文件，并且检查XXX.go的model文件对应的方法是否需要重新修改。


### RPC模块:
```go
//项目根目录zero-api下执行,你自己不需要修改，直接复制粘贴即可
goctl rpc protoc service/rpc/proto/chat.proto --go_out=service/rpc/zrpc/Chat  --go-grpc_out=service/rpc/zrpc/Chat  --zrpc_out=service/rpc/zrpc/Chat   --home template/.goctl

//【说明】:
//--go_out=service/rpc/zrpc/Chat  --go-grpc_out=service/rpc/zrpc/Chat     --go_out=和--go-grpc_out=参数必须保持一致，这是传递给grpc插件的参数
//--home template/.goctl  指定自定义修改的模板目录，当前goctl是1.3.5，会使用zero-api/template/.goctl/1.3.5下面的模板
```


### Api模块命令
【说明】 当前只有web模块，你在项目根目录下面执行如下命令即可，不需要做任何修改
```go
goctl api go -api service/gateway/admin/api/gateway.api -dir service/gateway/admin  --home template/.goctl

```

