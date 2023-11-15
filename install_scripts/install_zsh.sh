#!/usr/bin/env sh

#Run from directory to install and initialize zsh

# Install zsh and change shell for user
[[ ! -x "$(command -v zsh)" ]] && sudo dnf install zsh -y

if [ ! $SHELL == $(which zsh) ]; then
	[[ ! -x "$(command -v chsh)" ]] && sudo dnf install util-linux-user -y
	chsh -s $(which zsh)
fi

# Install and symlink starship
if [ ! -x "$(command -v starship)" ]; then
	sudo dnf copr enable atim/starship -y
	sudo dnf install starship -y
fi
