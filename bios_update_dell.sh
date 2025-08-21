# Download the latest BIOS from Dell Official
# Download FreeDOS 

# Find the drive
lsblk

# Format the disk
sudo mkfs.vfat -F 32 /dev/sdX

# Setup FreeDOS
sudo dd if=~/Downloads/FD12.iso of=/dev/sdX bs=4M status=progress conv=fdatasync

# Eval Disk
sudo fdisk -l /dev/sdb

# Mount the disk
sudo mount /dev/sdb1 /mnt

# Copy BIOS file to disk
sudo cp /path/to/O7010A29.exe /mnt/BIOS.EXE
sync
sudo umount /mnt

# Boot from DOS(Maybe Legacy)
# Do not install!
A:\>
A:\>BIOS.EXE





