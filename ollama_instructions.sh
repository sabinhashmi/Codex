# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama server (optional)
ollama serve

# Download a model
ollama download <Model>

# Run a model with a prompt
ollama run <Model> <Prompt>

# List downloaded models
ollama list

# Remove a model
ollama rm <Model>

# Copy/rename a model
ollama cp <Model> <ModelNewName>
