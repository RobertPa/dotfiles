#alias qmake='qmake-qt4'
export ZSH=~/.oh-my-zsh
export HISTFILESIZE=5000
#export PATH="/usr/lib/ccache/bin/:$PATH"
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig
# export PATH=~/.npm-global/bin:$PATH
#umask =
ZSH_THEME="af-magic"

plugins=(git sudo colorize colored-man docker common-aliases \
    battery web-search zsh-syntax-highlighting)

export PATH="/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/usr/lib/plan9/bin"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export UPDATE_ZSH_DAYS=5
export GOPATH=$HOME/.go

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export TERMINAL='st'
export BROWSER='surf'

# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


#export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh


#########
#aliases#
#########

#########
#helpers#
#########
alias ss='eval `slmenu < .progs.txt`'
alias tpeon='sudo sysctl -w kernel.grsecurity.tpe=1'
alias tpeoff='sudo sysctl -w kernel.grsecurity.tpe=0'
alias tmpfson='sudo mount -o remount,size=2G /var/tmp/portage'
alias tmpfsoff='(sudo rm /var/tmp/portage/*; sudo mount -o remount,size=1M /var/tmp/portage)'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias paxflags='sudo setfattr -n user.pax.flags -v m'
#alias clearram='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias itest='ping -c3 www.google.com'
alias loadbat='sudo /usr/sbin/tlp fullcharge BAT0 '
alias bat='sudo tlp-stat -b'
alias xmod='setxkbmap -option 'ctrl:nocaps' && xmodmap ~/.Xmodmap'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias h='xbacklight -set'
alias wifi='sudo ip link set wlp3s0'
#################
#basics commands#
#################
alias rm='trash -v'
#alias sudo='pkexec --user root'
alias e='exit'
alias vi='vim'
alias sudo='sudo '
alias free='free -h'
alias df='df -Th --total'
#alias ls='ls -FX --color=always'
#alias scan='sudo wifi-menu'
alias cp='cp -i'
alias hig='history | grep'
alias c='clear'
alias man='vman'
compdef vman="man"
alias f='ranger'
alias we='wget'
alias gcc='gcc -Wall -std=gnu99'
alias mkdir='mkdir -pv'
alias vi='emacsclient -t'
##############
#Init Systems#
##############
#systemd
#alias sus='sudo systemctl suspend'
#alias hibernate='sudo systemctl hibernate'
#alias status='systemctl status -l'
#alias start='sudo systemctl start'
#alias stop='sudo systemctl stop'
#alias enable ='sudo systemctl enable'
#alias disable='sudo systemctl disable'
#alias mask='sudo systemctl mask'
#alias unmask='sudo systemctl unmask'
#openrc
 alias journal='[ -f /usr/sbin/journalctl ] && journalctl -r || sudo vim /var/log/syslog'
alias service='sudo rc-service'
##############
#applications#
##############
#alias hn='/opt/hnwatch'
#alias weather='~/.go/bin/wego'
#alias yt='mpsyt'
alias rtv='firejail rtv'
alias de='trans en:de'
alias fran='trans en:fr'
alias russ='trans en:russ'
alias eng='trans de:en'
alias yv='youtube-viewer'
alias ice='subuser run iceweasel'
################
#packagemanager#
################
##dnf##
#alias upgrade='sudo dnf upgrade --refresh'
#alias search='dnf search'
#alias install='sudo dnf install'
#alias remove='sudo dnf remove'
#alias installed='dnf list installed | grep -i'
##pacman##
#alias clean='sudo pacman -Rns $(pacman -Qdtq)'
#alias update='sudo  reflector --verbose --country '' -l 25 -p http --sort rate --save /etc/pacman.d/mirrorlist && yaourt -Syyua'
#gentoo-emerge
alias search='emerge --search'
alias ssearch='emerge -S'
alias install='sudo emerge --ask'
alias remove='sudo emerge -cav'
alias update1='emerge --ask --update --ask @world'
alias update2='emerge --ask --update --deep @world'
alias update3='emerge --ask --update --deep --with-bdeps=y @world'
alias update4='sudo emerge --ask --update --deep --with-bdeps=y --newuse @world'
#equery
alias eqf='equery f'
alias equ='equery u'
alias eqh='equery h'
alias eqa='equery a'
alias eqb='equery b'
alias eql='equery l'
alias eqd='equery d'
alias eqg='equery g'
alias eqc='equery c'
alias eqk='equery k'
alias eqm='equery m'
alias eqy='equery y'
alias eqs='equery s'
alias eqw='equery w'


#functions
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0"  ]; then
        echo "No manual entry for $*"
    fi
}

function ranger {
tempfile=$(mktemp /tmp/ranger-dirXXX)
/usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        echo "$(cat "$tempfile")"
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

google () {
    u=`perl -MURI::Escape -wle 'print "http://google.com/search?q=".
    uri_escape(join " ",  @ARGV)' $@`
    /usr/bin/w3m -F $u
}

function weather() {
curl -s http://wttr.in/"${1}" \
        | less -R -E -X
}

function extract {
    if [ -f "$1" ] ; then
        local nameInLowerCase=`echo "$1" | awk '{print tolower($0)}'`
        case "$nameInLowerCase" in
            *.tar.bz2)   tar xvjf ./"$1"    ;;
            *.tar.gz)    tar xvzf ./"$1"    ;;
            *.tar.xz)    tar xvJf ./"$1"    ;;
            *.lzma)      unlzma ./"$1"      ;;
            *.bz2)       bunzip2 ./"$1"     ;;
            *.rar)       unrar x -ad ./"$1" ;;
            *.gz)        gunzip ./"$1"      ;;
            *.tar)       tar xvf ./"$1"     ;;
            *.tbz2)      tar xvjf ./"$1"    ;;
            *.tgz)       tar xvzf ./"$1"    ;;
            *.zip)       unzip ./"$1"       ;;
            *.Z)         uncompress ./"$1"  ;;
            *.7z)        7z x ./"$1"        ;;
            *.xz)        unxz ./"$1"        ;;
            *.exe)       cabextract ./"$1"  ;;
            *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
}

