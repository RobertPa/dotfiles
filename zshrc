export ZSH=~/.oh-my-zsh
export HISTFILESIZE=10000
#export Qt5Core_DIR=/usr/local/lib/qt5/cmake
#export Qt5Widgets_DIR=/usr/local/lib/qt5/cmake
#export Qt5Network_DIR=/usr/local/lib/qt5/cmake
#export Qt5Test_DIR=/usr/local/lib/qt5/cmake
#export PKG_PATH=http://ftp.fau.de/pub/OpenBSD/snapshots/packages/amd64/
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig
#umask =
export PAGER=less
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
	user
	host
	dir
	git
	package
	line_sep
	exec_time
	exit_code
	char
)

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_EXEC_TIME_ELAPSED=240
SPACESHIP_PROMPT_SEPARATE_LINE=true

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_DIR_HOME_BACKGROUND='002'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='010'
#POWERLEVEL9K_DIR_HOME_DEFAULT_BACKGROUND='160'
#POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

plugins=(sudo cp colorize\
	copyfile fast-syntax-highlighting)
#ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#ZSH_AUTOSUGGEST_USE_ASYNC=1


export PATH="usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/opt/void-packages
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --no-messages --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -t d ."
#export FZF_ALT_C_COMMAND="bfs -type d -nowarn 2> /dev/null"
export FZF_DEFAULT_OPTS='--bind tab:down,shift-tab:up'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export UPDATE_ZSH_DAYS=5
#export GOPATH=$HOME/.go
export NO_AT_BRIDGE=1

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export TERMINAL='st'
export BROWSER='firefox'
export BROWSERCLI='w3m'

DISABLE_AUTO_TITLE="true"
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
alias ss='eval `slmenu < ~/.progs.txt`'
alias tpeon='sudo sysctl -w kernel.grsecurity.tpe=1'
alias tpeoff='sudo sysctl -w kernel.grsecurity.tpe=0'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias paxflags='sudo setfattr -n user.pax.flags -v m'
#alias clearram='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias itest='ping -c2 www.google.com'
alias loadbat='sudo /usr/sbin/tlp fullcharge BAT0 '
alias bat='sudo tlp-stat -b'
#alias xmod='setxkbmap -option 'ctrl:nocaps' && xmodmap ~/.Xmodmap'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias h='xbacklight -set'
#alias wifi='ip link set wlan0'
alias a='tmux list-sessions'
alias ac='tmux new -s'
alias aa='tmux attach -t'
alias cvsupdate='doas cvs -q up -Pd'
alias giturl='git config --get remote.origin.url'
alias mus='ncmpc'
alias tup='tmuxinator start'
alias tdown='tmuxinator stop'
alias xc='xclip -o'
#########
#basics #
#########
alias e='echo 'detach''
#alias vi='doas vim'
alias vim='nvim'
if [[ -a /usr/bin/pkg_add ]]; then
	alias sudo='doas'
fi
alias sudo='sudo '
alias free='free -h'
alias df='df -h'
#alias scan='sudo wifi-menu'
alias cp='cp -i'
alias hig='history | grep -i'
alias c='clear'
alias man='vman'
compdef vman="man"
alias f='ranger'
alias we='wget'
alias gcc='gcc -Wall -std=gnu99'
alias mkdir='mkdir -p'
#alias htop='top'
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
#alias service='sudo rc-service'
##############
#applications#
##############
#alias hn='/opt/hnwatch'
#alias weather='~/.go/bin/wego'
alias yt='youtube-dl'
#alias rtv='firejail rtv'
alias de='trans en:de'
alias fran='trans en:fr'
alias russ='trans en:russ'
alias eng='trans de:en'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg'

################
#packagemanager#
################

#gentoo-emerge
alias update1='sudo emerge --ask --update --ask @world'
alias update2='sudo emerge --ask --update --deep @world'
alias update3='sudo emerge --ask --update --deep --with-bdeps=y @world'
alias update4='sudo emerge --verbose --ask --update --deep --with-bdeps=y --newuse @world'
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
function ls(){
	if [[ -a /usr/local/bin/gls ]]; then
		gls -h --color  --group-directories-first 
	elif [[ -a /bin/ls ]];  then 
		/bin/ls -h --color --group-directories-first $@
	fi
}

function killall(){
	if [[ -a /bin/killall ]]; then
		/bin/killall $@
	elif [[ -a /usr/local/bin/skill ]]; then
		skill $@
	fi
}

function install() {
	if [[ -a /usr/sbin/pkg_add ]]; then
		doas pkg_add -Uivv $@
	elif [[ -a /usr/bin/emerge ]]; then
		sudo emerge --ask --verbose $@
	elif [[ -a /usr/bin/xbps-install ]]; then
		sudo xbps-install -S $@
	else
		echo 'no package manager found'
	fi
}

function search() {
	if [[ -a /usr/sbin/pkg_info ]]; then
		pkg_info -Q $@
	elif [[ -a /usr/bin/emerge ]]; then
		emerge --search $@
	elif [[ -a /bin/xbps-query ]]; then
		xbps-query -Rs $@
	else
		echo 'no package manager found'
	fi
}

function remove() {
	if [[ -a /usr/sbin/pkg_delete ]]; then
		doas pkg_delete $@
	elif [[ -a /usr/bin/emerge ]]; then
		sudo emerge -cav $@
	elif [[ -a /bin/xbps-remove ]]; then
		doas xbps-remove -R $@
	else
		echo 'no package manager found'
	fi
}

function vman() {
    /usr/bin/vim-normal -c "SuperMan $*"

    if [ "$?" != "0"  ]; then
        echo "No manual entry for $*"
    fi
}

function vol() {
	mixerctl outputs.master="$@,$@"
}

function rm() {
	if [[ -a /usr/bin/trash ]]; then
		trash-put -v $@
	elif [[ -a /usr/local/bin/trash ]]; then
		trash -v $@
	else 
		mv $@ ~/.Trash/files
	fi
}

function zathura() {
	/usr//bin/zathura $@ &
}

function google () {
	u=`perl -MURI::Escape -wle 'print "http://google.com/search?q=".
	uri_escape(join " ",  @ARGV)' $@`
	/usr/bin/w3m -F $u
}

function wttr() {
	curl -s http://wttr.in/"${1}" \
		| less -R -E -X
}

function eqfb () {
	eqf $@ | grep bin
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

function trestart() {
	tmuxinator stop $@
	tmuxinator start $@
}

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

histrm() { LC_ALL=C sed --in-place '/$1/d' $HISTFILE }

fzf-surfraw() { surfraw "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf -e)" ;}

source "/home/${USER}/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -a /bin/xbps-install ]]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

