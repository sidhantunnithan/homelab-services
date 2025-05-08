# install dependencies
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config -y

# create downloads directory
mkdir -p ~/Downloads
cd ~/Downloads

# install tmux
wget https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
tar -zxf tmux-*.tar.gz
cd tmux-*/
./configure
make -j25 && sudo make install
cd ~ && rm -rf ~/Downloads/tmux-*

# install tmux plugin manager
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# add tmux config
echo "
set-option -g prefix C-b

set -g mouse on
set -g default-terminal 'screen-256color'
set -g history-limit 5000

set-option -g allow-rename off
set-option -g renumber-windows on

bind '\"' split-window -c \"#{pane_current_path}\"
bind % split-window -h -c \"#{pane_current_path}\"
bind c new-window -c \"#{pane_current_path}\"

bind-key -r -T prefix C-k resize-pane -U 5
bind-key -r -T prefix C-j resize-pane -D 5
bind-key -r -T prefix C-l resize-pane -R 5
bind-key -r -T prefix C-h resize-pane -L 5

bind-key -r -T root C-k select-pane -U
bind-key -r -T root C-j select-pane -D
bind-key -r -T root C-l select-pane -R
bind-key -r -T root C-h select-pane -L

bind R source-file ~/.tmux.conf

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'

set -g @continuum-restore 'on'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
" >~/.tmux.conf

