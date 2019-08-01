# NOTE  `.zshenv' is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.
#
# http://zsh.sourceforge.net/Intro/intro_3.html

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm. Adding --no-use to the end of the above script (...nvm.sh --no-use) to postpone using nvm until you manually use it.
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM and others to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Put python3 on our path
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# Output from "/usr/libexec/java_home -v1.8" or "-v11"
export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export JAVA_11_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
