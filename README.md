# 版本：1.24 更新记录

* 修改仓库统一为edge，以解决php7-openssl支持冲突问题
* 新加alpine国内加速基础包，让其他包均从这个包继承，代码更优雅一些，构建效率更高一些。
* 增加 php7配置(默认)：切换php版本，请参照docker-compose.yml里的注释修改
* 增加 redis配置：可通过redis:6379访问
* 增加【[windows用户填坑建议](windows用户填坑建议.md)】【[docker基础概念和命令操作](docker基础概念和命令操作.md)】说明文档
* 将nginx、php日志也放在host主机volumes/apps/logs/下，方便调试
* 增加php.ini中max_execution_time的配置
* 增加php composer包，修改为从国内镜像下载
* 增加在host主机中php、composer别名指向到phpfpmp容器，这样可以实现本地完全不需要安装任何php相关组件

# 为什么要做这个配置包？

* 以前一直使用virtualbox+ubuntu虚拟机环境来搭建php开发环境，配置慢，不利于共享
* 前一段时间采用Docker配置，官方很多包默认采用ubuntu为底包，包很大，还是不利于共享，我配置好完整的LNMP Docker image有1G多
* 后来了解到alpine，一个轻量级的linux发行版，小到5M的底包，docker build速度非常快，所以就有了自己做一个开发环境配置包的想法。
* 我希望做一个超轻量级的全功能php开发测试环境配置包。

# 配置原则

* 尽可能小，保持alpine的优势
* 尽可能少改动，保持原生docker+alpine的优势
* 默认采用中国大陆国内镜像，加速docker build的过程
* 默认采用Asia/Shanghai时区，国人开发更方便
* 默认配置好nginx多虚拟主机环境，可以在host主机按范本修改虚拟主机配置以满足自己的需求
* 默认配置好php-fpm环境，gd、mcrypt等常见模块均可直接使用
* 配置文件、程序开发代码、数据、日志均放在host主机，通过volume挂载到相应容器，并可跨容器共享访问

# 效果如何？

* 整个配置包，100KB.
* 在【macbook pro 15 英寸，2014 年中】电脑，电信20M宽带中执行`date && docker-compose build && docker-compose up -d && date `，总共费用1分钟15秒。
* 总共生成6个镜像，合计：285MB

# 模块组成

* alpine 最新版为基础包，目前是3.4
* nginx 1.10.1
* mariaDB 10.1.17 兼容mysql 5.6 
* php 5.6.26 & php7.0.11，目前默认为php7
* redis 3.2.0

# 开始使用

* `git clone https://github.com/gnulife/dphp.git`
* `cd dphp && docker-compose build && docker-compose up -d`
* open http://localhost/
* [可选] 配置别名：source alias.sh

# 配置调整

*   虚拟主机自定义：nginx/conf/vhosts.conf

    修改里面server_name和root名称为自己想要定义的域名，然后将这个域名添加到/etc/hosts文件，即可建立自己的虚拟主机

*   php模块自定义：phpfpm/Dockerfile

          参照注释自行修改即可

*   mysql默认帐号密码：docker-compose.yml， 可以根据需要修改，其他配置可在mysql/my.cnf中修改

    ```yaml
    environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=your_db_name
    - MYSQL_USER=developer
    - MYSQL_PASSWORD=developer
    ```

*   其他配置调整可以参照源码和注释修改，然后运行

    docker-compose build && docker-compose up -d

# 疑问与解答 

* 为什么我build的速度很慢？根本达不到文中所说的速度？

  整个镜像包的build过程已全部配置成国内镜像，理论上速度是非常快的，docker本身也要配置成采用国内镜像，方法可自行搜索：docker 国内加速。每台电脑、网络环境都不一样，上面的时间是我在我的电脑上电信20M宽度环境下的build速度，仅供参考。

* Windows下有一些问题，请参考【[windows用户填坑建议](windows用户填坑建议.md)】

* 其他有关docker基本概念和命令操作，请参考【[docker基础概念和命令操作](docker基础概念和命令操作.md)】。

* 如何跨容器访问服务？比如C1中的nginx如果访问C2中的php-fpm服务？

  docker运行中的各个容器相当于不同的互相隔离的计算机，C1中的nginx若要访问C2中的php-fpm，关键点在于要把host指向改为正确的地址，我们如何知道C2的ip呢？docker-compose已经帮我们做好了一个默认配置：php-fpm别名指向C2的ip。所以我们只要：fastcgi_pass   phpfpm:9000; 就可以了。其他比如数据库的访问也类似，使用数据库服务的别名mysql来当作host访问就可以了。

* 经常出现无法访问mirror服务器的情况，造成无法正常build。

  估计是由于国内电信的dns不稳定造成，把host主机的dns换为其他第三方比如阿里dns：223.5.5.5 可能得到改善，大家可以试一下，看有没有效果。


可能还有一些不完善，有什么意见建议欢迎与我联系。

有什么问题可以提交issue，或者加dphp交流QQ群讨论，群号：515731883
