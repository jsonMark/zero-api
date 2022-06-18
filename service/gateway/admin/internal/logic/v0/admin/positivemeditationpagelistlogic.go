package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationPageListLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationPageListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationPageListLogic {
	return &PositiveMeditationPageListLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationPageListLogic) PositiveMeditationPageList(req *types.PositiveMeditationListReq) (resp *types.PositiveMeditationPageListResp, err error) {
	// todo: add your logic here and delete this line

	return
}
