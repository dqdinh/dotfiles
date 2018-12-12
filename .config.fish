# Various aliases
alias ll "ls -lahtr"
rvm default
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
alias mysql "/usr/local/mysql/bin/mysql"
set -x EDITOR vim
set -x TERM xterm-256color
alias java11 "/Users/ddinh/workspace/java11/Contents/Home/bin/java"
alias jshell11 "/Users/ddinh/workspace/java11/Contents/Home/bin/jshell"

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
