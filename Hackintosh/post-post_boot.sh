# After PostBoot [Optional]

1. Install Karabiner-Elements for keyboard mapping  
   👉 https://karabiner-elements.pqrs.org/

2. Map USB ports with USBMap  
   ```bash
   git clone https://github.com/corpnewt/USBMap
   cd USBMap
   chmod +x USBMap.command
   ./USBMap.command

Steps inside USBMap:
D: Discover Ports
K: Create USBMapDummy.kext
Move USBMapDummy.kext to EFI/OC/Kexts/
Update config.plist (OpenCore Snapshot)


3. Fix terminal theme
Install [Homebrew] if not already installed
Set font to Courier


4. Create .bashrc
Add the following line:
export PS1="\h:\W\$ "

5. Set computer and host name
sudo scutil --set ComputerName "<your-computer-name>"
sudo scutil --set HostName "<your-host-name>"


6. Create .bash_profile so .bashrc loads automatically
Add this line inside .bash_profile:
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


7. Flutter compatible with High Sierra : 3.3.10


8. VSCode compatible with High Sierra : v1.85 [November '23]
