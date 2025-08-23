# Post Boot Protocol

# Boot from the USB
Disk Utility -> View All
Format SSD - > APFS GUID Partition Map


# Select reInstallOS and set it up on newly formatted SSD
- Connect LAN and ReInstall MacOS [macRecovery Downloaded a piece of OS, we need to download full OS now]

In case  - Mostly not required
In High Sierra:If not able to connect to server for installation.In Terminal:
nvram IASUCatalogURL="http://swscan.apple.com/content/catalogs/others/index-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog"



# Boot to SSD macOS from OpenCore Boot Menu [while from USB after reInstallOS]

sudo diskutil mount EFI

Transfer USB EFI to system SSD EFI

Check Graphics Memory in About Mac Probably shows 8MB, since its on intel iGPU

For the latest patch of High-Sierra OS
sudo softwareupdate -ia --verbose

# Detect and Install NVIDIA WebDriver:
bash <(curl -s https://raw.githubusercontent.com/Benjamin-Dobell/nvidia-update/master/nvidia-update.sh)



# To check:
kextstat | grep -i nvidia

# Change config.plist argument
Remove nv_disable=1 from your boot-args. nvda_drv=1. , Change car-active-config to 67000000
Changed boot-arg to alci=1 nvda_drv=1

Show picker false

Change to alci=12For internal speakers

ALCI=11 for AUX [Worked on the back]



Post-Boot Protocol for High Sierra Hackintosh
---------------------------------------------

1. Boot from the USB Installer
   ---------------------------
   - Open Disk Utility.
   - Select "View -> Show All Devices".
   - Format the target SSD:
     - File System: APFS
     - Scheme: GUID Partition Map

2. Install macOS on the Formatted SSD
   -----------------------------------
   - Select "Reinstall macOS" and choose the newly formatted SSD.
   - Ensure LAN connection is active.
   - Note: If macOS recovery only downloaded a partial OS, download the full installer.

3. Troubleshooting Network Issues (Mostly Not Required)
   ------------------------------------------------------
   - On High Sierra, if unable to connect to Apple's server during installation:
     ```
     nvram IASUCatalogURL="http://swscan.apple.com/content/catalogs/others/index-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog"
     ```

4. Boot into SSD macOS via OpenCore
   ---------------------------------
   - Boot from OpenCore Boot Menu (select SSD, not USB).
   - Mount the EFI partition of the SSD:
     ```
     sudo diskutil mount EFI
     ```
   - Transfer the EFI folder from USB to SSD EFI.

5. Verify Graphics
   ----------------
   - Open "About This Mac" to check graphics memory (Intel iGPU may show 8 MB).
   - Update macOS:
     ```
     sudo softwareupdate -ia --verbose
     ```

6. Install NVIDIA WebDriver
   -------------------------
   - Run the NVIDIA installer script:
     ```
     bash <(curl -s https://raw.githubusercontent.com/Benjamin-Dobell/nvidia-update/master/nvidia-update.sh)
     ```
   - Verify installation:
     ```
     kextstat | grep -i nvidia
     ```

7. Update Boot Arguments
   ----------------------
   - Remove `nv_disable=1` and -v from `boot-args` for disabling iGPU and verbose at bootup.
   - Keep or add `nvda_drv=1`.
   - Update `csr-active-config` to `67000000`.
   - Example final boot-args for system:
     ```
     alci=1 nvda_drv=1
     ```
   - Adjust audio patch if needed:
     - `alci=12` for internal speakers.
     - `alci=11` for AUX (rear outputs).

8. OpenCore Picker Settings
   -------------------------
   - Optionally, set "ShowPicker = false" in `config.plist` for silent boot.
