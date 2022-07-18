# micro-frontents-script
收集微前端常用脚本：
- run-multi-serve

## run-multi-serve
微前端需要同时运行多个服务，在mac中我们可能需要打开iterm，一个服务打开一个标签页，然后运行`yarn serve`，如果多个服务这个操作就显得很繁琐而又不得不做，因此就有了当前这个脚本。

使用方式：
1. 下载本项目
2. 在mac中键入`command` + `space` 打开搜索，输入“脚本编辑器”，打开软件；
3. 点击选项“文件”->“打开”->找到当前脚本`run-multi-serve`
4. 再点击选项“文件”->“导出”
  a. 导出为后面输入“多开微前端服务”
  b. 文件格式选择“应用程序”
  c. 位置选择“应用程序”
  d. 点击存储，你就会看到启动台能找到名为“多开微前端服务”的程序
5. 最后再配置一下环境变量：
  a. 打开“iterm”，输入`vim ~/.bash_profile`
  b. 在文件最后加上：
```
# 微前端
export MF_LIST="sub-app1|sub-app2|sub-app3|sub-app4"
export MF_ROOT_PATH="/Users/mac/code/micro-frontends/"

# 又或者项目列表直接带上路径，适合子应用放在不同目录下
export MF_LIST="/Users/mac/code/sub-app1|/Users/mac/code2/sub-app2"
```
