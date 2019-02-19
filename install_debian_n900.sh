IMAGENAME=$1
dd if=./$IMAGENAME.img of=/dev/mmcblk0p1
resize2fs /dev/mmcblk0p1
apt-get -f install u-boot-flasher
mkdir /etc/bootmenu.d

cat <<. > /etc/bootmenu.d/Debian.item
ITEM_NAME="Debian 6 armel on uSD 1"
ITEM_DEVICE="${INT_CARD}p1"
ITEM_FSTYPE="ext3"
ITEM_KERNEL="/boot/uImage"
ITEM_INITRD="/boot/uInitrd"
ITEM_CMDLINE="vram=12M console=tty0 root=/dev/mmcblk0p1 rootwait ro"

.

u-boot-update-bootmenu
