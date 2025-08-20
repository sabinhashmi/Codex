# Convert the image
hdiutil convert -format UDRW -o <New.dmg> <Original.iso>

#Find disk name
diskutil list

# Unmount the diskX
diskutil unmountDisk /dev/diskX

# Write to rdiskX with raw access
sudo dd if=New.dmg of=/dev/rdiskX bs=1m\n

# Eject the disk
diskutil eject /dev/diskX
