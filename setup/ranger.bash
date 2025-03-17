# install ranger
sudo apt-get install ranger -y

# add ranger to bashrc
echo alias rn=\"ranger\" >> ~/.bashrc
echo alias ranger=\". ranger\" >> ~/.bashrc

# add ranger config
mkdir -p ~/.config/ranger && touch ~/.config/ranger/rc.conf
echo "set line_numbers relative" >> ~/.config/ranger/rc.conf
echo "set show_hidden true" >> ~/.config/ranger/rc.conf

# prompt user to source bashrc
echo "Please run 'source ~/.bashrc' to apply changes"