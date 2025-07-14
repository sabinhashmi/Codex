# -------------------------
# Download CursorAI AppImage
# -------------------------
# (Assuming already downloaded: cursor-0.42.4x86_64.AppImage)

# Make executable
chmod +x cursor-0.42.4x86_64.AppImage

# Install libfuse2 if required (Ubuntu/Debian)
sudo apt-get install -y libfuse2

# Run the AppImage
./cursor-0.42.4x86_64.AppImage

# -------------------------
# Optional: Add to Applications
# -------------------------

# Move AppImage to /opt
sudo mv cursor-0.42.4x86_64.AppImage /opt/cursor.appimage

# Create desktop entry
sudo tee /usr/share/applications/cursor.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor.appimage
Icon=/opt/cursor.png
Type=Application
Categories=Development;
EOF

# Note: Place a suitable icon file at /opt/cursor.png for the launcher
