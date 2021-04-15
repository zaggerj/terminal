# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/huangzijie/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="bliss"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
DEFAULT_USER="huangzijie"
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git extract zsh-autosuggestions Z d autojump zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

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
POWERLEVEL9K_MODE="nerdfont-complete"
# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#配置终端启动时自动执行 source ~/git/nvm/nvm.sh, 在 ~/.bashrc, ~/.bash_profile, ~/.profile, 或者 ~/.zshrc 文件添加以下命令:
# source /usr/local/opt/nvm/nvm.sh
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# custom terminal config file 
# aliases alias
# envs environment
#补全 ssh scp sftp 等
#zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
#}}}
 # source ~/.bash_profile

# some pre var 
export ngurl="http://bbt.os-easy.com/hanxiaoxiang/ngconsole.git"
export ngurl1="git@172.16.203.254:hanxiaoxiang/ngconsole.git"
export reurl="http://bbt.os-easy.com/baiyu/ngconsole_resources.git"
export reurl1="git@172.16.203.254:baiyu/ngconsole_resources.git"
export codepath="~/codes"
export ngpath=~/codes/work/ngconsole
export repath=~/codes/work/ngconsole_resources
export configpath=~/.config
export nvpath=~/.config/nvim/init.vim
export rapath=~/.config/ranger/rc.conf
export nw="/Applications/nwjs.app/Contents/MacOS/nwjs"
export python="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3.7"
export pip="/Library/Frameworks/Python.framework/Versions/3.7/bin/pip3.7"
# alias
alias cls="clear"
alias c="clear"
alias cl="clear"
alias ll="ls -l"
alias l='ls -la'
alias la="ls -a"
alias rm="rm -i"
alias grep="grep --color=auto"
alias vi='vim'
alias nv='nvim'
alias ra="ranger"
alias hs="http-server"
# git shortcut
alias gs="git status"
alias gd="git diff"
alias gpl="git pull --rebase"
alias gpu="git push"
alias ga="git add"
alias gc="git commit -m "
alias gcl="git clean -fd"
alias ns="npm start"
alias ys="yarn run serve"
alias chng="git remote set-url origin $ngurl"
alias chng1="git remote set-url origin $ngurl1"
alias chre="git remote set-url origin $reurl"
alias chre1="git remote set-url origin $reurl1"
alias g188="ssh root@172.16.201.188"
alias gh="cd ~"
alias g2c="cd ~/codes"
alias gng="cd ~/codes/work/ngconsole"
alias gnr="cd ~/codes/work/ngconsole_resources"
alias gnf="cd ~/codes/work/region-front"
alias gnc="cd ~/codes/work/oefe-docs"
alias gnv="cd ~/codes/work/new-vdi-client"
alias gfn="cd ~/.config/nvim"
alias gfr="cd ~/.config/ranger"
alias gi="cd ~/Github"
alias g2d="cd ~/Desktop"
alias gD="cd ~/Downloads"
alias gff="cd ~/.config"
alias gfr="cd ~/.config/ranger"
alias gfn="cd ~/.config/nvim"
alias gfz="cd ~/.config/zsh"
alias gfl="cd ~/.config/jesseduffield/lazygit/"
alias lg="lazygit"
alias vpc="gng;git checkout 5.3.0-vpc-feature;gnr;git checkout 5.3.0-vpc;gng;"
alias vdi="gng;git checkout 5.3.0-bug;gnr;git checkout 5.3.0;gng;"
alias client="gnv;git checkout 5.3.0-vpc;"
alias sync220="rsync -avz js built resources views p css fonts includes *.html img  root@172.16.101.220:/var/www/html"
alias proxy='export all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset all_proxy'
# export
export PATH=/User/huangzijie/Download/fzf:$PATH
export PATH=$PATH:/Users/huangzijie/.npm-global/bin
export PATH=${PATH}:/usr/local/Cellar/node/11.3.0_1/bin
export PATH=$PATH:/Users/huangzijie/.npm-global/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export LS_OPTIONS='--color=auto' # 如果没有指定，则自动选择颜色
export CLICOLOR='Yes' #是否输出颜色
CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-256color
export W3MIMGDISPLAY_PATH="/usr/local/bin/w3m" 
# fzf
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/completion.zsh
export PYTHON_HOME=/Library/Frameworks/Python.framework/Versions/3.7
export PATH=$PYTHON_HOME/bin:$PATH
export EDITOR='nvim'
export nvimrc='~/.config/nvim/init.vim'
export XDG_CONFIG_HOME=$HOME/.config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# lazygit c-g shortcut
function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

function openlazygit {
    zle_eval lazygit
}

zle -N openlazygit; bindkey "^G" openlazygit
