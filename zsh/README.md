### Things to Change
You'll need to point the `.zshrc` file at your installation of zsh, the top line of the file:
```shell
# Path to your oh-my-zsh installation.
export ZSH="/Users/pstephens/.oh-my-zsh"
```

#### Sym-link the zshrc file
# Link the config's new location into your $HOME
ln -s ~/git/dotfiles/zshrc ~/.zshrc
