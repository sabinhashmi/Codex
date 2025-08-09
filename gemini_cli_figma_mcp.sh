# -------------------------
# NVM & Node.js Setup
# -------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Restart shell or source profile after installing nvm
# e.g. source ~/.bashrc or source ~/.zshrc

nvm install 22
nvm use 22

node -v          # Expect v22.17.0
nvm current      # Expect v22.17.0
npm -v           # Expect 10.9.2

# -------------------------
# Gemini CLI Installation
# -------------------------

# Run once without install (temporary)
npx https://github.com/google-gemini/gemini-cli

# Install globally (does not requires sudo)
npm install -g @google/gemini-cli

# Set Gemini API key (replace with actual key)
export GEMINI_API_KEY="[GeminiAPI]"

# Make the API key persists
echo 'export GEMINI_API_KEY="your-api-key"' >> ~/.bashrc
source ~/.bashrc

# -------------------------
# Gemini CLI config example (JSON)
# -------------------------
# Use as config for Gemini CLI MCP servers


{
  "theme": "Default",
  "selectedAuthType": "gemini-api-key",
  "mcpServers": {
    "Framelink Figma MCP": {
      "command": "npx",
      "args": [
        "-y",
        "figma-developer-mcp",
        "--figma-api-key=figd_-----4PxeV8",
        "--stdio"
      ]
    }
  }
}
