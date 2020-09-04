# Beanstalkd

## A picture of job lifecycle

```
   put with delay               release with delay
  ----------------> [DELAYED] <------------.
                        |                   |
                        | (time passes)     |
                        |                   |
   put                  v     reserve       |       delete
  -----------------> [READY] ---------> [RESERVED] --------> *poof*
                       ^  ^                |  |
                       |   \  release      |  |
                       |    `-------------'   |
                       |                      |
                       | kick                 |
                       |                      |
                       |       bury           |
                    [BURIED] <---------------'
                       |
                       |  delete
                        `--------> *poof*
```

## Install

```bash
wget https://github.com/beanstalkd/beanstalkd/archive/v1.12.tar.gz
tar zxvf v1.12.tar.gz
cd beanstalkd-1.12
make
make install
```

## Create beanstalkd user

```bash
useradd -m -d /var/lib/beanstalkd -s /sbin/nologin -c 'Beanstalkd' beanstalkd
```

## Config Systemd

Copy config

```bash
cp etc/sysconfig/beanstalkd /etc/sysconfig/beanstalkd
cp usr/lib/systemd/system/beanstalkd.service /usr/lib/systemd/system/beanstalkd.service
```

## Config beanstalkd

```bash
mkdir -p /var/lib/beanstalkd/binlog
chown -R beanstalkd:beanstalkd /var/lib/beanstalkd/binlog
```

## Start

```bash
systemctl start beanstalkd.service
```

## Tools

### beanstool

```bash
wget https://github.com/src-d/beanstool/releases/download/v0.2.0/beanstool_v0.2.0_linux_amd64.tar.gz
tar -zxvf beanstool_v0.2.0_linux_amd64.tar.gz
cp beanstool_v0.2.0_linux_amd64/beanstool /usr/local/bin/
```

### beanstalkd-cli

```bash
wget https://github.com/EdwinHoksberg/beanstalkd-cli/releases/download/1.4.2/beanstalkd-cli_linux_amd64
cp beanstalkd-cli_linux_amd64 /usr/local/bin/beanstalkd-cli
```
