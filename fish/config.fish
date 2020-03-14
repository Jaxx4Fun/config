# Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
#end

if test ! -n "$TMUX" 
    # #incompatible with vscode
    # tmux attach -t (whoami)||tmux new -s (whoami)
end

alias sudo "sudo -E"
