## VPS

### 主机商选择

主机商 | 最低套餐
---|---
Linode | $5/month
Digital Ocean | $5/month
Vultr | $2.5/month
Bandwagon Host | $19.9/year
每家主机商每人只能注册一个帐号且不可给别人充值，否则所有帐号都会被封号

### 选择机房位置

位置 | 延迟 | 具体位置
---|--- |---
东京 | 60 - 150 ms | Tokyo
美国西海岸 | 200 - 350 ms | Los Angeles, Seattle

### 检查ip是否能ping通
查看是否能ping通，ping不通一般来说就是被墙了，需要更换ip或者重新创建

### 登录
```bash
ssh root@45.77.18.79
```

### 安装常用工具/软件
```bash
yum install -y vim tmux
```

### 添加用户
```bash
# 添加用户
useradd michael

# 设置密码
passwd michael
```

### 给用户添加sudo权限
```bash
visudo

# 在这一行下面添加一行
root    ALL=(ALL)       ALL
michael    ALL=(ALL)       ALL
```

### 从自己电脑拷贝PublicKey到VPS
```
# 拷贝PublicKey 记得输入用户对应的密码 PublicKey会拷贝到 ~/.ssh/authorized_keys
ssh-copy-id -i ~/.ssh/id_rsa.pub michael@45.77.18.79
```

### 安全设置


- [x] 禁止root用户ssh登录
- [x] 关闭密码登录，改为PublicKey方式登录
- [x] 更改ssh端口（默认为22，更改的时候记得在防火墙开放端口）

```bash
# 修改sshd配置文件
vim /etc/ssh/sshd_config

# 修改/etc/ssh/sshd_config以下几项
PermitRootLogin no
PasswordAuthentication no
Port 23456

# 开放端口
firewall-cmd --permanent --add-port=23456/tcp
firewall-cmd --reload

# 重启sshd
systemctl restart sshd
```

#### 之后
```
# 登录
ssh -p 23456 michael@45.77.18.79

# 需要高级权限的命令前加sudo 例如
sudo yum install -y tree

# 需要切换root时
su
```

以上演示ip已失效请更换为你自己的

