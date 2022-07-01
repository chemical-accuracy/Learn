# Get the latest stable Ubuntu here  https://ubuntu.com/download/desktop

# Software & Updates -> Other Software -> Canonical partners
# (to have access to more packages)

# Settings -> Keyboard Shortcuts -> at the bottom add custom
# Kill processes xkill Ctrl+k
# Now by clicking with an x on any window you can kill the process

# Update packages immediately upon installation
sudo apt-get update
sudo apt-get upgrade

######################################
# Add SWAP (default is only 2Gb)
# allocate 16 Gb of disk to another swap file (to expand memory)
sudo fallocate -l 8G /swapfile-1 
# setting the block size and number of blocks and copying zeros into this new swap file
sudo dd if=/dev/zero of=/swapfile-1 bs=8192 count=1048576 
sudo chmod 600 /swapfile-1 # change permission to only root
sudo mkswap /swapfile-1 # format file with the swapfile system
sudo swapon /swapfile-1 # enable the swap file
free -m # check that there is additional swap memory
# Now tell the system this is a swap file on load.
sudo vim /etc/fstab 
# Copy the last line (and rename the first entry, i.e. file name, to swap-1)

#################################################

# Install packages
sudo apt install terminator # terminal with fancy features
#use ctrl+shift+E to split vertically and ctrl+shift+O to split horizontally.
#Alt+arrows move btw windows

sudo apt install curl # curl link will show the json (raw) vs wget link will download stuff

sudo apt install vim # better text editor

sudo apt install htop # better version of top

sudo apt install git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
gh auth login
#Use the browser to authenticate

# Set up git config

######################################
# Install Software
# 1. VS Code https://code.visualstudio.com/docs/?dv=linux64_deb
sudo apt install ./code
Extensions: python, bracket pair colorizer, C++, Modern Fortran, ToDo Tree

# 2. Thunderbird:
sudo snap install thunderbird

# 3. VLC
sudo snap install vlc

# 4. Dropbox https://www.dropbox.com/install 
sudo apt install ~/Downloads/dropbox

# 5. Zoom https://zoom.us/download
sudo apt install ~/Downloads/zoom

# 6. Slack https://slack.com/downloads/linux
sudo apt install ~/Downloads/slack

# 7. Mendeley Desktop: https://www.mendeley.com/download-mendeley-desktop-legacy#download
#Requires python2 
sudo apt install ./mendeleydesktop_1.19.8-stable_amd64.deb

# 8. CLion (download as snap) - free for students
sudo snap install clion --classic

###################################
# SSH and config file
.ssh
ssh-keygen
ssh-copy-id username@IP_address
