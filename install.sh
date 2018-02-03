#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e
sudo spctl --master-disable
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

brew install coreutils --with-gmp
brew install findutils --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnutls gawk
brew install grep --with-default-names
brew install gnu-tar --with-default-names
brew install git --with-blk-sha1 --with-curl --with-gettext --with-openssl --with-pcre2 
brew install stormssh mycli pgcli gcc fontforge wget jq tmux yarn caddy go ruby zsh-completions python3 oath-toolkit qrencode zbar smartmontools p7zip watch fish htop httpie

gem source -r https://rubygems.org/
gem source -a http://mirrors.aliyun.com/rubygems/
sudo gem install tmuxinator
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# yarn config set http-proxy http://127.0.0.1:6152
# yarn config set https-proxy http://127.0.0.1:6152
yarn global add typescript browser-sync ts-node nodemon

ln -s $DIR/.vimrc ~/
ln -s $DIR/.tmux.conf ~/

sed -i 's#source $ZSH/oh-my-zsh.sh#source '$DIR'/.pre_zshrc\
source $ZSH/oh-my-zsh.sh\
source '$DIR'/.post_zshrc#g' ~/.zshrc
