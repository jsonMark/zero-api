package xmind

import (
	"errors"
	"fmt"
	"io"
	"log"
	"mime/multipart"
	"os"
	"path"
	"time"
)

// 上传XMind日志
func SaveLog(logFile, logLine string) {
	if logFile == "" {
		return
	}

	file, err := os.OpenFile(logFile, os.O_CREATE|os.O_RDWR|os.O_APPEND, os.ModePerm)
	if err != nil {
		log.Printf("failed to open file %s, error: %s", logFile, err)
		return
	}
	defer file.Close()
	file.WriteString(fmt.Sprintf("%s\n", logLine))
}

// 保存xmind文件
func SaveUploadFile(file *multipart.FileHeader, savePath string, userId int64) (string, error) {
	uploadFile := file.Filename
	fileType := path.Ext(uploadFile)
	if fileType != ".xmind" {
		line := fmt.Sprintf("invalid file: %s", uploadFile)
		log.Print(line)
		return "", errors.New("文件格式错误")
	}
	xmindFile := fmt.Sprintf("%s/user_%d_%s_%s", savePath, userId,
		time.Now().Format("2006-01-02_15-04-05"), uploadFile)
	f, err := file.Open()
	defer f.Close()
	if err != nil {
		line := fmt.Sprintf("save file fail: %s", uploadFile)
		log.Print(line)
		return "", errors.New("保存文件失败")
	}
	dst, err := os.Create(xmindFile)
	defer dst.Close()
	if err != nil {
		line := fmt.Sprintf("save file fail: %s", uploadFile)
		log.Print(line)
		return "", errors.New("保存文件失败")
	}
	if _, err = io.Copy(dst, f); err != nil {
		line := fmt.Sprintf("save file fail: %s", uploadFile)
		log.Print(line)
		return "", errors.New("保存文件失败")
	}
	return xmindFile, nil
}
