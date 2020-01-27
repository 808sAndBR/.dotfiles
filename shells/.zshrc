# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin/psql:$PATH

# export PATH=/Users/scottbrenstuhl/miniconda3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/sbrenstuhl/.oh-my-zsh

# Path to Java?
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre

# Path to my commands
FPATH=~/.dotfiles/commands:$FPATH
# fpath=( ~/Projects/Commands "${fpath[@]}" )
autoload -Uz copy_recent brs brs_admin mkcd shrug jump gh rmd_rend ssh_kb bstaging cp_wd brs_dev_admin

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
POWERLEVEL9K_MODE="awesome-patched"
ZSH_THEME=powerlevel10k/powerlevel10k

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx brew extract z history-substring-search)

source $ZSH/oh-my-zsh.sh

# Pull in environmental variables
source ~/.profile

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
case `uname` in
  Darwin)
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
esac
# Postgres editor
# export PSQL_EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"

# Set command line vim mode 
set -o vi

# Allow pyenv to shim python path
eval "$(pyenv init -)"

# quicly jump to my commonly used directories
jump () {
    if [ "$1" = "af" ]; then
        cd ~/Brandless/brandless-airflow/
    elif [ "$1" = "dt" ]; then
        cd ~/Brandless/data-team/
    elif [ "$1" = "sa" ]; then
        cd ~/Brandless/data-team/scott_adhoc/
    else
        echo no "$1" command
    fi
}
# keybind history search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Powerline prompts


# prompt_zsh_battery_level() {
#    percentage=`pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';' | grep -oe '\([0-9.]*\)'`
#    local color='%F{red}'
#    local symbol="\uf00d"
#if [ "$(bc <<< "scale=2 ; $percentage<25")" = '1' ]
#    then symbol="\uf244" ; color='%F{red}' ;
#        #Less than 25
#        fi  
#if [ "$(bc <<< "scale=2 ; $percentage>=25")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<50")" = '1' ]
#    then symbol='\uf243' ; color='%F{red}' ;
#    #25%
#    fi
#if [ "$(bc <<< "scale=2 ; $percentage>=50")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<75")" = '1' ]  
#    then symbol="\uf242" ; color='%F{yellow}' ;
#     #50%
#     fi
#if [ "$(bc <<< "scale=2 ; $percentage>=75")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<100")" = '1' ]
#    then symbol="\uf241" ; color='%F{blue}' ;
#        #75%
#        fi  
#if [ "$(bc <<< "scale=2 ; $percentage>99")" = '1' ]
#    then symbol="\uf240" ; color='%F{green}' ;
#        #100%
#        fi
#pmset -g batt | grep "discharging" >& /dev/null
#if [ $? -eq 0 ]; then
#    true;
#else ;
#   color='%F{green}' ;
#fi
#echo -n "%{$color%}$symbol " 
#}

zsh_internet_signal(){
  #source on quality levels - http://www.wireless-nets.com/resources/tutorials/define_SNR_values.html
  #source on signal levels  - http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440
  # local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  # local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  # local SNR=$(bc <<<"scale=2; $signal / $noise")

  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  local symbol="\uf197"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ; 
    then color='%F{black}' ; symbol="\uf1eb" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ; 
    then color='%F{green}' ; symbol="\uf1eb" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ; 
    then color='%F{yellow}' ; symbol="\uf1eb" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ; 
    then color='%F{red}' ; symbol="\uf1eb" ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ; 
    # then color='%F{red}' ; symbol="\uf011";
    then color='%F{red}' ; symbol="\uf204";
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]] ; 
  	# then color='%F{red}' ; symbol="\uf011";
    then color='%F{red}' ; symbol="\uf204" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]] ; 
    then color='%F{blue}' ; symbol="\uf197" ;
  fi

  echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}

POWERLEVEL9K_MODE='nerdfont-complete'

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Dirs
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Context
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Status
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# Double-Lined Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭%F{cyan}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# battery
# POWERLEVEL9K_BATTERY_CHARGING='yellow'
# POWERLEVEL9K_BATTERY_CHARGED='green'
# POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
# POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
# POWERLEVEL9K_BATTERY_LOW_COLOR='red'
# POWERLEVEL9K_BATTERY_ICON=`prompt_zsh_battery_level `

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"
POWERLEVEL9K_TIME_BACKGROUND='blue'

# network
POWERLEVEL9K_NETWORK_ICON=`zsh_internet_signal`
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"

# tweak colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir_writable dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time ram rbenv rvm time)
