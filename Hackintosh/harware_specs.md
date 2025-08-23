# 🖥️ System Hardware Specification Document

**Collected on Fedora Linux**  
**Collector:** Hashmi  
**Date:** _(replace with actual date of collection)_  

---

## 📌 Commands Used

```bash
# Baseboard & Motherboard
sudo dmidecode -t baseboard

# BIOS / Firmware
sudo dmidecode -t bios

# CPU Information
grep -i "model name" /proc/cpuinfo

# GPU (Graphics)
lspci | grep -i --color "vga\|3d\|2d"

# RAM
free -h

# Storage Devices
lsblk -o NAME,MODEL,SIZE,TYPE

# Ethernet & Network
lspci | grep -i network

# USB / Bluetooth
lsusb

# Audio Devices
aplay -l

# Input Devices
dmesg | grep -i input
```

---

## 🧩 Hardware Specifications

### 1. **Motherboard**
- **Manufacturer:** Dell Inc.  
- **Product Name:** 0WR7PY  
- **Version:** A01  
- **Serial Number:** /95QZ5Y1/CN722003590317/  
- **Asset Tag:** MUCWC204  
- **Type:** Motherboard  
- **Features:**  
  - Hosting board  
  - Replaceable  

**Onboard Devices:**  
- Intel HD Graphics (Enabled)  
- Intel 82579LM Gigabit Ethernet (Enabled)  
- Onboard 1394 (Enabled)  
- Onboard SATA Controller #1 (Enabled)  

---

### 2. **BIOS / Firmware**
- **Vendor:** Dell Inc.  
- **Version:** A14  
- **Release Date:** 06/10/2013  
- **ROM Size:** 12 MB  
- **Runtime Size:** 64 kB  
- **Address:** 0xF0000  
- **Revision:** 4.6  
- **Supported Features:**  
  - PCI, PNP, ACPI  
  - BIOS upgradeable  
  - BIOS shadowing  
  - Boot from CD  
  - Legacy USB  
  - UEFI supported  

**Language:**  
- en|US|iso8859-1  

---

### 3. **CPU**
- **Model:** Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz  
- **Cores/Threads:** 4 Cores / 4 Threads (x4 listed in `/proc/cpuinfo`)  

---

### 4. **GPU**
- **Dedicated GPU:**  
  - NVIDIA GeForce GTX 1050 (GP107, rev a1)  
- **Integrated GPU:**  
  - Intel HD Graphics (Onboard IGD, 0000:00:02.0)  

---

### 5. **Memory (RAM)**
```text
Total: 7.7 GiB
Used: 2.7 GiB
Free: 1.5 GiB
Shared: 60 MiB
Cache/Buffers: 3.9 GiB
Available: 5.0 GiB
Swap: 7.7 GiB (493 MiB used / 7.2 GiB free)
```

---

### 6. **Storage**
| Device | Model             | Size   | Type |
|--------|------------------|--------|------|
| sda    | EAGET SSD 240GB  | 223.6G | Disk |
| zram0  | -                | 7.7G   | Disk |

---

### 7. **Network**
- **Ethernet:** Intel 82579LM Gigabit Network Connection (Lewisville, rev 04)  
- **Wi-Fi:** _(Not detected in logs)_  
- **Bluetooth:** TP-Link USB Adapter (ID 2357:0604)  

---

### 8. **Audio**
- **Intel HDA Controller:**  
  - Intel Corporation 7 Series/C216 Chipset Family HD Audio Controller (rev 04)  
  - Codec: ALC269VB (Analog)  

- **NVIDIA HDA Controller:**  
  - NVIDIA GP107GL HD Audio Controller (rev a1)  
  - Outputs: HDMI 0, HDMI 1, HDMI 2, HDMI 3  

---

### 9. **Input Devices**
- Power Button (ACPI PNP0C0C)  
- Logitech USB Optical Mouse  
- Dell Multimedia Pro Keyboard (USB HID v1.10)  
- PC Speaker  
- HDA Intel PCH Audio Inputs:  
  - Front Mic  
  - Rear Mic  
  - Line Out  
  - Front Headphone  
- NVIDIA HDMI/DP Inputs (pcm=3,7,8,9)  

---

## ✅ Summary

This Dell-based system (Motherboard: **0WR7PY**) is running with:  
- **Intel i5-3470 CPU**  
- **NVIDIA GeForce GTX 1050 GPU** + Intel HD Graphics  
- **8GB RAM (7.7 GiB usable)**  
- **240GB SSD**  
- **Intel Gigabit Ethernet** + TP-Link Bluetooth USB Adapter  
- **Audio:** Intel HD + NVIDIA HDMI  
- **BIOS:** Dell A14 (2013, UEFI supported)  
