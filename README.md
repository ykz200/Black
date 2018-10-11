# Black 2.1
因特殊情况，代码将停止同步GitHub，本项目用于issue记录，感谢各位亲友star本项目. 欢迎各位加入黑壳交流群-我们的小团体,欢迎入驻 

<br/>
<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=c5cff851a52c6194913e0e2df8e21d692ea4f1727b1cf8efa67b6bc7ff372d9e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="黑壳网络" title="黑壳网络"></a>


网站地址：http://www.blackdir.com

templates -- 页面在文件夹下 <b>(如果觉得页面不符合你的审美，欢迎来亲自操刀)</b>
<br/>static    -- 存放着静态资源文件类似于CSS/JS 
<br/>mapper    -- mybatis 数据访问层sql配置文件
<br/>demo.sql  -- 数据库sql语句

项目配置文件
<br/>application.properties
<br/>application-old.yml

黑壳交流群-我们是小团体,欢迎入驻 -->
<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=c5cff851a52c6194913e0e2df8e21d692ea4f1727b1cf8efa67b6bc7ff372d9e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="黑壳网络" title="黑壳网络"></a>

2.2.1 IT黑名单页面申请收录黑公司功能

```
1、首先修复了分页bug
2、然后再代码做了一些调整，利于搜索速度的提升
3、增加了页面添加了申请收录功能
4、添加了springboot sendEamil
```

2.1开放Api 用于读写
读 项目地址 

```例如 localhost:9090/api/queryInfo?common=北京```

会返回json格式数据 

```
参数解释

公司名称 companyName;

公司地址 position;

备注 remarks;
```  
写 api地址 

TIP： 由于insert权限 还没有完全开放，后期可能随时更改涉及加密情况
 
``` 
例如 localhost:9090/api/apiSubmitInfo?common=北京

采用post访问

参数解释

公司名称 companyName;

公司地址 position;

备注 remarks;


```

2.0更新内容 
PC端页面大更新，更漂亮，是真的。

1.0
或许在你的眼里，这只是个能用的网站

