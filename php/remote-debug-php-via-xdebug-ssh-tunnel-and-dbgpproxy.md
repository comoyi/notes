# remote debug PHP via xdebug ssh tunnel and dbgpproxy

## 安装PHP的xdebug扩展并启用

```ini
[xdebug]
zend_extension=xdebug.so
xdebug.remote_enable = 1
xdebug.remote_host = 127.0.0.1
xdebug.remote_port = 9001
xdebug.idekey = PHPSTORM
```



## 配置dbgpproxy

下载dbgpproxy

网址：http://code.activestate.com/komodo/remotedebugging/ 选择Python版本

```bash
wget http://downloads.activestate.com/Komodo/releases/11.1.0/remotedebugging/Komodo-PythonRemoteDebugging-11.1.0-91033-linux-x86.tar.gz
```

下载好后解压并重命名为dbgpproxy
```bash
tar zxvf Komodo-PythonRemoteDebugging-11.1.0-91033-linux-x86.tar.gz
mv Komodo-PythonRemoteDebugging-11.1.0-91033-linux-x86 /usr/local/dbgpproxy
```

在远端服务器启动dbgpproxy（这里的路径根据dbgpproxy所在目录填写）

```bash
export PYTHONPATH=$PYTHONPATH:/usr/local/pydbgpproxy/pythonlib
```

```bash
cd /usr/local/dbgpproxy
./pydbgpproxy -d 127.0.0.1:9001 -i 127.0.0.1:9003
```



## 建立隧道使得远程主机访问端口时转发到本地机器

远程调试时开发机没有公网固定ip的情况需要建立隧道，debug数据通过隧道传输

如果dbgpproxy端口不对外需要建立sssh隧道

```bash
# 用于向dbgpproxy注册IDE
ssh -C -f -N -g -L 9003:127.0.0.1:9003 michael@192.168.0.88
```

DBGp通过ssh隧道转发

```bash
# 用于DBGp转发
ssh -C -f -N -g -R 9007:127.0.0.1:9007 michael@192.168.0.88
```



## 设置IDE

设置Xdebug端口PhpStorm | Preferences | Languages & Frameworks | PHP | Debug | Xdebug

```
Debug port: 9007
```



设置 PhpStorm | Preferences | Languages & Frameworks | PHP | Debug | DBGp Proxy

填写服务器的Host和Port，下面的例子用了ssh隧道所以填了本地的地址

```
IDE KEY: PHPSTORM
Host: 127.0.0.1
Port: 9003
```

注册IDE PhpStorm -> Tools -> DBGp Proxy -> Register IDE



## 开发环境 cli调试

先在代码里加上断点

再执行以下命令

```bash
export XDEBUG_CONFIG="idekey=PHPSTORM"
```

```bash
php public/cli.php xxx xxx
```



## 接口调试

如果请求需要debug则加上XDEBUG_SESSION_START参数

```
XDEBUG_SESSION_START=PHPSTORM
```

如果需要停止debug则加上XDEBUG_SESSION_STOP参数

```
XDEBUG_SESSION_STOP
```
