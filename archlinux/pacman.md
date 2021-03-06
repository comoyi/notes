# pacman

## 常用命令

### 更新系统

```bash
pacman -Syu
```

### 将本地的包数据库与远程仓库进行同步

```bash
pacman -Sy
```

## 查询相关

### 查询包

```bash
pacman -Ss search_str
```

### 查询包信息

```bash
pacman -Si package_name
```

### 查询已安装的

```bash
pacman -Qs search_str
```

### 查询已安装的包信息

```bash
pacman -Qi package_name
```

## 安装相关

### 安装

```bash
pacman -S package_name
```

### 同步包数据库后安装

```bash
pacman -Sy package_name
```

### 显示一些信息后安装

```bash
pacman -Sv package_name
```

## 删除相关

### 删除

```bash
pacman -R package_name
```

### 删除指定软件包，及其所有没有被其他已安装软件包使用的依赖（除了明确安装的软件包）

```bash
pacman -Rs package_name
```

### 清除包缓存

```bash
pacman -Sc
```

## 查询

### 查询本地安装包的详细信息

```bash
pacman -Qi package_name
```
