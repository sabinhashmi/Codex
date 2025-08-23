BIOS Update Protocol (Dell) using FreeDOS
-----------------------------------------

1. Download Required Files
   -----------------------
   - Download the latest BIOS for your Dell model from the official Dell website.
   - Download FreeDOS ISO (e.g., FD12.iso).

2. Identify the USB Drive
   -----------------------
   - Insert your USB stick and find its device name:
     ```
     lsblk
     ```

3. Format the USB Drive
   ---------------------
   - Format the USB stick as FAT32:
     ```
     sudo mkfs.vfat -F 32 /dev/sdX
     ```
   - Replace `/dev/sdX` with your USB device name.

4. Create Bootable FreeDOS
   ------------------------
   - Write FreeDOS ISO to the USB:
     ```
     sudo dd if=~/Downloads/FD12.iso of=/dev/sdX bs=4M status=progress conv=fdatasync
     ```

5. Verify USB Disk
   -----------------
sudo fdisk -l /dev/sdX

6. Mount USB Drive
----------------
sudo mount /dev/sdX1 /mnt

7. Copy BIOS File
----------------
- Copy the BIOS executable to the USB root:
  ```
  sudo cp /path/to/O7010A29.exe /mnt/BIOS.EXE
  sync
  sudo umount /mnt
  ```

8. Boot from USB
----------------
- Reboot the system and boot from USB (Legacy/BIOS mode if required).
- Do **not** install anything else, only run the BIOS update.

9. Run BIOS Update
-----------------
- At the DOS prompt:
  ```
  A:>
  A:\>BIOS.EXE
  ```

10. Complete
 ------------
 - Follow on-screen instructions to flash the BIOS.
 - Reboot once the update is finished.


