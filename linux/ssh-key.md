#### 1.generate a new key

```
ssh-keygen -t ed25519 -C "comment"
```

note: rsa is deprecated use ed25519 instead, if system doesn't support use rsa

```
ssh-keygen -t rsa -b 4096 -C "comment"
```



#### 2.Copy the contents of ~/.ssh/id_rsa.pub into the file ~/.ssh/authorized_keys on the machine to which you want to connect. If the file ~/.ssh/authorized_keys exist, append the contents of the file ~/.ssh/id_rsa.pub to the file ~/.ssh/authorized_keys on the other machine.

#### 3.change the permissions of the .ssh directory
```
chmod 700 ~/.ssh
```

#### 4.change the permissions of the authorized_keys file
```
chmod 600 ~/.ssh/authorized_keys
```
