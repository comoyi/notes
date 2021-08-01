# GnuPG

## 密钥管理

### 创建密钥

```
gpg --full-generate-key
```

### 查看公钥

```
gpg --list-keys --keyid-format long
```

```
--------------------------------
pub   rsa4096/7B06AF326381C60A 2021-08-01 [SC]
      AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
uid                 [ultimate] Test User <testuser@gmail.com>
sub   rsa4096/D8DB85F7B7AC8C95 2021-08-01 [E]
sub   rsa4096/E060CBB1BACFCC05 2021-08-01 [S]
```

### 查看密钥

```
gpg --list-secret-keys --keyid-format long
```

```
--------------------------------
sec   rsa4096/7B06AF326381C60A 2021-08-01 [SC]
      AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
uid                 [ultimate] Test User <testuser@gmail.com>
ssb   rsa4096/D8DB85F7B7AC8C95 2021-08-01 [E]
ssb   rsa4096/E060CBB1BACFCC05 2021-08-01 [S]
```

### 导出公钥

```
gpg -o ~/Downloads/public-keys --export AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 导出文本格式公钥

```
gpg -o ~/Downloads/public-keys-asc --armor --export AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 导出密钥

```
gpg -o ~/Downloads/private-keys --export-secret-keys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 导出文本格式密钥

```
gpg -o ~/Downloads/private-keys-asc --armor --export-secret-keys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 导出子密钥

```
gpg -o ~/Downloads/private-subkeys --export-secret-subkeys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 导出文本格式子密钥

```
gpg -o ~/Downloads/private-subkeys-asc --armor --export-secret-subkeys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

### 主密钥建议只用于密钥的管理，导出并备份放到安全的地方（网络隔离的环境）后建议从平时使用的电脑删除

```
--delete-secret-keys name
        Remove  key  from  the secret keyring. In batch mode the key must be specified by fingerprint.  The option --yes can be used to advise gpg-agent not to request a
        confirmation.  This extra pre-caution is done because gpg can't be sure that the secret key (as controlled by gpg-agent) is only used for the given OpenPGP  pub‐
        lic key.  If the exclamation mark syntax is used with the fingerprint of a subkey only the secret part of that subkey is deleted; if the exclamation mark is used
        with the fingerprint of the primary key only the secret part of the primary key is deleted.
```

### 只删除主密钥（注意后面的!）

```
gpg --delete-secret-keys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A!
```

删除主密钥后再次查看密钥，在sec后会多出一个#，代表本地没有主密钥

```
~ gpg --list-secret-keys --keyid-format long
--------------------------------
sec#  rsa4096/7B06AF326381C60A 2021-08-01 [SC]
      AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
uid                 [ultimate] Test User <testuser@gmail.com>
ssb   rsa4096/D8DB85F7B7AC8C95 2021-08-01 [E]
ssb   rsa4096/E060CBB1BACFCC05 2021-08-01 [S]
```

### 删除主密钥及其子密钥

```
gpg --delete-secret-keys AC92DF95A2075F0C2C3C3BD57B06AF326381C60A
```

## 签名与验签

### 生成独立签名文件

```
gpg -sb file
```

### 验证签名

```
gpg --verify file.sig
```

### 生成文本格式独立签名文件

```
gpg -sba file
```

### 验证文本格式签名

```
gpg --verify file.asc
```
