# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias py="/Library/Frameworks/Python.framework/Versions/3.3/bin/python3.3"
alias pyvenv="/Library/Frameworks/Python.framework/Versions/3.3/bin/pyvenv-3.3"
alias pip3="/Library/Frameworks/Python.framework/Versions/3.3/bin/pip-3.3"
alias julia="/Applications/Julia-*.app/Contents/Resources/julia/bin/julia"
alias ijulia="ipython3 notebook --profile=julia"
alias mysql="/usr/local/mysql/bin/mysql"

# boot up local server
alias server="/usr/local/bin/python3 -m http.server"

# b/c vim is awesome.
alias v="/usr/bin/vim"
alias v.="/usr/bin/vim ."

alias p="cd ~/workspace/"

# get the current directory's listing, in long format, including hidden directories
alias ll="ls -lhA"

# find files in our current directory easily
alias fhere="find . -name "

# list our disk usage in human-readable units including filesystem type, and print a total at the bottom
alias df="df -ha"

# make our process table searchable
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# we use often is the -p flag to make any necessary parent directories
alias mkdir="mkdir -pv"

# top
# cpu
alias cpu='top -o cpu'
# memory
alias mem='top -o rsize'

# mute the system volume
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby python osx virtualenv tmux rvm rails pip heroku)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/Users/ddinh/.rvm/gems/ruby-2.1.2/bin:/Users/ddinh/.rvm/gems/ruby-2.1.1/bin:/Users/ddinh/.rvm/bin:/Users/ddinh/julia:/usr/local/bin:/usr/local/mysql/bin:/usr/local/mysql/lib:/usr/local/share/npm/bin:/Users/ddinh/workspace/adt-bundle-mac-x86_64-20130514/sdk/platform-tools:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/usr/X11/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# PROMPT STUFF

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)
$(virtualenv_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'

# virtualenv stuff
export WORKON_HOME=$HOME/.virtualenvs
source $WORKON_HOME/pachamama3/bin/virtualenvwrapper.sh

#activate nvm
source ~/.nvm/nvm.sh

# get mysql2 gem to find dyld lib
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
