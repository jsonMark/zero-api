package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationCategoryEditLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationCategoryEditLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationCategoryEditLogic {
	return &PositiveMeditationCategoryEditLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationCategoryEditLogic) PositiveMeditationCategoryEdit(req *types.PositiveMeditationCategoryEditReq) error {
	// todo: add your logic here and delete this line

	return nil
}
