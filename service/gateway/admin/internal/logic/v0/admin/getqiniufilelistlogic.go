package admin

import (
	"context"

	"zero-api/service/gateway/admin/internal/svc"
	"zero-api/service/gateway/admin/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type GetQiNiuFileListLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewGetQiNiuFileListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *GetQiNiuFileListLogic {
	return &GetQiNiuFileListLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *GetQiNiuFileListLogic) GetQiNiuFileList(req *types.QiniuFileListReq) (resp *types.QiniuFileListResp, err error) {
	// todo: add your logic here and delete this line

	return
}
