# Ubuntu/Debian - Node.js & npm Setup
sudo apt install -y npm curl
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs
npm -v

# Project Setup
npm install
npm audit fix --force

# Development & Production
npm run dev                  # Start development server
npm run build && npm run export  # Build and export static site
npx serve out               # Serve production build

# Simple Python HTTP server to serve static files
python3 -m http.server 3000
# Access at http://localhost:3000


// next.config.js - minor fix for static export with Next.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "export",           // Enable static export mode
  images: {
    unoptimized: true,        // Fix for images in static export
  },
};

module.exports = nextConfig;


# Fedora - Node.js & Expo Setup
sudo dnf update
sudo dnf install -y nodejs
node -v
npm -v

sudo npm install -g expo-cli
npx create-expo-app --template

cd app_name
npm run web
npx expo start
