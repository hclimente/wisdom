# Git resources

![https://xkcd.com/1597/](http://imgs.xkcd.com/comics/git.png)

## Step-by-step guides
* [On undoing, fixing, or removing commits in git](http://sethrobertson.github.io/GitFixUm/fixup.html)

## Code
### Merge branches to master

```
git checkout master
git pull origin master
git merge test
git push origin master
```

### Custom gitignore global

In bash/gitignore_global there is a list of common patterns I would like git to systematically ignore (based on https://gist.github.com/octocat/9257657).

```
git config --global core.excludesfile bash/gitignore_global
```

### Change remote URL

Sometimes we clone the repository using the HTTPS URL, or for some other reason, we are not using the SSH access. The later is quite convinient, since it allows to use the SSH keys for automatic login. Additionally, sometimes HTTPS won't work because of the network settings, and the command (e.g. ```git pull```) will do nothing, returning a timeour error after a while. To change it:

```
git remote set-url origin ssh://git@github.com/USER/PROJECT.git
```
