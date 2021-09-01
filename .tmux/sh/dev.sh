tmux rename-window  ${PWD##*/} # uses shell parameter expansion (http://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) to grab only the current folder name
tmux selectp -t 1 # select the first (0) pane
tmux splitw -h -c $(pwd) -p 70 nvim
tmux selectp -t 1 # select the first (0) pane
tmux splitw -v -c $(pwd) -p 50
tmux selectp -t 1 # select the first (0) pane
