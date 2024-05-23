CWD=$(pwd)

# Backup of previous settings
if [ -f "$HOME/.zshrc" ]; then
  mkdir ${CWD}/backup
  mv $HOME/.zshrc ${CWD}/backup/.zshrc
fi

if [ -d "$HOME/.zsh" ]; then
  mv $HOME/.zsh ${CWD}/backup/.zsh
fi

if [ -d "$HOME/.config/nvim" ]; then
  mkdir ${CWD}/backup/.config
  mv $HOME/.config/nvim ${CWD}/backup/.config/nvim
fi


# Setting for Git
git config --global core.editor "nvim"
git config --global commit.template ${CWD}/.commit_template


# Setting for Zsh
ln -sv ${CWD}/.zshrc $HOME/.zshrc
ln -sv ${CWD}/.zsh $HOME/.zsh


# Setting for Neovim
ln -sv ${CWD}/.config/nvim $HOME/.config/nvim

