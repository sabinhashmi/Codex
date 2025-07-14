# -------------------------
# VSCode Flutter Setup
# -------------------------

# 1. Install Flutter extension via VSCode Command Palette: Flutter: New Project

# 2. Clone Flutter SDK (if not installed)
# git clone https://github.com/flutter/flutter.git -b stable

# 3. Add Flutter to PATH (example for Zsh)
echo 'export PATH="$PATH:/path/to/flutter/bin"' >> ~/.zshrc
source ~/.zshrc

# -------------------------
# Flutter Basic Commands
# -------------------------

flutter doctor

flutter create <project_name>
cd <project_name>

# Run app on default device
flutter run

# Run app on web server
flutter run -d web-server

# Build production-ready web app
flutter build web

# -------------------------
# Optional Tips
# -------------------------

# For automatic refresh in debug mode (hot reload), just run flutter run

# Use Snap for easy Flutter installation on supported distros
# sudo snap install flutter --classic

# Set Brave as default browser for Flutter web (Linux example)
which brave-browser
echo 'export CHROME_EXECUTABLE=/usr/bin/brave-browser' >> ~/.bashrc
source ~/.bashrc
