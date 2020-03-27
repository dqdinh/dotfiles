# Notes

## GPG
```bash
# create an archive of mulitple files and encrypt
tar -cf <file1> <file2>
gpg --encrypt --recipient <name>

# decrypt
gpg --decrypt <file1_file2>.tar.gpg
gpg -d file.gpg

# generate new key
gpg --full-generate-key

# export public gpg key
gpg --armor --export <key_id>

# list all secret keys
gpg --list-secret-keys --keyid-format LONG
```

## Python
```
# use pip3 to update various libraries e.g., awscli
pip3 install awscli --upgrade --user
```

## Ubuntu
```
Super : brings up search
```

## General Setup
- emacs with spacemacs or DIY
- nvm
- tmux with oh-my-tmux config or DIY
- shells: fish (bass, oh-my-fish) or zsh (oh-my-zsh)
- plantuml jar via sourceforge
- aspell

### Packages worth jotting down
```
# Java
# - this requires adding the openjdk apt repository
sudo apt-get install adoptopenjdk-11-hotspot

# Customize keyboard keys
# - swap super key with alt key
# - caps lock replace with control
sudo apt-get install gnome-tweak-tool

# Check that emacs package is latest before installing
sudo apt-get install emacs
```

## Oh My Tmux (https://github.com/gpakosz/.tmux)
```
control + b + Enter   : vim visual mode / copy and paste / keyboard scroll
control + b + - / _   : horizontal split / vertical split
control + b + c       : new tmux tab 
control + b + n       : next tmux tab
```

## ZSH (https://github.com/robbyrussell/oh-my-zsh)

## Most used IntelliJ Shortcuts / Keyboard Mappings
```
command b                            : go to definition
command shift p                       : type info
command e                             : recent files
command 7                             : show method structure
command n                             : go to class
command shift n                       : go to file
command shift alt n / control shift n : navigate to symbol
command alt <- / shift <-             : Pop back to the previously visited position in current file
command alt -> / shift ->             : Pop forward to the previously visited position in current file
```
## Emacs (https://github.com/syl20bnr/spacemacs)

### Org mode
#### Troubleshooting
- if you can't evalutate code in org mode, try the following:

```
cd .emacs.d/elpa/
# I suggest to run this without "delete" first.
find org* -name "*.elc" -delete
```
https://emacs.stackexchange.com/questions/32001/org-babel-9-spacemacs-unable-to-evaluate-org-babel-src-blocks

#### Org Tangle Example
```
#+BEGIN_SRC R :session :results output :tangle yes
#+END_SRC

#+BEGIN_SRC R :session :results output graphics :file test.png :tangle yes
  library(tidyverse)
  ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
  geom_point()
#+END_SRC

#+BEGIN_SRC R :session :results output org :tangle yes
 library(ascii)
 a <- runif(100)
 c <- "Quantiles of 100 random numbers"
 b <- ascii(quantile(a),header=T,include.colnames=T,caption=c)
 print(b,type="org")
 rm(a,b,c)
#+END_SRC
```

To evaluate:
C-c C-c

To access the R session:
(helm-M-x nil "org-babel-switch-to-session")

#### Ditaa
```
#+begin_src ditaa :file ./diagrams/some_filename.png
+--------+   +-------+    +-------+
|        +---+ ditaa +--> |       |
|  Text  |   +-------+    |diagram|
|Document|   |!magic!|    |       |
|     {d}|   |       |    |       |
+---+----+   +-------+    +-------+
	:                         ^
	|       Lots of work      |
	+-------------------------+
#+end_src
```

#### Plant UML
##### Graphviz
```
#+begin_src plantuml :file ./diagrams/appmgmt-saml-sso-flow-summary.jpg
start
:A;
while (B) is (no)
  :C;
endwhile (yes)
:D;
stop
#+end_src
```
##### Sequence
```
 autonumber "<font color=red><b>"
 
 title A -> B
 
 participant "Client" as c
 participant "Server" as s
 
 c -[#0000FF]-> s : // Create client session,\n// send browser to requested destination
 s -> c : HTTP/1.1 200 OK \n { JSON Response }
```
