if status is-interactive
    bind \cf tmux-sessionizer
end

alias cl="clear"
alias lgit="lazygit"
alias ldocker="lazydocker"
alias conf="z ~/.config"
alias nixos="z /etc/nixos"
alias store="z /nix/store"
alias nswitch="sudo nixos-rebuild switch --flake /etc/nixos#marco-laptop"
alias nswitchu="sudo nix flake update --flake /etc/nixos; and sudo nixos-rebuild switch --flake /etc/nixos#marco-laptop --upgrade"
alias nau="sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos"
alias nsgc="sudo nix-store --gc"
alias ngc="sudo nix-collect-garbage -d"
alias ngc7="sudo nix-collect-garbage --delete-older-than 7d"
alias ngc14="sudo nix-collect-garbage --delete-older-than 14d"
alias nuke_docker="docker stop $(docker ps -q) && docker rm -f $(docker ps -a -q) && docker rmi -f $(docker images -q) && docker volume rm -f $(docker volume ls -q) && docker network rm $(docker network ls -q) && docker builder prune -a -f && docker system prune -a -f --volumes"

# WORK
alias apify="~/mutable_node_modules/bin/apify"
# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
#   exec Hyprland
# end

set -gx EDITOR nvim
set -gx VOLUME_STEP 5
set -gx BRIGHTNESS_STEP 5


set -gx PATH $HOME/.cargo/bin $PATH

set fish_cursor_default block
set fish_cursor_insert block blink
set fish_cursor_visual block

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
