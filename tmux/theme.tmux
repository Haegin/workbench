#build theme
set -g status-bg black
set -g status-fg colour238
set -g status-left-length 30
set -g status-right-length 140

# status bar
set -g window-status-separator ''
set -g status-interval 10
set -g status-left '#[bg=colour235,fg=colour245] #h  #[bg=colour000,fg=colour235]⮀'
set -g status-right '#(~/tmux/segments/machine-stats)#(~/tmux/segments/travis-status)#(~/tmux/segments/inbox-count)#(~/tmux/segments/battery)#(~/tmux/segments/lan-ip)#[fg=colour213] %H:%M'
setw -g window-status-format '#[bg=colour000,fg=colour238]#I #[fg=colour244]#W#[default]  '
setw -g window-status-current-format '#[bg=colour255,fg=colour000]⮀ #W #[bg=colour000,fg=colour255]⮀ '

# pane borders
set -g pane-border-fg 'colour236'
set -g pane-active-border-fg 'colour246'
