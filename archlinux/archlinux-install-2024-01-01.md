# Archlinux Install

## 1 Pre-installation

Download archlinux-2024.01.01-x86_64.iso

Verify iso

### Make usb
```
ls -l /dev/disk/by-id/usb-*
```

Run the following command, replacing /dev/disk/by-id/usb-My_flash_drive with your drive, e.g. /dev/disk/by-id/usb-Kingston_DataTraveler_2.0_408D5C1654FDB471E98BED5C-0:0. (Do not append a partition number, so do not use something like /dev/disk/by-id/usb-Kingston_DataTraveler_2.0_408D5C1654FDB471E98BED5C-0:0-part1 or /dev/sdb1):

```
dd bs=4M if=archlinux-2024.01.01-x86_64.iso of=/dev/disk/by-id/usb-My_flash_drive conv=fsync oflag=direct status=progress
```


## 2



## 3


## 4

## 5

