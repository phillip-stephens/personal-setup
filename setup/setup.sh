#/!bin/bash
# Enable the errexit option, so if any command fails execution stops
set -e

# Check with user that this is okay
echo "This script will update your mac, install Homebrew, and quite a few other dependencies. It will also likely take some time."
echo "Do you want to continue? (Y/N)"
read input

if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
    echo "Continueing with install"
else
	echo "Script aborted."
	exit 0
fi

# Install any System Updates
echo "Checking for System Updates"
softwareupdate -l

echo "Installing any available system updates"
sudo softwareupdate -ia

# Check if Homebrew is installed
echo "Checking if Homebrew is installed"
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Disable errexit for homebrew isntall, in case packages are already present
set +e
# Install Obsidian
echo "Installing Obsidian"
brew install --cask obsidian

# Install Rectangle
echo "Installing Rectangle, a window manager for MacOS similiar to the now deprecated Spectacle"
brew install --cask rectangle

# Install iTerm2
echo "Installing iTerm2"
brew install --cask iterm2

# Install Docker
echo "Installing Docker"
brew install docker

# Install Bitwarden
echo "Installing Bitwarden"
brew install --cask bitwarden

# Install Google Chrome
echo "Installing Google Chrome"
brew install --cask google-chrome

# Install Google Drive
echo "Installing Google Drive"
brew install --cask google-drive

# Install Google Drive
echo "Installing Google Drive"
brew install --cask google-drive

# Install Zoom
echo "Installing Zoom"
brew install --cask zoom

# Install Todoist
echo "Installing Todoist"
brew install --cask todoist

# Install ZSH
echo "Installing and Configuring ZSH"
echo "You'll want to restart your terminal"
brew install zsh

# Re-enable errexit
set -e
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

echo "Please confirm you understand you must install SSH key from Bitwarden to ~/.ssh/ (Y/N)"
read input

if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
    echo "Thanks for confirming!"
else
	echo "Script aborted."
	exit 0
fi