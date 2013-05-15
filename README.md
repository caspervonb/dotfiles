## Install
  git clone https://github.com/caspervonb/dotfiles.git ~/.dotfiles; for e in $(ls ~/.dotfiles | grep -v "\.md$"); do rm -r ~/.$e; ln -s ~/.dotfiles/$e ~/.$e; done
