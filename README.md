# Notes

## Tmux (https://github.com/gpakosz/.tmux)
```
control + b + Enter   : vim visual mode / copy and paste / keyboard scroll
control + b + - / _   : horizontal split / vertical split
control + b + c       : new tmux tab 
control + b + n       : next tmux tab
```

## Fish (https://github.com/oh-my-fish/oh-my-fish)

NVM on Fish
```
# Install omf
1. curl -L https://get.oh-my.fish | fish

# Install bass
2. omf install bass

# Install NVM
3. curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# use NVM or add this as a function inside the fish config
4. bass source ~/.nvm/nvm.sh --no-use ';' nvm use default
```

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

#### R
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
