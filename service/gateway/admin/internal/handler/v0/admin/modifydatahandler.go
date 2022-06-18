package admin

import (
	"net/http"
	"zero-api/common/result"

	"github.com/zeromicro/go-zero/rest/httpx"
	"zero-api/service/gateway/admin/internal/logic/v0/admin"
	"zero-api/service/gateway/admin/internal/svc"
)

func ModifyDataHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		l := admin.NewModifyDataLogic(r.Context(), svcCtx)
		err := l.ModifyData()
		result.HttpResult(r, w, nil, err)
	}
}
