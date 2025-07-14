# -------------------------
# Conda Environment Setup
# -------------------------

# Create a named environment
conda create -n box python=3.9

# OR: Create environment at a custom path
conda create --prefix /path/to/box python=3.9

# Set custom directories (optional, e.g. for workspace-based setup)
conda config --append envs_dirs /path/to/envs
conda config --append pkgs_dirs /path/to/pkgs

# Optional: Customize environment prompt
conda config --set env_prompt '({name})'

# Remove environment completely
conda remove -n box --all

# -------------------------
# Jupyter Kernel Integration
# -------------------------

# Install IPython kernel in the environment
pip install ipykernel

# Register the environment as a Jupyter kernel
python -m ipykernel install --user --name box
