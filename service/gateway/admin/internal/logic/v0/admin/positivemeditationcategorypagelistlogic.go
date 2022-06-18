package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PositiveMeditationCategoryPageListLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewPositiveMeditationCategoryPageListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PositiveMeditationCategoryPageListLogic {
	return &PositiveMeditationCategoryPageListLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PositiveMeditationCategoryPageListLogic) PositiveMeditationCategoryPageList(req *types.PositiveMeditationCategoryListReq) (resp *types.PositiveMeditationCategoryPageListResp, err error) {
	// todo: add your logic here and delete this line

	return
}
