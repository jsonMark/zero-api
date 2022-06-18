package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationTagDelLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationTagDelLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationTagDelLogic {
	return &PositiveMeditationTagDelLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationTagDelLogic) PositiveMeditationTagDel(req *types.PositiveMeditationTagDelReq) error {
	// todo: add your logic here and delete this line

	return nil
}
