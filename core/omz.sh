echo "[ oh-my-zsh setup ]"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
echo "Copying zshrc template to $HOME/.zshrc ..."
cp $repo/conf/zsh/.zshrc $HOME/.zshrc
