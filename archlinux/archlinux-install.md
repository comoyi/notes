
## Connect wifi
```
wifi-menu
```
## Update the system clock
```
timedatectl set-ntp true
```

## Disk
Size
```
/boot/efi 512M
/boot 1G
swap 16G
/ 64G
/home 450G
```

```
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkswap /dev/nvme0n1p3
mkfs.ext4 /dev/nvme0n1p4
mkfs.ext4 /dev/nvme0n1p5

mount /dev/nvme0n1p4 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi
mkdir /mnt/home
mount /dev/nvme0n1p5 /mnt/home
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
Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them with:
```
locale-gen
```

## Set the LANG variable in locale.conf accordingly, for example:
/etc/locale.conf
LANG=en_US.UTF-8

## Create the hostname file:
/etc/hostname
hostname

## Network
```
pacman -S iw wpa_supplicant dialog networkmanager
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

## Network
```
systemctl enable NetworkManager.service
```

## VPN
```
pacman -S networkmanager-strongswan networkmanager-pptp
```

## GNOME
```
pacman -S xorg gnome
systemctl enable gdm.service
```

For the GNOME on Xorg session, add to the ~/.xinitrc file: exec gnome-session.

## Add font
```
pacman -S wqy-microhei
```

## Install input method
```
pacman -S fcitx
pacman -S fcitx-sogoupinyin
```

## Add user and set password
```
useradd -m michael
passwd michael
```

## Sudo
```
pacman -S sudo
visudo
```

## Softwares
```
pacman -S vim tree openssh
```
