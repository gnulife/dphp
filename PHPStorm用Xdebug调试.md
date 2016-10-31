##php容器的dockerfile修改
目前在dockerfile中是写死了本机的ip作为remote_host的，包括php5和php7，而且是加了xdebug的log文件的，不需要的话各位按自己情况进行修改。

![php5](http://ww2.sinaimg.cn/large/62b80425gw1f9b7q5y3wuj20r806pac7.jpg)

## PHPStorm配置
phpstorm的默认xdebug端口是9000，这个不用修改，在DBgp proxy里面将ide key、ip，端口填一下即可。
![phpstorm](http://ww2.sinaimg.cn/large/62b80425gw1f9b7tqrz91g20sf0l3tcw.gif)

## chrome插件
我主要使用chrome浏览器，所以调试时使用的是xdebug的chrome插件[xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc)，其他浏览器的插件请参考xdebug官网介绍(https://xdebug.org/docs/remote) ,这篇介绍还是比较有用的，可以仔细看看。

## 使用
在phpstorm中点击电话样子图标，start listening for php debug connection
![](http://ww3.sinaimg.cn/large/62b80425gw1f9b80w0005j2068022jr8.jpg)，当图标变成连接状态则表示能正常监听debug的连接了，
然后回到chrome浏览器中，点击xdebug helper，选择debug，然后刷新浏览器，正常情况下应该就会跳转到phpstorm中去，然后就可以进行调试了。