# Re-enable errexit
set -e
# install zsh
apt install zsh
## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Making default shell
chsh -s $(which zsh)

# Install Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
echo "WARNING - You'll need to configure Powerline fonts in iTerm2 settings, or this won't work"
echo "Please confirm you understand you must enable Powerline Fonts (Y/N)"
read input
if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
    echo "Thanks for confirming!"
else
	echo "Script aborted."
	exit 0
fi

# Clone Personal Setup
echo "Cloning personal setup to ~/personal-setup"
cd ~/
git clone https://github.com/phillip-stephens/personal-setup.git

# Setup ZSH
echo "Linking .zshrc file to ~/zshrc"
ln -s ~/personal-setup/zsh/.zshrc ~/.zshrc

# Setup vimrc
ln -s ~/personal-setup/vim/.vimrc ~/.vimrc
