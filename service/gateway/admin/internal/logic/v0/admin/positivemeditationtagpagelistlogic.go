package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationTagPageListLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationTagPageListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationTagPageListLogic {
	return &PositiveMeditationTagPageListLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationTagPageListLogic) PositiveMeditationTagPageList(req *types.PositiveMeditationTagListReq) (resp *types.PositiveMeditationTagPageListResp, err error) {
	// todo: add your logic here and delete this line

	return
}
