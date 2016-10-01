## 系统要求
1. docker 1.12以后才对windows和mac提供原生支持，原生不需要另外安装virtualbox之类的虚拟机，这样才能把docker方案的速度优势发挥出来，所以docker 1.12以下方案不在本项目的讨论范围。

2. docker官方有明确说明，仅支持windows 10 的特定版本，请务必先核对清楚：

```
Docker for Windows requires 64bit Windows 10 Pro, Enterprise and Education (1511 November update,
Build 10586 or later) and Microsoft Hyper-V. 
```

## 关于volumes的配置

1. 打开Docker for Windows的Settings中的Shared Drives设置
2. 在需要挂载到容器中的目录所在的盘符前面打上勾，并点击Apply
3. 如若不配置这一项，在docker-compose.yml或在docker命令行调用volumes配置就不会生效，这会造成容器不能正常启动

## 在windows下mysql容器无法正常运行

错误提示：`standard_init_linux.go:175: exec user process caused "no such file or directory"`

这是因为git for windows的默认设置会强制将代码换行符强行转为dos格式，造成shell脚本无法运行，需要修改设置后重新git clone：

```shell
git config --global core.autocrlf false
cd WORKDIR
git clone https://github.com/gnulife/dphp
cd dphp
docker-compose build
docker-compose up -d
```



## 其他问题

* 查看docker日志：打开Docker for Windows的Settings中的Diagnose & Feedback下，有一个log file链接
* 查看应用日志：dphp/volumes/apps/logs/ 下