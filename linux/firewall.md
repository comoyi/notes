## systemd

#### 防火墙中放行端口
```
firewall-cmd --permanent --add-port=23456/tcp
```

#### 查询
```
firewall-cmd --permanent --query-port=23456/tcp
```

#### 重载
```
firewall-cmd --reload
```

