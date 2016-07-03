echo "[ Vim setup ]"
echo "Copying dotfile to /usr/share/vim/vimrc ..."
sudo cp $repo/conf/dotfiles/vim/vimrc /usr/share/vim/vimrc
echo "Creating local directory $HOME/.vim/colors ..."
mkdir -p $HOME/.vim/colors
echo "Copying vim color schemes ..."
cp $repo/conf/dotfiles/vim/colors/* $HOME/.vim/colors
