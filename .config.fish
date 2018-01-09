# Various aliases
alias ee "/usr/local/opt/emacs-plus/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacs "/usr/local/opt/emacs-plus/Emacs.app/Contents/MacOS/Emacs -nw"
alias vv "vim ."
alias ll "ls -lahtr"

# Add paths
set -g fish_user_paths "/usr/local/opt/protobuf@2.6/bin" "/usr/local/mysql/bin" $fish_user_paths

# load RVM
rvm default

function __check_nvm --on-variable PWD --description 'Do nvm stuff'
  if test -f .nvmrc
    set node_version (nvm version)
    set nvmrc_node_version (nvm version (cat .nvmrc))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end
  end
end

# Note: uncomment when doing JS dev
# To check current dir upon Fish session start
#__check_nvm
