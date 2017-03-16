## gitlab-ce docker

#### 建议关闭selinux
```
sudo setenforce 0

# 修改配置为SELINUX=disabled
sudo vim /etc/selinux/config
```

#### 安装docker
```
sudo yum install -y docker
```
#### 开启docker
```
sudo systemctl start docker
```

#### 拉取image
```
sudo docker pull gitlab/gitlab-ce
```

如果拉取速度过慢可以先从vps上拉取image然后导出成tar包，再通过搭建nginx下载到本地

```
# 导出docker image
sudo docker save gitlab/gitlab-ce -o ~/data/downloads/gitlab-ce.tar

# 建议下载前先进行压缩处理容量减小非常明显
sudo tar zcvf gitlab-ce.tar.gz gitlab-ce.tar

# 下载
wget xxx.com/gitlab-ce.tar.gz

# 解压
tar zxvf gitlab-ce.tar.gz

# 导入image
sudo docker load -i ~/data/downloads/gitlab-ce.tar
```

#### 运行gitlab-ce docker
配置项里冒号左边是主机的右边是docker的
```
sudo docker run --detach \
    --hostname gitlab.example.com \
    --publish 44399:443 \
    --publish 8099:80 \
    --publish 2299:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```

#### 浏览器访问
```

```

