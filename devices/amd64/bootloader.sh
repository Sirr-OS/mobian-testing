#!/bin/sh

# Recreate missing /dev/mapper/* device nodes (e.g. crypt_root's setup-luks.sh)
if command -v dmsetup >/dev/null 2>&1; then
    dmsetup mknodes
fi

# Refresh /boot/grub/grub.cfg
update-grub

# Install grub to the ESP
grub-install --target=x86_64-efi --removable /dev/vda

# Fix devicenames in grub.cfg
sed -i 's/vda/sda/g' /boot/grub/grub.cfg
