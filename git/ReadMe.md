# Git Notes

## Git Init

```bash
git init
```

Initialises a Git repository in the current directory.

---

## Git Add

```bash
git add hello.txt
```

Stages the current version of a file for the next commit.

Think of this as placing the current version of the file into a staging area, ready to be committed.

If you modify the file again after running `git add`, you need to run `git add` again to stage the newer changes.

---

## Git Status

```bash
git status
```

Shows the current state of your local repository.

It can show:

* Modified files
* Staged files
* Untracked files
* Your current branch
* Whether your branch is ahead of or behind its remote branch

---

## Git Commit

```bash
git commit -m "Commit message"
```

Creates a new commit containing the staged changes in your local repository.

The `-m` option allows you to provide a commit message.

Example:

```bash
git commit -m "Add login page"
```

---

## Git Remote

```bash
git remote add origin git@github.com:username/repository.git
```

Connects your local repository to a remote repository on GitHub.

`origin` is simply a nickname for the remote repository URL.

You can check your configured remotes using:

```bash
git remote -v
```

---

## Rename a Branch

```bash
git branch -M main
```

Renames the current local branch to `main`.

---

## Git Push

```bash
git push -u origin main
```

Pushes your local commits to the `main` branch on the remote repository.

The `-u` option sets `origin/main` as the upstream branch.

Once the upstream has been configured, future pushes can normally be done with:

```bash
git push
```

---

# Branches

## Creating and Switching to a Branch

```bash
git checkout -b "branch-name"
```

Creates a new branch and immediately switches to it.

The new branch starts from the commit you are currently on, so it initially contains the same project state.

You can then make changes on the new branch without changing the `main` branch.

---

## Git Merge

```bash
git merge "branch-name"
```

Merges the specified branch into the branch you are currently on.

For example:

```bash
git checkout main
git merge feature/about
```

This switches to `main` and then merges `feature/about` into it.

### Merge Conflicts

When you merge, Git compares the histories of the branches.

A merge conflict can occur when the same section of a file has been modified differently in both branches.

Git cannot safely decide which version should be kept, so it marks the conflicting sections of the file.

You manually edit the file to resolve the conflict.

You then stage the resolved changes:

```bash
git add filename
```

and commit them to complete the merge.

---

# Updating Your Local Repository

## Git Pull

```bash
git pull
```

Fetches the latest commits from the tracked remote branch and integrates them into your current local branch.

This allows you to keep your local branch up to date with the remote branch.

---

# Undoing Changes

## Git Restore

```bash
git restore filename
```

Discards unstaged changes to a file and restores it to its last committed state.

Be careful because the discarded changes are normally lost.

---

## Git Restore Staged

```bash
git restore --staged filename
```

Removes a file's changes from the staging area without deleting the changes from your working directory.

You can then decide whether to modify the file, stage it again, or restore it.

---

## Git Reset Soft

```bash
git reset --soft HEAD~1
```

Moves the current branch back by one commit while keeping the changes from that commit staged.

Useful when you want to redo your most recent commit.

---

## Git Reset Mixed

```bash
git reset --mixed HEAD~1
```

Moves the current branch back by one commit and unstages the changes.

The changes remain in your working directory.

---

## Git Reset Hard

```bash
git reset --hard HEAD~1
```

Moves the current branch back by one commit and discards the changes.

This is destructive, so it should be used carefully.

---

## Git Revert

```bash
git revert HEAD
```

Creates a new commit that reverses the changes introduced by the previous commit.

Unlike `git reset`, the original commit remains in the project's history.

This makes `git revert` particularly useful when undoing changes that have already been shared with other people.

---

# Viewing Git History

## Git Log

```bash
git log
```

Shows the commit history reachable from the current branch.

It allows you to see information such as:

* Commit hashes
* Authors
* Dates
* Commit messages

---

## Git Reflog

```bash
git reflog
```

Shows the local history of movements of references such as `HEAD`.

This is useful when you accidentally move your branch using a command such as:

```bash
git reset --hard HEAD~1
```

If a commit disappears from your normal `git log`, you may still be able to locate its commit hash using `git reflog` and recover it.

For example:

```bash
git reflog
git reset --hard <commit-hash>
```

---

# Git Stash

## Creating a Stash

```bash
git stash
```

Temporarily stores your uncommitted changes so you can work on something else without committing them.

You can also give the stash a message:

```bash
git stash push -m "WIP login page"
```

`WIP` commonly means "work in progress".

---

## Git Stash List

```bash
git stash list
```

Displays your saved stashes.

---

## Git Stash Apply

```bash
git stash apply
```

Reapplies the most recent stash while keeping it in the stash list.

This is useful when you want to restore your work but keep the stash as a backup.

---

## Git Stash Pop

```bash
git stash pop
```

Reapplies the most recent stash and removes it from the stash list if it is successfully applied.

A useful way to remember the difference is:

```text
apply = restore and keep the stash
pop   = restore and remove the stash
```

---

# Rebase

```bash
git rebase
```

Reapplies commits onto a different base and can be used to create a cleaner, more linear commit history.

Interactive rebase can also be used to modify commit history.

For example:

```bash
git rebase -i HEAD~2
```

You can use operations such as `squash` to combine multiple commits into one.

Rebasing rewrites commit history, so extra care should be taken when rebasing commits that have already been shared with other people.

---

# Cherry Pick

```bash
git cherry-pick <commit-hash>
```

Applies a specific commit from another branch to your current branch.

This is useful when you only want a particular change from another branch rather than merging the entire branch.

---

# Gitignore

```text
.gitignore
```

`.gitignore` is a file that tells Git which files and directories it should ignore.

Common examples include:

```gitignore
node_modules/
.env
*.log
```

For example, `node_modules` is commonly ignored because it can contain a very large number of files and can normally be recreated using the project's package files.

A file that is already being tracked by Git is not automatically untracked simply because you add it to `.gitignore`.

---

# Amending a Commit

```bash
git commit --amend
```

Allows you to modify your most recent commit.

For example, imagine you commit:

```bash
git commit -m "Add login page"
```

but then realise that you forgot to include `styles.css`.

Instead of creating another commit such as:

```text
Forgot styles.css
```

you can stage the forgotten file:

```bash
git add styles.css
```

and amend the previous commit:

```bash
git commit --amend
```

This allows the forgotten change to become part of the previous commit and keeps the commit history cleaner.

Amending rewrites the most recent commit, so extra care should be taken if that commit has already been pushed and shared with others.
