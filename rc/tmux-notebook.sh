tmux rename-window "Notebook 1"
tmux split-window -h              # split window into panes...
tmux select-pane -L               # move cursor back to the pane on the left...
tmux resize-pane -x 50            # set the width (x) of the pane to be 50 cells...
clear
