ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mh"

alias gclone="git clone $@"

# malware things
alias subfile="hachoir-subfile $@"
alias extmd="hachoir-metadata $@"
alias strings="strings -t x"

alias pyserve="python -m SimpleHTTPServer"
alias b64dec="python -m base64 -d $@"
alias b64enc="python -m base64 -e $@"

alias clrhist='cat /dev/null > ~/.zsh_history'
alias srm='srm -m -v -f $@'

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias btcnow="python -c 'import requests; r = requests.get(\"https://blockchain.info/tobtc?currency=USD&value=1\"); print \"USD:\t1.00\nBTC:\t%s\" % r.content.strip()'"
alias netmon="clear; while x=0; do clear; date; echo \"\"; echo \"Active Network Connections\"; echo \"----------------------\"; lsof -nPi| grep '\->' |awk '{print $9}'; sleep 5; done"

alias urlenc='python -c "import sys, urllib as u; print u.quote_plus(sys.argv[1])"'
alias urldec='python -c "import sys, urllib as u; print u.unquote_plus(sys.argv[1])"'

alias j="jobs"
alias h="history"
alias zshrc="vim ~/.zshrc"


gethashes()
{
    IFS=
    [ -n "$1" ] || return
    for i in $*; do
        md5=$(md5sum "$i" | awk '{print $1}')
        sha1=$(sha1sum "$i" | awk '{print $1}')
        sha256=$(sha256sum "$i" | awk '{print $1}')
        echo "File:   $i"
        echo "MD5:    $md5"
        echo "SHA1:   $sha1"
        echo "SHA256: $sha256"
        echo "\n"
    done
}


md5rename()
{
    IFS=
    local md5=
    [ -n "$1" ] || return
    for i in $*; do
        md5=$(md5sum "$i" | cut -d' ' -f)
        mv "$i" "$md5"
    done
}


zipmal()
{
    [ -n "$1" ] || return
    local name=${1%\.*}.zip
    zip -- encrypt -P infected "$name" $@
    ls -lh "$name"
}

wgetua()
{
    [ "$1" ] || return
    local ua='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0'
    wget -c --user-agent "$ua" "$1"
}


torwget()
{
    [ "$1" ] || return
    local ua='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0'
    torsocks wget -c --user-agent "$ua" "$1" 
}



geoip()
{
    wget -q --timeout=30 "http://xml.utrace.de/?query=$1" -O - | sed '4d' | sed "s/<[^>]*>//g; s/\t//g; /^$/d" | tr '\n' ',' ; echo "\n"
}



COMPLETION_WAITING_DOTS="true"


plugins=(pip python encode64 git history)
source $ZSH/oh-my-zsh.sh
export TARGET_LANG=en
PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"
export PATH=/usr/local/bin:$PATH

