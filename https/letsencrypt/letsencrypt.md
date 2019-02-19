# Create a https certificate with Let's encrypt and configure nginx

## Install certbot

Archlinux
```
pacman -S certbot
```

Centos
```
yum install certbot
```

## Add to nginx site config

```
location ^~ /.well-known/acme-challenge/ {
    default_type "text/plain";
    root     /var/www/html/path-to-project;
}

location = /.well-known/acme-challenge/ {
    return 404;
}
```

## Create certificate

```
certbot certonly --webroot -w /var/www/html/path-to-project -d demo.xxx.com
```

## Add to nginx site config

```
listen 443 ssl;
ssl_certificate /etc/letsencrypt/live/demo.xxx.com/cert.pem;
ssl_certificate_key /etc/letsencrypt/live/demo.xxx.com/privkey.pem;
ssl_trusted_certificate  /etc/letsencrypt/live/demo.xxx.com/chain.pem;
```

## Restart nginx

```
systemctl restart nginx
```
