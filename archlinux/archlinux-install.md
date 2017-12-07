
## Connect wifi
```
wifi-menu
```

## Update the system clock
```
timedatectl set-ntp true
```

## Disk
partition | size
---|---
/boot/efi | 512M
/boot | 1G
/ | 50G
/home | 358G
swap | 16G
[for snapshot] | 50G 

### Partition the disks
```
fdisk /dev/nvme0n1
```

### Use lvm
```
lvmdiskscan
pvcreate /dev/nvme0n1p3
pvdisplay
vgcreate vg0 /dev/nvme0n1p3
vgdisplay
lvcreate -L 50G vg0 -n lvroot
lvcreate -L 358G vg0 -n lvhome
lvcreate -L 16G vg0 -n lvswap
lvdisplay

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.xfs /dev/nvme0n1p2
mkfs.xfs /dev/mapper/vg0-lvroot
mkfs.xfs /dev/mapper/vg0-lvhome
mkswap /dev/mapper/vg0-lvswap
mount /dev/mapper/vg0-lvroot /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi
mkdir /mnt/home
mount /dev/mapper/vg0-lvhome /mnt/home
swapon /dev/mapper/vg0-lvswap
```

## Select the mirrors
Edit /etc/pacman.d/mirrorlist
```
vim /etc/pacman.d/mirrorlist
```

## Install the base packages
```
pacstrap /mnt base
```

## Generate an fstab file
```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Chroot
```
arch-chroot /mnt
```

## Time Zone
```
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

## hwclock
```
hwclock --systohc
```

## Locale
Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them
```
vi /etc/locale.gen
locale-gen
```

## Set the LANG variable in locale.conf accordingly, for example:
LANG=en_US.UTF-8
```
vi /etc/locale.conf
```

## Create the hostname file and set a hostname
```
vi /etc/hostname
```

## Network
```
pacman -S iw wpa_supplicant dialog networkmanager
```

## If you use lvm edit /etc/mkinitcpio.conf add lvm2 resume before filesystem
Example: HOOKS=(base udev autodetect modconf block lvm2 resume filesystems keyboard fsck)
```
vi /etc/mkinitcpio.conf
```

## Create the initramfs image
```
mkinitcpio -p linux
```

## Set root password
```
passwd
```

## Grub
Install the packages grub and efibootmgr. GRUB is the bootloader, efibootmgr creates bootable .efi stub entries used by the GRUB installation script.
```
pacman -S grub efibootmgr 
```

If you have an Intel CPU, install the intel-ucode package in addition
```
pacman -S intel-ucode 
```

Set the boot directory and set the bootloader ID. Mount the ESP partition 
```
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
```

Use the grub-mkconfig tool to generate grub.cfg
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot
```
exit
umount -R /mnt
reboot
```

# After install

## Connect internet
```
wifi-menu
```

## Update
```
pacman -Syy
pacman -S archlinux-keyring
pacman -Syu
```

## Hibernate
Get swap UUID
```
blkid /dev/mapper/vg0-lvswap
```

Change
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
to
GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=UUID=bcc3d275-0f27-45e2-adc4-3462b772f6a4"
Remenber to change UUID to yours

Regenerate grub
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install sudo
```
pacman -S sudo
```

## Add user and set password
```
useradd -m -G wheel -s /bin/bash -c 'Michael' michael
passwd michael
```

## Network
```
systemctl enable NetworkManager
```

## VPN
```
pacman -S networkmanager-pptp
```

## GNOME
```
pacman -S xorg gnome
systemctl enable gdm
```

## Add font
```
pacman -S wqy-microhei
```

## Softwares
```
pacman -S vim openssh
```

## Install input method
```
pacman -S fcitx
```
