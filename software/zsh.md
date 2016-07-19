# Zsh
## Setup

1. Get zsh
2. Install [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```
3. (Optional) zsh as default shell [without root access](http://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access). (Beware that this can cause problems eg in the system boot when an unexpected console is taking over the system). Add to .bash_profile:
```
export SHELL=/bin/zsh
exec /bin/zsh -l
```
