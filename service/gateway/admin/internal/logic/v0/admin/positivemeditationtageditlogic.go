package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationTagEditLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationTagEditLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationTagEditLogic {
	return &PositiveMeditationTagEditLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationTagEditLogic) PositiveMeditationTagEdit(req *types.PositiveMeditationTagEditReq) error {
	// todo: add your logic here and delete this line

	return nil
}
