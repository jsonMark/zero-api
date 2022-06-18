package admin

import (
	"net/http"
	"zero-api/common/result"

	"github.com/zeromicro/go-zero/rest/httpx"
	"zero-api/service/gateway/admin/internal/logic/v0/admin"
	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"
)

func PositiveMeditationTagEditHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.PositiveMeditationTagEditReq
		if err := httpx.Parse(r, &req); err != nil {
			//httpx.Error(w, err)
			result.ParamErrorResult(r, w, err)
			return
		}

		l := admin.NewPositiveMeditationTagEditLogic(r.Context(), svcCtx)
		err := l.PositiveMeditationTagEdit(&req)
		result.HttpResult(r, w, nil, err)
	}
}
