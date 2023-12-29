#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

link_file() {
    local src=$1
    local dest=$2

    if [ -f "$dest" ] || [ -d "$dest" ]; then
        mv "$dest" "$dest.backup"
        echo "Backed up $dest to $dest.backup"
    fi

    ln -s "$src" "$dest"
    echo "Linked $src to $dest"
}

echo "Setting up your dotfiles..."

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/i3/config" "$HOME/.config/i3/config"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"


echo "Dotfiles setup complete."


echo "Setting up your scripts"

if [ -f "$DOTFILES_DIR/tmux-sessionizer" ]; then
    mkdir -p /usr/local/bin 
    link_file "$DOTFILES_DIR/tmux-sessionizer" "/usr/local/bin"
    chmod +x "$HOME/bin/tmux-sessionizer"
fi

echo "Scripts setup complete."
