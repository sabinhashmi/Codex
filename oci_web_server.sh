ssh -i <key> user@host

sudo vim /etc/iptables/rules.v4

# Add these rules to allow HTTP and HTTPS
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT

sudo iptables-restore < /etc/iptables/rules.v4


curl ifconfig.me


sudo apt update && sudo apt upgrade -y
sudo apt install python3 -y


sudo apt install curl git unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev -y
sudo snap install flutter --classic
flutter --version


cd <your-flutter-project>
flutter build web --release   # Optional: add --release flag

cd build/web
sudo python3 -m http.server 80   # Run server on port 80 (HTTP)


http://<your-public-ip>


#Cloud Firewall / Ingress Configuration

Add these rules to allow public HTTP/HTTPS access:
Source Type	Source CIDR	Protocol	Destination Port	Description
CIDR	0.0.0.0/0	TCP	80	Allow HTTP traffic
CIDR	0.0.0.0/0	TCP	443	Allow HTTPS traffic