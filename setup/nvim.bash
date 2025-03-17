# download and extract neovim
mkdir -p ~/Downloads
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
tar xvf nvim-*

# install neovim
cd $(ls -d */ | grep nvim)
sudo cp -v bin/nvim /usr/bin/
sudo cp -rv lib/nvim/ /usr/lib/
sudo cp -rv share/nvim/ /usr/share/
cd ~ && rm -rf ~/Downloads/nvim-*

# download nvchad config
rm -rf ~/.config/nvim/
git clone https://github.com/NvChad/starter ~/.config/nvim

# enable relative line numbers
echo "vim.opt.relativenumber = true" >> ~/.config/nvim/lua/options.lua

# enable default editor to nvim for ranger
echo export EDITOR=\"nvim\" >> ~/.bashrc

# prompt user to source bash
echo "Please run 'source ~/.bashrc' for changes to take effect"