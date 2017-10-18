#!/bin/sh
# install_kernel.sh

# This must be run in the top kernel source directory.
# Assume you have already installed the modules.
# Only works on x86.

version=`make kernelversion`
kernel_args=`cat /proc/cmdline`
root_device=`awk '/^root/ {print $2; exit;}' /boot/grub/menu.lst`

cp System.map /boot/System.map.${version}
cp arch/x86/boot/bzImage /boot/vmlinuz-${version}
mkinitcpio -k "${version}" -c /etc/mkinitcpio.conf -g/boot/kernel.${version}.img

if ! grep -q "Kernel ${version}" /boot/grub/menu.lst
then
	echo "" >> /boot/grub/menu.lst
	echo "title  Kernel ${version}" >> /boot/grub/menu.lst
	echo "root   ${root_device}" >> /boot/grub/menu.lst
	echo "kernel /boot/vmlinuz-${version} ${kernel_args}" >> /boot/grub/menu.lst
	echo "initrd /boot/kernel.${version}.img" >> /boot/grub/menu.lst
fi
