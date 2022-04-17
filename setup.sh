#!/bin/zsh

########################################
# Download and install oh-myz-zsh 
########################################
wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
export RUNZSH=no
bash install.sh 

########################################
# oh-my-zsh plugins
########################################
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' $HOME/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' $HOME/.zshrc
        
########################################
# neovim
########################################
#curl -fLo $HOME/.bin/nvim.appimage --create-dirs  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
#chmod a+x $HOME/.bin/nvim.appimage
#git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
echo "alias vi=\"$HOME/nvim-linux64/bin/nvim\"" >> $HOME/.zshrc
echo "set -o vi" >> $HOME/.zshrc
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc

########################################
# miniconda 
########################################
if [ $(arch) == 'arm64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
elif [ $(arch) == 'aarch64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
elif [ $(arch) == 'x86_64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
else
  echo "Unknown arch $(arch)"
  echo "update setup.sh script with new arch"
  exit 1;
fi

wget $miniconda_path -O miniconda3-latest.sh
zsh miniconda3-latest.sh -b
$HOME/miniconda3/bin/conda init zsh
