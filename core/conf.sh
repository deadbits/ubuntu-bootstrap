echo "[ Conf setup ]"
echo "setup dot folder and conf"
rm -rf $HOME/.jc
mkdir -p $HOME/.jc/src/conf
rm -rf $repo/conf
git clone https://github.com/john2c7/conf.git
cp -a $repo/conf/. $HOME/.jc/src/conf
echo "sylink vim"
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc
ln -s $HOME/.jc/src/conf/.vim $HOME/.vim
ln -s $HOME/.jc/src/conf/.vimrc $HOME/.vimrc
echo "sylink bash"
rm $HOME/.bash_profile
rm -rf $HOME/.bashrc
rm -rf $HOME/.bash_profile
ln -s $HOME/.jc/src/conf/.bash_profile $HOME/.bash_profile
ln -s $HOME/.jc/src/conf/.bashrc $HOME/.bashrc
echo "sylink tmux"
rm -rf $HOME/.tmux.conf
ln -s $HOME/.jc/src/conf/.conf $HOME/.tmux.conf
source $HOME/.bashrc
