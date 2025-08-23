Hackintosh High-Sierra USB Setup from Fedora
--------------------------------------------

Reference: OpenCore Install Guide
https://dortania.github.io/OpenCore-Install-Guide/

1. Preparation
--------------
- Check hardware specs for the target machine (CPU, GPU, motherboard, etc.).
- Decide macOS version: High-Sierra (10.13) due to NVIDIA GTX 1050 support.
- Decide setup from Fedora.

2. Download Latest OpenCore
---------------------------
Get the latest OpenCore release from:
https://github.com/acidanthera/OpenCorePkg/releases

3. Use macOS Recovery in OpenCore to Download High-Sierra
---------------------------------------------------------
cd OpenCore-*/Utilities/macrecovery/
python3 ./macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download

This produces: com.apple.recovery.boot

4. USB Disk Preparation
-----------------------
# To know disk name:
lsblk

# Partitioning
sudo gdisk /dev/sdb

Inside gdisk:
1. Wipe the old partition table:
   - Press o → create a new empty GPT.
   - Confirm with y.

2. Create EFI partition (200MB):
   - Press n (new partition).
   - Partition number: Enter (default).
   - First sector: Enter (default).
   - Last sector: +200M
   - Hex code: EF00 (EFI System Partition)

3. Create OpenCore/Recovery partition (rest of USB):
   - Press n again.
   - Partition number: Enter (default).
   - First sector: Enter (default).
   - Last sector: Enter (use all remaining space).
   - Hex code: 0700 (Microsoft basic data, works fine for FAT32)

4. Write the table to disk:
   - Press w
   - Confirm with y

Result: EFI partition (200MB) and FAT32 OpenCore/Recovery partition.

Format Partitions:
------------------
# FAT32 OpenCore/Recovery
sudo mkfs.hfsplus -F 32 -n "OPENCORE" /dev/sdb2
sudo mkdir -p /mnt/usb
sudo mount -t vfat /dev/sdb2 /mnt/usb

# Copy macOS recovery to sdb2
sudo cp /OpenCore/Utilities/macrecovery/com.apple.recovery.boot .

# EFI partition
sudo mkfs.vfat -F 32 -n EFI /dev/sdb1
sudo mkdir -p /mnt/usb_efi
sudo mount -t vfat /dev/sdb1 /mnt/usb_efi

- Copy OpenCore .efi files from the downloaded release to /mnt/usb_efi/EFI/OC 
  (include Drivers folder based on hardware specs).
- Once copied, keep only the required base files.
- Add additional required files as needed.
- Ensure directory structure matches reference guide.

5. Configure config.plist
-------------------------
1. Copy sample plist:
   cp OpenCore-*/Docs/Sample.plist /mnt/usb_efi/EFI/OC/config.plist

2. Open with ProperTree:
   python3 ProperTree.py
   (If error: sudo dnf install python3-tkinter)
   Ctrl+Shift+R → point to EFI/OC for clean snapshot

3. Set SMBIOS with GENSMBIOS:
   python3 GENSMBIOS.py
   - Option 1 → Option 3 → iMac13,2
   - Save details

4. Update in ProperTree:
   - SystemProductName: iMac13,2
   - SystemSerialNumber, MLB, SystemUUID
   - ROM = MAC address from `ip addr show` in Fedora or from GenSMBIOS

5. Validate plist sanity:
   https://opencore.slowgeek.com
