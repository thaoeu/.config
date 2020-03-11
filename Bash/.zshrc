# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/qj/.oh-my-zsh"
#ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git vi-mode)
# plugins=(git battery)
# ZSH_THEME="edvardm"
# ZSH_THEME="obraun"

source $ZSH/oh-my-zsh.sh
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


#source ~/.oh-my-zsh/plugins/incr*.zsh
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# --------
# Leader ,
# --------
alias ,='cd '
alias ,w='source ~/.zshrc'
alias ,i='exit'
alias ,f=fuck
alias v='nvim'
alias p=pwd
alias l='ls'
alias t='v ~/Code/todo.md'
alias q='exit'
alias clean='_ pacman -Rs $(pacman -Qdtq)'
# alias xx='xmodmap ~/xmodmap/xmodmap'
#alias theme='v ~/document/markdown/theme.md'

# --------
# SSH & SCP & GIT
# --------
alias thssh='ssh root@49.234.234.93'
alias thessh='ssh root@134.175.192.94'
#alias tha='ssh root@47.95.196.82'
alias s='git status'
alias gp='git push github master && git push gitee master'
alias gpb='git push && git push io master'

# --------
# FileName
# --------
alias win='cd /run/media/qj'
alias mark='cd ~/LeetCode/Markdown'
alias ztg='cp ~/.zshrc ~/Overt/config/Bash && cd ~/Overt/config/Bash'
alias update='sudo pacman-mirrors -i -c China -m rank'
alias sus='systemctl suspend'
alias hn='cd ~/Overt/blog && hugo new'
alias hu='cd ~/Overt/blog/content/post'
alias e=ranger
# --------
# Qmk
# --------
alias ,mk='avrdude -p atmega32u4 -P /dev/ttyACM0 -c avr109 -U flash:w:bggpad_default.hex'
alias bgg='cd ~/Templates/qmk_firmware/keyboards/bggpad/keymaps/default/'
alias qmk='cd ~/Templates/qmk_firmware && make bggpad:default'
alias n='feh --recursive --bg-fill'

# --------
#screenfetch
# --------
alias neo='neofetch \--block_range 1 8 \--line_wrap off \--bold off \--uptime_shorthand on \--gtk_shorthand on \'
alias fig='figlet -f lean'
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh