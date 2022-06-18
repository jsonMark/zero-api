var apiChat,
    apiPost,
    botUI = new BotUI('cbt-bot'),
    fileServer = 'https://d.psychcn.com/',
    embedFlag = 'embed:',
    imageFlag = 'image:',
    videoFlag = 'video:',
    audioFlag = 'audio:';

// 发送post请求
function chatPostData(url, data) {
    var xhr = new XMLHttpRequest()
    xhr.open('POST', url, false)
    xhr.setRequestHeader('Content-type', 'application/json')
    xhr.send(JSON.stringify(data))
    return xhr.responseText
}

// 读取下一条对话数据
function chatContinue(text, id) {
    data = {}
    data['text'] = text
    data['id'] = id
    res = chatPostData(apiChat, data)
    return JSON.parse(res)
}

// 显示错误提示
function chatShowError(err) {
    console.log(err)
    botUI.message.bot({
        delay: 500,
        content: err
    })
}

// 将多行文本转换为数组
function spitLines(text) {
    lines = text.split(/[(\r\n)\r\n]+/)
    lines.forEach((item, index) => {
        if (!item) {
            lines.splice(index, 1)
        }
    })
    return Array.from(new Set(lines))
}

// 处理按钮
function button(list) {
    btn = []
    variable = {}
    for (i=0; i<list.length; i++) {
        json = list[i]
        if (json.hasOwnProperty("variable") && json.hasOwnProperty("value") && json["variable"] != "") {
            // json中包含variable属性，需要在点击按钮时向服务器提交用户变量
            data = {}
            data[json["variable"]] = json["value"]
            variable[json["next"]] = data
        }
        btn.push({
            icon: '',
            text: json['text'],
            value: json
        })
    }
    return botUI.action.button({
        delay: 800,
        action: btn
    }).then(function (res) {
        json = res.value
        if (variable.hasOwnProperty(json['next'])) {
            // 点击按钮时向服务器提交用户变量
            tmp = chatPostData(apiPost, variable[json['next']])
            data = JSON.parse(tmp)
            if (data["data"]["msg"] != 'ok') {
                chatShowError('failed to post data')
                return
            }
        }
        chat(json['text'], json['next'])
    })
}

// 处理输入框
function input(text, next) {
    variable = ""
    placeholder = ""

    lines = text.split('|')
    if (lines.length > 1) {
        // text内容为"{variable} | {placeholder}"
        variable = lines[0].trim()
        placeholder = lines[1].trim()
    }
    else {
        // text内容为"{variable}"
        variable = text
    }

    botUI.action.text({
        delay: 800,
        action: {
            value: '',
            placeholder: placeholder,
            button: {
                icon: 'check',
                label: 'OK'
            }
        }
    }).then(function (textInput) {
        if (variable.length > 0) {
            // 提交用户变量
            data = {}
            data[variable] = textInput.value
            tmp = chatPostData(apiPost, data)
            res = JSON.parse(tmp)
            if (res["data"]["msg"] == 'ok') {
                chat(textInput.value, next)
            } else {
                chatShowError('failed to post data')
            }
        }
        else {
            chat(textInput.value, next)
        }
    })
}

// 处理用户响应
function reply(list) {
    type = 0
    json = list[0]
    if (list.length == 1) {
        type = json["type"]
    }

    if (type == 1) {
        // 处理输入框
        input(json["text"], json["next"])
    } else {
        // 处理按钮
        button(list)
    }
}

// 处理下一行bot消息
function messageNext(lines, n, r) {
    if (n < lines.length-1) {
        message(lines, n+1, r)
    } else {
        reply(r)
    }
}

// 处理bot消息
function message(lines, n, r) {
    if (lines[n].indexOf(imageFlag) == 0) {
        // 嵌入图片（限定最大宽度）
        botUI.message.add({
            type: 'html',
            content: '<img src="' + fileServer+lines[n].substr(imageFlag.length).trim() + '" onload="if(this.width >= 240){this.width = 240}" align="middle" />'
        }).then(function () {
            messageNext(lines, n, r)
        })
    } else if (lines[n].indexOf(embedFlag) == 0 || lines[n].indexOf(videoFlag) == 0 || lines[n].indexOf(audioFlag) == 0) {
        // 嵌入视频
        botUI.message.add({
            type: 'embed',
            content: fileServer+lines[n].substr(embedFlag.length).trim()
        }).then(function () {
            messageNext(lines, n, r)
        })
    } else {
        // 普通文本
        if (lines[n] == "*NULL*") {
            // "*NULL*"表示不显示这条消息
            messageNext(lines, n, r)
        } else {
            // 正常显示文本
            botUI.message.bot({
                delay: 800,
                content: lines[n]
            }).then(function () {
                messageNext(lines, n, r)
            })
        }
    }
}

// 开始对话
function chat(text, id) {
    try {
        // 读取下一条对话数据
        var json = chatContinue(text, id)

        resText = json["data"]["text"]
        resReply = json["data"]["reply"]
    
        // 处理对话数据
        message(spitLines(resText), 0, resReply)
    } catch(error) {
        console.log(error)
        chatShowError('bot has been exited')
    }
}

function init(api_chat, api_post) {
    apiChat = api_chat
    apiPost = api_post

    // 初始对话参数为"*START*"和-1
    chat("*START*", -1)
}
