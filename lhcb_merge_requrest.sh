# -------------------------
# Git & Lb Basic Setup
# -------------------------

# Configure Git globally
git config --global user.name "[name]"
git config --global user.email "[email]"
git config --global lb-use.protocol ssh

# Verify config
git config --global --list

# Generate SSH key (if needed)
ssh-keygen

# Configure SSH for gitlab.cern.ch
vim ~/.ssh/config

# -------------------------
# Git Lb Workflow
# -------------------------

# Format code relative to origin/master
lb-format --reference origin/master
OR
pre-commit run --all-files

# Create and checkout new branch using lb-checkout
git lb-checkout -b [branch_name]

# Stage and commit changes
git add .
git commit -m "Message"

# Push branch using lb-push
git lb-push

# -------------------------
# CI/CD and Copyright Checks
# -------------------------

lb-check-copyright
lb-add-copyright

# -------------------------
# Cloning & Param Files
# -------------------------

# Clone repo normally
git clone <repo_url>

# Clone ParamFiles package
git lb-clone-pkg ParamFiles

# -------------------------
# Branch Removal
# -------------------------

# Delete remote branch
git push Rec --delete [branch_name]

# Delete local branch
git branch -D [branch_name]
