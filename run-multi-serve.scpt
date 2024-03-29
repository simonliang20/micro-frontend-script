-- 从环境变量中获取配置
set projectListText to do shell script "source ~/.bash_profile;echo $MF_LIST"
set AppleScript's text item delimiters to "|" --设置分隔符
set projectList to every text item of projectListText # 获取项目列表
set rootPath to do shell script "source ~/.bash_profile;echo $MF_ROOT_PATH" # 获取项目根路径

-- 如果没有配置，弹窗提示
set nullText to ""
if projectListText = nullText then
	set theAlertText to "缺少环境变量."
	set theAlertMessage to "参考如下步骤：
1. 打开文件：vim ~/.bash_profile
2. 添加环境变量（MF_LIST指的不同子应用，多个子应用用|隔开，MF_ROOT_PATH指的是项目根路径）：

export MF_LIST = 'sub-app1|sub-app2|sub-app3|sub-app4'
export MF_ROOT_PATH = '/Users/mac/code/micro-frontends/'

3. 刷新环境变量：source ~/.bash_profile
"
	display alert theAlertText message theAlertMessage
	return
end if

--公共函数
on getCommand(name)
	return "cd " & rootPath of me & name & ";yarn serve"
end getCommand

--执行
tell application "iTerm"
	create window with default profile

	set firstProject to first item of projectList
	tell current session of current window to write text getCommand(firstProject) of me

	tell current window
		set shortList to items 2 through 4 of projectList
		repeat with project in shortList
			set currentTab to create tab with default profile
			tell current session of currentTab to write text getCommand(project) of me
		end repeat
	end tell

end tell
