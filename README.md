# 解决什么问题？

在2分钟内极速高效构建php开发测试环境

# 为什么要做这个配置包？

* 以前一直使用virtualbox+ubuntu虚拟机环境来搭建php开发环境，配置慢，不利于共享
* 前一段时间采用Docker配置，官方很多包默认采用ubuntu为底包，包很大，还是不利于共享，我配置好完整的LNMP Docker image有1G多
* 后来了解到alpine，一个轻量级的linux发行版，小到5M的底包，docker build速度非常快，所以就有了自己做一个开发环境配置包的想法。

# 配置原则

* 尽可能小，保持alpine的优势
* 尽可能少改动，保持原生docker+alpine的优势
* 默认采用中国大陆国内镜像，加速docker build的过程
* 默认采用Asia/Shanghai时区，国人开发更方便
* 默认配置好nginx多虚拟主机环境，可以在host主机按范本修改虚拟主机配置以满足自己的需求
* 默认配置好php-fpm环境，gd、mcrypt等常见模块均可直接使用
* 配置文件、程序开发代码、数据均放在host主机，通过volume挂载到相应容器，并可跨容器共享访问

# 效果如何？

* 整个配置包，68KB.
* 在【macbook pro 15 英寸，2014 年中】电脑中执行docker-compose build && docker-compose up -d ，总共费用1分钟29秒。


* 总共生成4个镜像，合计：278MB

# 模块组成

* alpine 3.4为基础包
* nginx 1.10.1
* mariaDB 10.1.14 兼容mysql 5.6 
* php 5.6.25

# 开始使用

* git clone https://github.com/youwater/alpine_docker4php_dev_test.git
* docker-compose build && docker-compose up -d
* open http://localhost/

# 配置调整

代码里面有注释，应该很容易看懂，可以直接改，然后docker-compose build && docker-compose up -d

# 疑问与解答 

docker基本概念和环境配置请自行解决。

可能还有一些不完善，有什么意见建议欢迎与我联系。

有什么问题可以提交issue，或者给我发邮件，我会尽量及时回复 youwater@gmail.com