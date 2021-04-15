#  /etc/profile /etc/paths ~/.bash_profile ~/.bash_login ~/.profile ~/.bashrc
#  /etc/profile和/etc/paths是系统级别的，系统启动就会加载，后面几个是当前用户级的环境变量。后面3个按照从前往后的顺序读取，如果/.bash_profile文件存在，则后面的几个文件就会被忽略不读了，如果/.bash_profile文件不存在，才会以此类推读取后面的文件。~/.bashrc没有上述规则，它是bash shell打开的时候载入的。
#  /etc/paths （全局建议修改这个文件 ）
#  /etc/profile （建议不修改这个文件 ）
#  /etc/bashrc （一般在这个文件中添加系统级环境变量）
#  .profile 文件为系统的每个用户设置环境信息
#  /bashrc 每一个运行bash shell的用户执行此文件
#  ./bash_profile 该文件包含专用于你的bash shell的bash信息
#  https://www.jianshu.com/p/acb1f062a925
export PS1='\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\033[1;32m\]\u@\W\$ \[\033[00m\] '
# alias
alias cls="clear"
alias ll="ls -l"
alias la="ls -a"
alias rm="rm -i"
alias grep="grep --color=auto"
alias vi='vim'
alias mvi='mvim'
alias nvi='nvim'
alias nw="/Applications/nwjs.app/Contents/MacOS/nwjs"
alias ra="ranger"
alias hs="http-server"
# grep
alias grep='grep --color=always'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

# config
export PATH=$PATH:/Users/huangzijie/.npm-global/bin
export PATH=${PATH}:/usr/local/Cellar/node/11.3.0_1/bin
export PATH=$PATH:/Users/huangzijie/.npm-global/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export LS_OPTIONS='--color=auto' # 如果没有指定，则自动选择颜色
export CLICOLOR='Yes' #是否输出颜色
CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-256color