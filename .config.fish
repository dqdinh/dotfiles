alias ll "ls -lahtr"
 
rvm default
 
set -U fish_user_paths "/usr/local/opt/imagemagick@6/bin" "/Users/ddinh/.local/bin" $fish_user_paths

 set -U EDITOR vim
 set -U TERM xterm-256color

 alias mysql "/usr/local/mysql/bin/mysql"

 set JAVA_8_HOME (/usr/libexec/java_home -v1.8)
 set JAVA_11_HOME (/usr/libexec/java_home -v11)

 alias java8 'export JAVA_HOME=$JAVA_8_HOME'
 alias jshell8 '/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin/jshell'

 alias java11 'export JAVA_HOME=$JAVA_11_HOME'
 alias jshell11 '/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/jshell'

 # default to Java 8
 # https://stackoverflow.com/a/52524114
 java8

 # Then to change versions, just use the alias.

 # java11
 # java -version

 function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
 end
