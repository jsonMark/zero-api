package admin

import (
	"net/http"
	"zero-api/common/result"

	"github.com/zeromicro/go-zero/rest/httpx"
	"zero-api/service/gateway/admin/internal/logic/v0/admin"
	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"
)

func PositiveMeditationTagDelHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.PositiveMeditationTagDelReq
		if err := httpx.Parse(r, &req); err != nil {
			//httpx.Error(w, err)
			result.ParamErrorResult(r, w, err)
			return
		}

		l := admin.NewPositiveMeditationTagDelLogic(r.Context(), svcCtx)
		err := l.PositiveMeditationTagDel(&req)
		result.HttpResult(r, w, nil, err)
	}
}
