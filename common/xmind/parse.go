package xmind

import (
	"archive/zip"
	"bytes"
	"encoding/json"
	"fmt"
	jsoniter "github.com/json-iterator/go"
	"zero-api/common/tool"
	"io"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

type xmindParser struct {
	xmindFile         string                 // xmind文件
	logFile           string                 // 解析日志
	tmpFile           string                 // xmind文件解压后的json格式临时文件
	Data              map[string]interface{} // 解析后的json格式对话数据
	ModulesDeclared   []string               // 声明过的模块
	ModulesReferenced []string               // 引用过的模块
}

var (
	//chatDataPath = "./service/rpc/zrpc/Chat/xmind"
	chatData jsoniter.Any
)

// 创建xmindParser实例
func NewParse(xmindFile string, logFile string) xmindParser {
	// 创建并返回实例
	tmpFile := fmt.Sprintf("%s.tmp", xmindFile)
	xp := xmindParser{
		xmindFile,
		logFile,
		tmpFile,
		nil,
		nil,
		nil,
	}

	return xp
}

// 获取XMind的解析数据
func NewXmind(chatDataPath string) jsoniter.Any {

	data := make(map[string]interface{})
	os.MkdirAll(fmt.Sprintf("%s/cache", chatDataPath), 0766)
	rd, err := ioutil.ReadDir(chatDataPath)
	//设置一个标识符，看看是否正常加载启动
	is_correct := false

	for _, f := range rd {
		filename := f.Name()
		if len(filename) <= 6 || filename[len(filename)-6:] != ".xmind" {
			continue
		}
		xmindFile := fmt.Sprintf("%s/%s", chatDataPath, filename)
		tmpFile := fmt.Sprintf("%s/cache/%s.tmp", chatDataPath, filename)

		xmindInstance := NewParse(xmindFile, "")
		// 解压缩xmind文件
		err := xmindInstance.unzipChatData()
		if err != nil {
			log.Fatal("failed to unzip file:", err, xmindFile)
			return nil
		}
		// 转换格式
		err = xmindInstance.ExportXmind()
		if err != nil {
			log.Fatal("failed to unzip file1: %s", err, xmindFile)
			return nil
		}
		// 移除临时文件
		os.Remove(tmpFile)

		for k, v := range xmindInstance.Data {
			data[k] = v
		}
		is_correct = true
	}
	if !is_correct {
		log.Fatal("没有正确加载xmind语料文件,检查启动路径")
		return nil
	}
	bs, err := json.Marshal(data)
	if err != nil {
		log.Printf("failed to marshal data: %s", err)
		return nil
	}
	chatData = jsoniter.Get(bs)
	return chatData
}

// 保存xmind解析日志
func (xmind *xmindParser) saveLog(line string) {
	if xmind.logFile == "" {
		return
	}

	file, err := os.OpenFile(xmind.logFile, os.O_CREATE|os.O_RDWR|os.O_APPEND, os.ModePerm)
	if err != nil {
		log.Printf("failed to open file %s, error: %s", xmind.logFile, err)
		return
	}
	defer file.Close()
	file.WriteString(fmt.Sprintf("%s\n", line))
}

// 检查对话数据是否存在错误
func (xmind *xmindParser) checkContent(isReply bool, nodeText string) {
	if strings.Contains(nodeText, "｛") || strings.Contains(nodeText, "｝") {
		xmind.saveLog("ERROR - 标记错误 —— 变量引用不应使用全角大括号")
		xmind.saveLog(nodeText)
	}
	if strings.Contains(nodeText, "{") && strings.Contains(nodeText, "}") &&
		!(strings.Contains(nodeText, "{{") && strings.Contains(nodeText, "}}")) {
		xmind.saveLog("ERROR - 标记错误 —— 变量引用应使用双重大括号")
		xmind.saveLog(nodeText)
	}

	if isReply {
		if strings.Contains(nodeText[:3], "：") {
			xmind.saveLog("ERROR - 应答标记错误 —— 输入框不应以中文冒号起始")
			xmind.saveLog(nodeText)
		} else if nodeText[:1] != ">" && nodeText[:1] != ":" {
			xmind.saveLog("ERROR - 应答标记错误 —— 应答内容应以'>'或':'起始")
			xmind.saveLog(nodeText)
		}

		if strings.Contains(nodeText, "＞") {
			xmind.saveLog("ERROR - 应答标记错误 —— 按钮不应以全角'＞'起始")
			xmind.saveLog(nodeText)
		}
		if strings.Contains(nodeText, "｜") {
			xmind.saveLog("ERROR - 应答标记错误 —— 按钮或输入框内的变量不应以全角'｜'标记")
			xmind.saveLog(nodeText)
		}
		if strings.Contains(nodeText, "＝") {
			xmind.saveLog("ERROR - 应答标记错误 —— 按钮内的变量不应以全角'＝'赋值")
			xmind.saveLog(nodeText)
		}
	} else {
		if nodeText[:1] == "#" {
			// 加入模块引用列表，用于检查错误
			moduleName := strings.TrimSpace(nodeText[1:])
			if !tool.InStrings(moduleName, xmind.ModulesReferenced) {
				xmind.ModulesReferenced = append(xmind.ModulesReferenced, moduleName)
			}
		}

		if nodeText[:4] == "goto" && nodeText[:7] == "goto：" {
			xmind.saveLog("ERROR - 模块标记错误 —— 模块跳转不应以全角'：'标记")
			xmind.saveLog(nodeText)
		}

		if strings.Contains(nodeText, "｜") {
			xmind.saveLog("ERROR - 变量标记错误 —— 消息中的变量不应以全角'｜'标记")
			xmind.saveLog(nodeText)
		}
		if strings.Contains(nodeText[:3], "＃") {
			xmind.saveLog("ERROR - 模块标记错误 —— 模块不应以全角'＃'标记")
			xmind.saveLog(nodeText)
		}
		if nodeText[:1] == ">" || strings.Contains(nodeText[:3], "＞") {
			xmind.saveLog("ERROR - 消息标记错误 —— 消息句首不应出现'>'")
			xmind.saveLog(nodeText)
		}
		if nodeText[:1] == ":" || strings.Contains(nodeText[:3], "：") {
			xmind.saveLog("ERROR - 消息标记错误 —— 消息句首不应出现冒号")
			xmind.saveLog(nodeText)
		}
	}
}

// 创建新json结点
func (xmind *xmindParser) newNode(nodeText string) map[string]interface{} {
	data := make(map[string]interface{})
	nodeText = strings.TrimSpace(nodeText)

	// data["type"] - 0: 文本; 1: 模块; 2 强制跳转模块
	if nodeText[:1] == "#" {
		// 模块，格式 - "# module name"
		data["type"] = 1
		data["text"] = strings.TrimSpace(nodeText[1:])
	} else if len(nodeText) >= 5 && nodeText[:5] == "goto:" {
		// 跳转模块，格式 - "goto: module name"
		data["type"] = 2
		data["text"] = strings.TrimSpace(nodeText[5:])
	} else {
		data["type"] = 0
		data["text"] = nodeText
	}
	data["reply"] = []map[string]interface{}{}

	xmind.checkContent(false, nodeText)

	return data
}

// 创建新json结点
func (xmind *xmindParser) newReply(nodeText string) map[string]interface{} {
	reply := make(map[string]interface{})
	nodeText = strings.TrimSpace(nodeText)

	// reply["type"] - 0: 按钮; 1: 输入框
	if nodeText[:1] == ">" {
		reply["type"] = 0
		text := strings.TrimSpace(nodeText[1:])
		lines := strings.Split(text, "|")
		if len(lines) > 1 {
			// 带变量的按钮格式 - "> title | variable=value"
			reply["text"] = strings.TrimSpace(lines[0])
			v := strings.Split(lines[1], "=")
			if len(v) > 1 {
				reply["variable"] = strings.TrimSpace(v[0])
				reply["value"] = strings.TrimSpace(v[1])
			}
		} else {
			// 普通按钮格式 - "> title"
			reply["text"] = text
		}
	} else if nodeText[:1] == ":" {
		// 输入框，格式 - ": variable name | placeholder"
		reply["type"] = 1
		reply["text"] = strings.TrimSpace(nodeText[1:])
	} else {
		reply["type"] = 0
		reply["text"] = nodeText
	}

	xmind.checkContent(true, nodeText)

	return reply
}

// 导出attached所有结点
func (xmind *xmindParser) exportNodes(attached jsoniter.Any, nodeId *int, jsonData map[int]interface{},
	xmindId map[string]interface{}, prevNode map[string]interface{}, nodeLevel int) {

	// 生成缩进（用于打印输出）
	//tab := ""
	//for i := 0; i < nodeLevel; i++ {
	//	tab += " "
	//}

	for i := 0; i < attached.Size(); i++ {
		// 当前结点文本
		text := attached.Get(i, "title").ToString()

		// log.Printf("export %s%d - %s", tab, *nodeId, strings.Replace(text, "\n", "\\n", -1))

		// 创建新结点，插入全局json数据
		chatNode := xmind.newNode(text)
		jsonData[*nodeId] = chatNode

		// 当前结点id与chat node对应
		relationship := make(map[string]interface{})
		relationship["id"] = (*nodeId)
		relationship["node"] = chatNode
		xmindId[attached.Get(i, "id").ToString()] = relationship

		// 填充父结点reply中的next字段
		if prevNode != nil {
			prevNode["next"] = *nodeId
		}

		// 全局id自增
		(*nodeId)++

		// 检查type是否为#模块或者goto:跳转模块
		if chatNode["type"] == 1 || chatNode["type"] == 2 {
			// 递归遍历
			next := attached.Get(i, "children")
			if next.Size() > 0 {
				xmind.exportNodes(next.Get("attached"), nodeId, jsonData, xmindId, chatNode, nodeLevel+1)
			}
			// #模块/goto:模块没有reply字段
			return
		}

		// 构造replies
		children := attached.Get(i, "children")
		if children.Size() > 0 {
			items := children.Get("attached")

			replies := []map[string]interface{}{}
			for i := 0; i < items.Size(); i++ {
				reply := xmind.newReply(items.Get(i, "title").ToString())
				replies = append(replies, reply)

				// 当前结点id与chat reply对应
				relationship := make(map[string]interface{})
				relationship["id"] = (*nodeId)
				relationship["node"] = reply
				xmindId[items.Get(i, "id").ToString()] = relationship

				// 递归遍历
				next := items.Get(i, "children")
				if next.Size() > 0 {
					xmind.exportNodes(next.Get("attached"), nodeId, jsonData, xmindId, reply, nodeLevel+1)
				}
			}
			chatNode["reply"] = replies

		} else {
			xmind.saveLog("ERROR - 结构错误 —— 消息后无应答")
			xmind.saveLog(text)
		}
	}
}

// 读取xmind文件并解压content.json
func (xmind *xmindParser) unzipChatData() error {
	bs, err := ioutil.ReadFile(xmind.xmindFile)
	if err != nil {
		return err
	}

	zipReader, err := zip.NewReader(bytes.NewReader(bs), int64(len(bs)))
	if err != nil {
		return err
	}

	for _, _file := range zipReader.File {
		// log.Printf("unzip %s", _file.Name)

		if _file.Name != "content.json" {
			continue
		}

		f, _ := _file.Open()
		var destFile *os.File
		destFile, err = os.OpenFile(xmind.tmpFile, os.O_CREATE|os.O_WRONLY, os.ModePerm)
		if err == nil {
			io.CopyN(destFile, f, int64(_file.UncompressedSize64))
			destFile.Close()
		}
		break
	}
	return err
}

// xmind json转换为chatbot json并保存至文件
func (xmind *xmindParser) ExportXmind() error {
	err := xmind.unzipChatData()
	if err != nil {
		log.Printf("ERROR - 解压文件失败：%s", err)
		return err
	}

	// 用于保存最终的完整json数据(sheets数组)
	xmind.Data = make(map[string]interface{})

	// 从xmind json文件中读取数据
	buf, err := tool.ReadData(xmind.tmpFile)
	data := []byte(buf)

	// 移除临时文件
	os.Remove(xmind.tmpFile)

	// 遍历所有画布
	sheets := jsoniter.Get(data)
	for i := 0; i < sheets.Size(); i++ {
		xmind.saveLog(fmt.Sprintf("解析画布 %s ...", sheets.Get(i, "title").ToString()))

		sheetData := make(map[int]interface{})  // 用于保存当前sheet的json数据
		xmindId := make(map[string]interface{}) // 用于保存xmind json id与chatbot json node对照表
		nodeId := 10000                         // 初始id

		// 提取module信息
		moduleName := sheets.Get(i, "rootTopic", "title").ToString()
		xmind.Data[moduleName] = sheetData
		if tool.InStrings(moduleName, xmind.ModulesDeclared) {
			xmind.saveLog("ERROR - 模块错误 —— 模块重名")
			xmind.saveLog(moduleName)
		} else {
			xmind.ModulesDeclared = append(xmind.ModulesDeclared, moduleName)
		}

		// 从rootTopic/children/attached开始导出对话
		attached := sheets.Get(i, "rootTopic", "children", "attached")
		xmind.exportNodes(attached, &nodeId, sheetData, xmindId, nil, 0)
		/* debug */
		//tmp := make([]byte, 0)
		//tmp, _ = json.Marshal(sheetData)
		//tmp, _ = json.Marshal(xmindId)
		//fmt.Println(tmp)

		// 处理连接线
		relationships := sheets.Get(i, "relationships")
		for j := 0; j < relationships.Size(); j++ {
			node1 := relationships.Get(j, "end1Id").ToString()
			node2 := relationships.Get(j, "end2Id").ToString()

			chatNode := xmindId[node1].(map[string]interface{})["node"]
			chatId := xmindId[node2].(map[string]interface{})["id"]
			chatNode.(map[string]interface{})["next"] = chatId
		}

		/* debug */
		//tmp, _ = json.Marshal(sheetData)
		//fmt.Println(tmp)
	}

	xmind.saveLog("----------------------------------------")

	// 输出模块声明
	xmind.saveLog("模块声明：")
	if len(xmind.ModulesDeclared) > 0 {
		for _, item := range xmind.ModulesDeclared {
			xmind.saveLog(fmt.Sprintf("　　%s", item))
		}
	} else {
		xmind.saveLog(fmt.Sprintf("　　%s", "[无]"))
	}

	// 输出模块引用
	xmind.saveLog("模块引用：")
	if len(xmind.ModulesReferenced) > 0 {
		for _, item := range xmind.ModulesReferenced {
			xmind.saveLog(fmt.Sprintf("　　%s", item))
		}
	} else {
		xmind.saveLog(fmt.Sprintf("　　%s", "[无]"))
	}

	return err
}
