# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin/psql:$PATH

# export PATH=/Users/scottbrenstuhl/miniconda3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/scottbrenstuhl/.oh-my-zsh

# Path to Java?
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre

# Path to my commands
FPATH=~/.dotfiles/commands:$FPATH
# fpath=( ~/Projects/Commands "${fpath[@]}" )
# autoload -Uz copy_recent brs brs_admin mkcd shrug jump gh rmd_rend ssh_kb bstaging cp_wd brs_dev_admin

autoload -U $fpath[1]/*(.:t)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
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
# eval "$(pyenv init -)"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/scottbrenstuhl/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/scottbrenstuhl/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/scottbrenstuhl/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/scottbrenstuhl/Applications/google-cloud-sdk/completion.zsh.inc'; fi


# enable fuzzy matching with fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


# needed when brew installed 
#
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
