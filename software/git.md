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
