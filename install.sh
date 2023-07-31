#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e
sudo spctl --master-disable
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

ln -s $DIR/.vimrc ~/
ln -s $DIR/.tmux.conf ~/

sed -i 's#source $ZSH/oh-my-zsh.sh#source '$DIR'/.pre_zshrc\
source $ZSH/oh-my-zsh.sh\
source '$DIR'/.post_zshrc#g' ~/.zshrc

cd $DIR
brew bundle

gem source -r https://rubygems.org/
gem source -a http://mirrors.aliyun.com/rubygems/
sudo gem install tmuxinator

ln -s $DIR/imgcat /usr/bin/

# yarn config set http-proxy http://127.0.0.1:6152
# yarn config set https-proxy http://127.0.0.1:6152
yarn global add typescript browser-sync ts-node nodemon

ln -s $HOME/.bin/services/homebrew.mxcl.aria2.plist /usr/local/opt/aria2/homebrew.mxcl.aria2.plist
mkdir -p ~/.aria2
ln -s $DIR/aria2.conf ~/.aria2/

