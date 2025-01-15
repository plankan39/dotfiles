#!/usr/bin/env sh

# Install zsh and change shell for user
[[ ! -x "$(command -v zsh)" ]] && sudo dnf install zsh -y

if [ ! $SHELL == $(which zsh) ]; then
	[[ ! -x "$(command -v chsh)" ]] && sudo dnf install util-linux-user -y
	chsh -s $(which zsh)
fi

