package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationDelLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationDelLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationDelLogic {
	return &PositiveMeditationDelLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationDelLogic) PositiveMeditationDel(req *types.PositiveMeditationDelReq) error {
	// todo: add your logic here and delete this line

	return nil
}
