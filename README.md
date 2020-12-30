- [emacs](#emacs)
- [vim](#vim)
- [gpg](#gpg)
- [python](#python)
- [ubuntu](#ubuntu)
- [general](#general)
- [tmux](#tmux)
- [zsh](#zsh)
- [intellij](#intellij)

# Emacs
## Doom

```
Doomcasts - https://youtube.com/playlist?list=PLhXZp00uXBk4np17N39WvB80zgxlZfVwj

== Projectile ==

# Find file
SPC f or SPC .

# Find file from here
SPC F

# Manual indexing
projectile-discover-projects-in-directory
projectile-discover-projects-in-search-path

# Switch to project
SPC p p

# Switch to doom config files
SPC p p

== Dired ==

# Enter Dired mode
SPC o -

# Toggle details
SHIFT 9

# Create directory
+

# Mark and execute deletion
d
x

# Sort by name / date
o

# Modify permissions
SHIFT m
.e.g, 'u+w', 'u-w', 'u+w,g-w' 

# Change owner
SHIFT o

# Mark all directories
* /

# Toggle / invert between (un)marked files and directories
t

# Unset marked files and directories
SHIFT u

# Single select / mark
m

# Unmark
u

# Copy
SHIFT c

# Move
SHIFT r

# Move/copy multiple things
m 'or' t
SHIFT r 'or' SHIFT c

# Insert and rename

;; enters Editable Dired mode'
i

;; Insert, modify, and save
i
ESC
:w

# Exit Editable Dired Mode
C-c C-c

== Buffers ==

# Query workspace buffers
SPC b b
SPC .

# Query all buffers
SPC b B
SPC < (e.g., SPC SHIFT .)

# Create and save new buffer
SPC b N
SPC b s

# Open ibuffer
SPC b i

# Mark and delete
d
x

== Windows ==
# Vertical / horizontal
C-w v 'or' C-w s

# Movement
C-w w or C-w hjkl

# resize
C-w < > + -

== Packages ==
https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#package-management

== Help ==

# Describe function
SPC h f

# Describe variable
SPC h v

== evil-snipe ==
Short distance navigation

# Find char, hop to next char, hop backwards
f (or F)
<character>
;
,

# Find and land one space before char, hop next, hop back
t
<character>
;
,

# Find 2 chars, hop next and back
s
<2 chars>
;
,

# Remembers last search
; 'or' ,

# Visual selection by char snipping
v
f 'or' t
<char or 2 char>
; 'or' ,

== Avy ==
Longer distance navigation.

# Variable: avy-all-windows or avy-all-windows-alt
Toggle to 't' to search across windows.
avy-all-windows-alt defaults to 't' in Doom

# Go to char sequence (go-to command)
g s SPC <chars>

# find and cut
g s SPC <chars> x
g s SPC <chars> X (stay in current window)

# find and autocorrect
g s SPC <chars> i
g s SPC <chars> I (stays in current window)

# find and move / yank
g s SPC <chars> y

# find and teleport
g s SPC <chars> t 


# Go to char-2
g s s <char-2>

# Go to char-timer
g s / <chars>

== evil-multiedit ==

# Select target and match consecutive matches
M-d
M-d
# Select previous match after identifying target
M-D
<vim-edits>

# Select all, navigate next/prev
Shift r
C-n
C-p
<vim-edits>

== Org Mode ==

# Move nodes of similar level
M-up 'or' M-down

# Promote or demote node level
M-h 'or' M-l

# Create numbered Lists
1. <text>
C-enter
M-up / M-down (reorder list)

# Create links
+ [[<Node name>]]

# Target other files or a url
SPC m l
file:<file_name> 'or' https://www.google.com 'or' shell:ls *.org

# Store and use stored links
SPC n l
SPC m l

# Source code and snippets
<s TAB

# Format code in buffer
SPC m '

# Babel: Execute source code block
C-c C-c

# Misc
- create custom links by defining custom and exiting org functions in config.el

== Org TODO / GTD / Agenda ==
C-c t t
Shift-left 'or' Shift-right (cycle status)
Shift-up / Shift-down (priority cookies)

SPC o a t (open agenda's todo list)

SPC m q (add tag to todo)

SPC o a m (search for a tag)

# Lists and checkboxes
- <list name>
Shift-left 'or' Shift-right (change bullet type)
Enter (open -> in progress -> done)

NOTE: can't use checkboxes with tags

== Magit ==

SPC g g (magit status)
s (stage change)
u (unstage change)
c (commit)
c c (magit-commit magit-commit-create)
b (branch)
b s (branch and branch-spinoff)

M (magit-remote)
P (magit-push)

# Magit Flows:
- stage, branch-spinoff, commit, push to remote

# Forge pull
@

```
TODO - replay magit setup with forge for create a branched PR and CR/merging a PR as an owner

## Org mode
### Troubleshooting
- if you can't evalutate code in org mode, try the following:

```
cd .emacs.d/elpa/
# I suggest to run this without "delete" first.
find org* -name "*.elc" -delete
```
https://emacs.stackexchange.com/questions/32001/org-babel-9-spacemacs-unable-to-evaluate-org-babel-src-blocks

### Org Tangle Example
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

### Ditaa
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

### Plant UML
```
#+begin_src plantuml
version
#+end_src

#+begin_src plantuml
licence
#+end_src

#+begin_src plantuml
testdot
#+end_src
```

### Graphviz
```
#+begin_src plantuml :file ./diagrams/a-to-b-summary.jpg
start
:A;
while (B) is (no)
  :C;
endwhile (yes)
:D;
stop
#+end_src
```

### Sequence
```
#+begin_src plantuml :file ./diagrams/c-to-s-summary.jpg
 autonumber "<font color=red><b>"
 
 title A -> B
 
 participant "Client" as c
 participant "Server" as s
 
 c -[#0000FF]-> s : // Create client session,\n// send browser to requested destination
 s -> c : HTTP/1.1 200 OK \n { JSON Response }
#+end_src
```

# VIM
https://github.com/amix/vimrc

# GPG
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

# Python
```
# use pip3 to update various libraries e.g., awscli
pip3 install awscli --upgrade --user
```

# Ubuntu
```
Super : brings up search
```

# General
- emacs
- nvm
- tmux with oh-my-tmux config or DIY
- shells: zsh (oh-my-zsh)
- plantuml
- aspell

## Packages worth jotting down
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

# Tmux
https://github.com/gpakosz/.tmux

```
control + b + Enter   : vim visual mode / copy and paste / keyboard scroll
control + b + - / _   : horizontal split / vertical split
control + b + c       : new tmux tab 
control + b + n       : next tmux tab
```

# ZSH
https://github.com/robbyrussell/oh-my-zsh

# IntelliJ
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
