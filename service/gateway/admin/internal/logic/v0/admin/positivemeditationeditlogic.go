package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationEditLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationEditLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationEditLogic {
	return &PositiveMeditationEditLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationEditLogic) PositiveMeditationEdit(req *types.PositiveMeditationEditReq) error {
	// todo: add your logic here and delete this line

	return nil
}
