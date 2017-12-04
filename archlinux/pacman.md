# pacman

### 更新系统
```
pacman -Syu
```

### 将本地的包数据库与远程仓库进行同步
```
pacman -Sy
```

## 安装相关

### 安装
```
pacman -S package_name
```

### 同步包数据库后安装
```
pacman -Sy package_name
```

### 显示一些信息后安装
```
pacman -Sv package_name
```

## 删除相关

### 删除
```
pacman -R package_name
```

### 删除指定软件包，及其所有没有被其他已安装软件包使用的依赖（除了明确安装的软件包）
```
pacman -Rs package_name
```

## 查询

### 查询本地安装包的详细信息
```
pacman -Qi package_name
```