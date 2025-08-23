|-----------------------------------|-----------------------------------------------------------------------------|
| Variable                          | Description                                                                 |
|-----------------------------------|-----------------------------------------------------------------------------|
| Misc -> Security -> ScanPolicy    | Set to `0` to allow macOS bootloader to be detected                         |
| Misc -> Boot -> HideAuxiliary     | Change to `false` to show auxiliary entries                                 |
| XhciPortLimit                     | Change to `true` to enable USB port limit patching (temporary, for install) |
| hide_auxiliary                    | Set to `OFF` to see other partitions (important for multi-boot visibility)  |
| Misc -> Security -> Vault         | Set to `Optional` (required for Hackintosh, otherwise boot fails)           |
| boot-args -> nv_disable=1         | Disable NVIDIA drivers (use fallback VESA mode for first boot/install)      |
| boot-args -> nvda_drv=1           | Enable NVIDIA Web Drivers (needed for GTX 1050 on High Sierra)              |
| boot-args -> -v                   | Verbose mode for boot debugging (optional, but useful during setup)         |
| boot-args -> keepsyms=1           | Keep kernel symbols (only useful for debugging kernel panics)               |
| boot-args -> debug=0x100          | Disables watchdog timer (optional, for debugging)                           |
| Kernel -> Quirks -> DisableIoMapper | Set to `true` if macOS hangs on IOMMU (common on non-Apple hardware)      |
| Kernel -> Quirks -> PanicNoKextDump | Set to `true` to prevent useless kext panic spam                          |
| Kernel -> Quirks -> AppleXcpmCfgLock | Set to `true` if CFG-Lock is not disabled in BIOS                        |
| Kernel -> Quirks -> AppleCpuPmCfgLock | Set to `true` if Power Management lock is enabled in BIOS               |
| UEFI -> Quirks -> IgnoreInvalidFlexRatio | Set to `true` to avoid CPU ratio panic on some systems               |
| NVRAM -> csr-active-config        | Set to `00000000` for SIP enabled, or `E7030000` for SIP partially disabled |
| PlatformInfo -> SMBIOS            | Use `iMac13,2` for High Sierra + Ivy Bridge CPU (matches your i5-3470)      |
|-----------------------------------|-----------------------------------------------------------------------------|