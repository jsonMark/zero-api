package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationCategoryDelLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationCategoryDelLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationCategoryDelLogic {
	return &PositiveMeditationCategoryDelLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationCategoryDelLogic) PositiveMeditationCategoryDel(req *types.PositiveMeditationCategoryDelReq) error {
	// todo: add your logic here and delete this line

	return nil
}
