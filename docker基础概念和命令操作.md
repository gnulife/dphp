# Docker基础概念

* docker：一个极致高效的虚拟机技术，可以实现毫秒级的虚拟机创建、启动和销毁。原本只支持linux系统，从1.12版本开始，对windows和mac提供了原生的支持。
* docker image 镜像：docker虚拟机磁盘静态存储，相当于virtualbox的虚拟硬盘，Dockerfile编译生成镜像，就是生成完成特定业务功能文件系统创建与保存的过程，生成后的镜像可以在容器中运行。
* docker container 容器：docker image的运行时状态，启动运行容器时必须指定执行一个命令，完成后容器将立即停止退出。利用这一特性，可以用容器来运行可持续提供的服务让容器保持运行，比如nginx。也可以使用alias别名调用容器中的命令，运行完立即销毁，做干净的环境隔离，比如php composer命令，nodejs的npm命令。
* Dockerfile：单一镜像生成配置文件，使用特定语法写明构建镜像规则，比如：指定基础包是基于ubuntu还是centos还是alpine，指定预装哪些应用程序，指定初始配置文件的内容，指定开放的端口和目录，指定镜像被放入容器运行时需要执行的命令等。
* docker-compose.yml：一组容器编译/运行配置文件，控制一组容器联合协作，共同完成特定业务的服务组合，批量控制镜像的编译、容器的运行与销毁。

# Docker基础命令操作

* 列出镜像列表：docker images
* 列出容器列表：docker ps -a
* 停止单一容器运行：docker stop container_name 或 docker stop container_id
* 删除单一镜像：docker rmi image_name 或 docker rmi image_id
* 删除单一容器：docker rm container_name 或 docker rm container_id
* 批量删除所有镜像：docker rmi $(docker images -q)
* 批量停止所有容器：docker stop $(docker ps -aq)
* 批量删除所有容器：docker rm $(docker ps -aq)
* 批量创建镜像：docker-compose build
* 批量启动容器：docker-compose up -d
* 启动一个镜像进入shell不退出：docker run -it image_name sh
* 进入容器shell不退出：docker exec -it container_name sh
* 启动一个镜像执行一个命令并退出：docker run --rm image_name command_name
* 在容器中执行一个命令并退出：docker exec container_name command_name