git init  -- # Initialize a new Git repository

git clone <repo-url>  -- # Clone a remote repository

git status  -- # Show current changes and branch status

git add .  -- # Stage all changes for commit

git commit -m "Message"  -- # Commit staged changes with a message

git pull  -- # Fetch and merge changes from remote

git fetch  -- # Fetch changes from remote without merging

git push origin main  -- # Push local 'main' branch to remote

git push origin <branch>  -- # Push local branch to remote

git checkout <branch>  -- # Switch to an existing branch

git checkout -b <new-branch>  -- # Create and switch to a new branch

git restore .  -- # Undo local changes in working directory

git clean -fd  -- # Delete untracked files and directories

git branch  -- # List local branches

git branch -a  -- # List local and remote branches

git branch -D <branch>  -- # Force delete a local branch

git push --delete origin <branch>  -- # Delete a branch from remote

git checkout main ; git merge dev  -- # Merge 'dev' into 'main'

git remote -v  -- # Show remote URLs

git remote remove origin  -- # Remove current remote

git remote add origin <url>  -- # Add a new remote URL

git remote set-url origin <new-url>  -- # Change the remote URL

git remote rename origin old-origin  -- # Rename the remote

git remote prune origin  -- # Clean up deleted remote branches

git push -u origin <branch>  -- # Push and track remote branch

git branch --set-upstream-to=origin/<branch>  -- # Link local branch to remote

git branch -vv  -- # Show branches with tracking info

git reset --hard HEAD  -- # Reset all local changes to last commit

git reset --soft HEAD~1  -- # Undo last commit, keep changes staged

git revert <commit>  -- # Create a commit that undoes a specific commit

git branch -m <new-name>  -- # Rename current branch

git branch -m <old> <new>  -- # Rename any branch

rm -rf .git  -- # Delete Git history (start fresh)

git log --oneline --graph --all  -- # Compact commit history with tree

git diff  -- # Show unstaged changes

git diff --cached  -- # Show staged changes

git show <commit>  -- # Show details of a specific commit
