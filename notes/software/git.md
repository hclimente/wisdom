# Git resources

# Step-by-step guides
* [On undoing, fixing, or removing commits in git](http://sethrobertson.github.io/GitFixUm/fixup.html)

# Branches

## Merge branches two branches

```
# merge master and feature-branch
git checkout master
git pull origin master
git merge feature-branch
git push origin master
```

## Abort ongoing merge

```
git merge --abort
```

## Remove a branch

```
git branch -d feature-branch
```

# Keeping a clean repository

## Custom gitignore global

In bash/gitignore_global there is a list of common patterns I would like git to systematically ignore (based on https://gist.github.com/octocat/9257657).

```
git config --global core.excludesfile bash/gitignore_global
```

[gitignore.io](https://www.gitignore.io/) is a useful tool to create custom ```.gitignore``` files.

## Submodules

Submodules are a way for a git repository to include other git repositories, specifically a commit. When that repository is changed, we can pull, switch branches, etc. and save the new status of the submodules.

### Adding a submodule

```
git submodule add ssh://git@github.com/USER/PROJECT.git
```

### Handling a submodule

Submodules are just like any other git repository, so they accept any operation you would expect. However, as stated above, they point at a specific commit. So no matter what changes you do, just commit them and make sure the repository is checked-out at it.

### Downloading repository with all its Submodules

```
git clone --recursive ssh://git@github.com/USER/PROJECT.git
```

### Removing a submodule

Solution proposed by [CodeWizard](https://stackoverflow.com/questions/29850029/what-is-the-current-way-to-remove-a-git-submodule):

```
git submodule deinit REPO/PATH
git rm REPO/PATH
git rm --cached REPO/PATH
rm -rf .git/modules/REPO/PATH
```

# Remote repository

## Change remote URL

Sometimes we clone the repository using the HTTPS URL, or for some other reason, we are not using the SSH access. The later is quite convenient, since it allows to use the SSH keys for automatic login. Additionally, sometimes HTTPS won't work because of the network settings, and the command (e.g. ```git pull```) will do nothing, returning a timeout error after a while. To change it:

```
git remote set-url origin ssh://git@github.com/USER/PROJECT.git
```

# Others

![https://xkcd.com/1597/](http://imgs.xkcd.com/comics/git.png)
