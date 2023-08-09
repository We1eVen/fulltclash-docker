原作者: https://github.com/AirportR/FullTclash

---

# FullTclash
<img src="https://img.shields.io/github/license/We1eVen/fulltclash-docker.svg"/>  <img src="https://img.shields.io/github/last-commit/We1eVen/fulltclash-docker.svg"/>  <img src="https://img.shields.io/docker/image-size/weleven11/fulltclash/latest"/>  

#### dockerhub：https://hub.docker.com/r/weleven11/fulltclash
#### gayhub：https://github.com/We1eVen/fulltclash-docker



## 使用方法

```
docker run -d \
-e ADMINID=TG用户id \
-e APIID=TG用户api \
-e APIHASH=TG用户api hash \
-e BOTTOKEN=TG机器人token \
weleven11/fulltclash
```

## 可选环境变量

* __`CORE`__:测速使用的CPU核心数。可选，默认1
* __`PROXY`__:TG代理。可选，socks5协议，格式为 host:端口:用户名:密码 ，用户名密码可不填。
* __`THREAD`__:测速使用线程数。可选，默认4

***示例***

>单线程测速，使用4核心，代理为127.0.0.1:7891，无密码
```
docker run -d \
-e ADMINID=TG用户id \
-e APIID=TG用户api \
-e APIHASH=TG用户api hash \
-e BOTTOKEN=TG机器人token \
-e CORE=4 \
-e THREAD=1 \
-e PROXY=127.0.0.1:7891 \
weleven11/fulltclash
```


## 你也可以映射配置文件

```
docker run -d \
-v /path/to/config.yaml:/app/resources/config.yaml \
weleven11/fulltclash
```
其中，`/path/to/config.yaml`替换为你自己的配置文件路径
