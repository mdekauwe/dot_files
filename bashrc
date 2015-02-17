
# Print a fortune cookie for interactive shells:
if [[ $- = *i* ]]
then
    echo 
    /opt/local/bin/fortune 
    echo
    #echo -ne "Hello $USER today is "; date
fi

ARCH=$(uname -m)

#export PROMPT_COMMAND='echo -n "]1;$PWD"'
#PS1="\[\033[1;35m\]HAL 9000$\[\033[0m\] "

export TERM="xterm-color"
alias ls="ls -G"
PS1="\[\033[01;32m\]HAL 9000 \$\[\033[0m\] "


# Setup path...
PATH=/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/bin:/usr/local/bin:/usr/bin:/Users/mdekauwe/bin
export PATH=$PATH:/Users/mdekauwe/bin/bash:/Users/mdekauwe/bin/csh:/Users/mdekauwe/bin/awk
export PATH=$PATH:/Users/mdekauwe/bin/python:.:/Users/mdekauwe/bin/x86_64
export PATH=$PATH:/Users/mdekauwe/bin/perl
export PATH=$PATH:/Applications:/Applications/Utilities:

export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.6/
export PYTHONPATH=$PYTHONPATH:/Users/mdekauwe/bin/python


TEXMFHOME="/Users/mdekauwe/texmf"
export TEXINPUTS=$TEXINPUTS:/Users/mdekauwe/latex_packages/prosper

#
## Aliases
#

#alias bash=/usr/local/bin/bash
#unset noclobber
alias sphx='/opt/local/bin/sphinx-quickstart-2.6'
alias ls='ls -FC'
alias lv='rm *.pyc && ls' # remove python pyc files and ls
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias la='ls -A'
alias lk='ls -lSr'
alias lc='ls -lcr'
alias lu='ls -lur'
alias lt='ls -ltr'              # sort by date
alias cls='clear'
alias ipython='ipython --pylab'
alias ipy='ipython --pylab'
alias r='rlogin'
alias m='less -X'
#alias m='more'
alias n='nedit'
alias t='edit'
alias tn='edit --new-window'
alias d='open -a /Applications/Preview.app'
alias gp='gnuplot'
alias rm='\rm'
alias man='man -F'
alias h='history'
alias lo='logout'
alias l='ls -l'
alias lpq='lpq -Prsu2'
#alias clam='clamscan --bell -r -v --log=/Users/mdekauwe/virus_log -i'
alias ac='acroread'
alias g='generate_graph'
alias see='seeheader'
alias hip='hipstats -x 0'
alias q='quota -v'
alias df='df -k'
alias du='du -k'
alias dh='df -h'
#alias aspell='aspell --mode=tex -c'
alias xv='xv -2xlimit'
alias home='cd ~'

#
## Maintainence taks...
#
alias daily='sudo sh /etc/daily'
alias weekly='sudo sh /etc/weekly'
alias monthly='sudo sh /etc/monthly'

#
## Opening Applications from the terminal...
#
alias ff='open -a firefox'
#alias gimp 'open -a gimp'
alias chess='open -a chess'
alias itunes='open -a itunes'
alias real='open -a realplayer'
alias sol='open -a solitaire\ xl'
alias cm='open -a Football\ Manager'
alias preview='open -a preview'
alias calc='open -a calculator'

#
## for ssh to linux machines
#
#alias sshc='ssh -X cherry.geog.ucl.ac.uk'
#alias ssht='ssh -X terror.geog.ucl.ac.uk'
#alias sshe='ssh -X erebus.geog.ucl.ac.uk'
#alias sshv='ssh -X vesuvius.geog.ucl.ac.uk'
# Stopped working this seems to work though ?!
alias sshc='ssh -Y cherry.geog.ucl.ac.uk'
alias ssht='ssh -Y terror.geog.ucl.ac.uk'
alias sshe='ssh -Y erebus.geog.ucl.ac.uk'
alias sshv='ssh -Y vesuvius.geog.ucl.ac.uk'
alias sftpv='sftp vesuvius.geog.ucl.ac.uk'
alias sshucl='ssh -X mdekauwe@lyon.geog.ucl.ac.uk'
alias sshceh='ssh -X mgdk@wlremote.nwl.ac.uk'
alias sftpceh='sftp mgdk@wlremote.nwl.ac.uk'
alias sshunsw='ssh -Y z3497040@monsoon.ccrc.unsw.edu.au'
alias sftpunsw='sftp z3497040@monsoon.ccrc.unsw.edu.au'
alias sshraijin='ssh -X mgk576@raijin.nci.org.au'
alias sftpaijin='sftp mgk576@raijin.nci.org.au'

#
##color in man pages http://icanhaz.com/colors
#
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

# Expand the history size
HISTFILESIZE=10000 
HISTSIZE=100

# commands with leading space do not get added to history
HISTCONTROL=ignorespace


#BASH_COMPLETION="${BASH_COMPLETION:-/opt/local/etc/bash_completion}"

# Change the format of the path to be more viewable $path...nice
path()
{
	oldIFS=$IFS
	IFS=:  
	printf "%s\n" $PATH
   	IFS=$oldIFS
}

function extract( ) 
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
  

function spl( ) 
{ 
	echo $@ | ispell -a | sed -n -e '/^\&/p' -e '/^\#/p';   
}

function here( )
{
	echo $PWD > ~/.here_there
}

function there( )
{
	DIR=$(cat ~/.here_there)
	[ -d $DIR ] && cd $DIR
}

function spin( )
{
    echo -ne "${RED}-"
    echo -ne "${WHITE}\b|"
    echo -ne "${BLUE}\bx"
    sleep .02
    echo -ne "${RED}\b+${NC}"
}

# Define a few Color's
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color


