# docker

## Docker中国官方镜像加速

编辑配置文件

```bash
vim /etc/docker/daemon.json
```

添加 registry-mirrors

```json
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```

重启docker

```bash
sudo systemctl restart docker
```
