sudo apt update
sudo apt install -y git build-essential dkms

# Clone and install aircrack-ng driver
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo make dkms_install

# Alternative driver (morrownr)
cd ..
git clone https://github.com/morrownr/8812au-20210708
cd 8812au-20210708
sudo ./install-driver.sh
