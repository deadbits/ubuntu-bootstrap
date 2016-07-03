echo "[ GitHub setup ]"
echo "[*] Enter your Github username: "
read github_user
echo "[*] Enter your Github email address: "
read github_email
    
if [[ $github_user && $github_email ]]; then
    git config --global user.name $github_user
    git config --global user.email $github_email
    git config --global github.user $github_user

    cd $HOME/.ssh
    ssh-keygen -t rsa -C $github_email
    echo "[-] Add the SSH public key located at $HOME/.ssh/$github_email to your account."
fi

cd $work