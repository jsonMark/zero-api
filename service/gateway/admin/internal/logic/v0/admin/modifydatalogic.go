package admin

import (
	"context"

	"github.com/zeromicro/go-zero/core/logx"
	"zero-api/service/gateway/admin/internal/svc"
)

type ModifyDataLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewModifyDataLogic(ctx context.Context, svcCtx *svc.ServiceContext) *ModifyDataLogic {
	return &ModifyDataLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *ModifyDataLogic) ModifyData() error {
	// todo: add your logic here and delete this line

	return nil
}
