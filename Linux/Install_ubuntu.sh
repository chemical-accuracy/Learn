# Get the latest stable Ubuntu here  https://ubuntu.com/download/desktop

# Settings -> Keyboard Shortcuts -> at the bottom add custom
# Kill processes xkill Ctrl+k
# Now by clicking with an x on any window you can kill the process

# Update packages immediately upon installation
sudo apt-get update
sudo apt-get upgrade

######################################
# Add SWAP (default is only 2Gb)
# allocate 8 Gb of disk to another swap file (to expand memory)
sudo fallocate -l 8G /swapfile-1 
# setting the block size and number of blocks and copying zeros into this new swap file
sudo dd if=/dev/zero of=/swapfile-1 bs=8192 count=1048576 
sudo chmod 600 /swapfile-1 # change permission to only root
sudo mkswap /swapfile-1 # format file with the swapfile system
sudo swapon /swapfile-1 # enable the swap file
free -m # check that there is additional swap memory
# Now tell the system this is a swap file on load.
sudo vi /etc/fstab 
# Copy the last line (and rename the first entry, i.e. file name, to swapfile-1)

#################################################

# Install packages
sudo apt install terminator # terminal with fancy features
#use ctrl+shift+E to split vertically and ctrl+shift+O to split horizontally.
#Alt+arrows move btw windows

sudo apt install curl # curl link will show the json (raw) vs wget link will download stuff

sudo apt install vim # better text editor

sudo apt install htop # better version of top

sudo apt install p7zip-full # to uncompress .7z files among others

sudo apt install w3m w3m-img # command line browser (and its inline image supprot)
# SHIFT+q to quit, SHIFT+b to go back, shift+t for new tab, shift+u for new url

sudo apt install git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
gh auth login
#Use the browser to authenticate

# Set up git config

###############################
# developer tools
sudo apt install build-essential # GNU debugger, g++/GNU compilers, dpkg-dev, GCC and make
sudo apt install gfortran # GNU fortran compiler

# Intel fortran compiler and MKL, details here: https://www.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/top/installation/install-using-package-managers/apt.html
# download the key to system keyring
wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null
# add signed entry to apt sources and configure the APT client to use Intel repository:
echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
sudo apt update
sudo apt install intel-oneapi-compiler-fortran
sudo apt install intel-oneapi-mkl
echo "# Intel libraries (compiler, MKL etc.)" >> ~/.bashrc; echo "source /opt/intel/oneapi/setvars.sh > /dev/null" >> ~/.bashrc
######################################
# Install Software
# 0. Anaconda https://docs.conda.io/projects/conda/en/latest/user-guide/install/download.html
bash *conda*.sh
conda update conda
conda config --add channels conda-forge
conda install numpy sympy scipy fortls fpm matplotlib pandas
# python packages and last 2 for fortran
conda create --name py2 python=2
conda activate py2
conda install numpy sympy scipy matplotlib


# 1. VS Code 
sudo apt install code
#Extensions: (language support) Python, C/C++, Modern Fortran, 
# (to connect via SSH) Remote - SSH
# (to develop a web-site) Live Server
# (better git support) GitLens
# (open pdf inside code) vscode-pdf, 

# 2. Thunderbird:
sudo snap install thunderbird

# 3. VLC
sudo snap install vlc

# 4. Dropbox https://www.dropbox.com/install 
sudo apt install ~/Downloads/dropbox*

# 5. Zoom https://zoom.us/download
sudo snap install zoom-client

# 6. Slack 
sudo snap install slack

# 7. Mendeley Reference manager: https://www.mendeley.com/download-reference-manager/linux
chmod u+x *mendeley*.AppImage
./*mendeley*.AppImage --appimage-extract
mv squashfs-root Mendeley-reference-manager

# 8. CLion (download as snap) - free for students
sudo snap install clion --classic

###################################
# SSH and config file
.ssh
ssh-keygen
ssh-copy-id username@IP_address
