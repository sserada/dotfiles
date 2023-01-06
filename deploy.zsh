#!/bin/bash

# config files
dotfiles=(.zshrc .zsh)

# create symlinks
for file in "${dotfiles[@]}"; do
        ln -svf ~/dotfiles/$file ~/
done
