1. Get zsh
2. Install Oh-my-zs:
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```
3. zsh as default shell (without root access)[http://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access]:. Add to .bash_profile:
```
export SHELL=/bin/zsh
exec /bin/zsh -l
```
