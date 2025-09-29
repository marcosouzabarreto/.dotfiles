if status is-interactive
    test -e ~/.config/fish/functions/fisher.fish; and source ~/.config/fish/functions/fisher.fish
end

set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $PATH

# Aliases
alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -lha"
alias gs="git status"
alias v="nvim"
