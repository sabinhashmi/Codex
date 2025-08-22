# Convert the image
hdiutil convert -format UDRW -o <New.dmg> <Original.iso> [SKIP for FEDORA]

#Find disk name
diskutil list
OR
lsblk

# Unmount the diskX
diskutil unmountDisk /dev/diskX

# Write to rdiskX with raw access
sudo dd if=New.dmg of=/dev/rdiskX bs=1m\n

sudo dd if=~/Downloads/Fedora.iso of=/dev/rdisk2 bs=4m status=progress [For FEDORA]

# Eject the disk
diskutil eject /dev/diskX
