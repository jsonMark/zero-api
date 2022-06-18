package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type GenerateTokenLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewGenerateTokenLogic(ctx context.Context, svcCtx *svc.ServiceContext) *GenerateTokenLogic {
	return &GenerateTokenLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *GenerateTokenLogic) GenerateToken() (resp *types.GenerateTokenResp, err error) {
	// todo: add your logic here and delete this line

	return
}
