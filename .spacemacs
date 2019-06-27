;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs) dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     csv
     dash
     emacs-lisp
     evil-commentary
     git
     helm
     html
     java
     javascript
     (markdown :variables markdown-live-preview-engine 'vmd)
     org
     pdf-tools
     plantuml
     (restclient :variables restclient-use-org t)
     (ruby :variables
           ruby-insert-encoding-magic-comment nil
           ruby-test-runner 'rspec
           ruby-version-manager 'rvm)
     shell-scripts
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "en")
     syntax-checking
     vinegar
     yaml
     (scala :variables
            scala-auto-insert-asterisk-in-comments t
            scala-indent:use-javadoc-style t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (eval-after-load 'org
    (lambda()
      (require 'ob-emacs-lisp)
      (require 'ob-shell)
      (require 'ob-restclient)
      (require 'ob-plantuml)
      (setq org-plantuml-jar-path "/Users/ddinh/plantuml.jar")

      (setq org-capture-templates '(
                                    ("t" "Task" entry
                                     (file+headline "~/workspace/org/gtd/inbox.org" "Inbox")
                                     "* TODO %i%? \n %U")
                                    ("p" "Project" entry
                                     (file+headline "~/workspace/org/gtd/projects.org" "Projects")
                                     "* %i%?")
                                    ("m" "Maybe" entry
                                     (file+headline "~/workspace/org/gtd/maybe.org" "Maybe")
                                     "* %i%?")
                                    ))
      (setq org-refile-targets '(("~/workspace/org/gtd/projects.org" :maxlevel . 1)
                                 ("~/workspace/org/gtd/maybe.org" :maxlevel . 1)
                                 ("~/workspace/org/gtd/notes.org" :maxlevel . 1)
                                 ))

      (setq org-agenda-files
            (quote
             (
              "~/workspace/org/gtd/inbox.org"
              "~/workspace/org/gtd/agenda.org"
              "~/workspace/org/gtd/projects.org"
              "~/workspace/org/gtd/notes.org"
              "~/workspace/org/gtd/maybe.org")))

      (setq org-agenda-custom-commands
            '(
              ("O" "Office block agenda"
               ((agenda "" ((org-agenda-span 1)))
                ;; limits the agenda display to a single day
                (tags-todo "+PRIORITY=\"A\"")
                (tags-todo "computer|office|phone|email|work")
                (tags "review" ((org-agenda-files '("~/workspace/org/gtd/inbox.org" "~/workspace/org/gtd/projects.org" "~/workspace/org/gtd/maybe.org"))))
                ;; limits the tag search to the file circuspeanuts.org
                (todo "WAITING"))
               ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block

              ("W" "Weekly Review"
               ((agenda "" ((org-agenda-span 7))); review upcoming deadlines and appointments
                                        ; type "l" in the agenda to review logged items
                (stuck "") ; review stuck projects as designated by org-stuck-projects
                (todo "PROJECT") ; review all projects (assuming you use todo keywords to designate projects)
                (todo "MAYBE") ; review someday/maybe items
                (todo "WAITING"))) ; review waiting items

              ("c" "Weekly Calendar" agenda ""
               ((org-agenda-span 7)                          ;; [1]
                (org-agenda-start-on-weekday 0)               ;; [2]
                (org-agenda-time-grid nil)
                (org-agenda-repeating-timestamp-show-all t)   ;; [3]
                (org-agenda-entry-types '(:timestamp :sexp))))  ;; [4]

              ("ca" "Weekly - appointments" agenda ""
               ((org-agenda-span 7)           ;; agenda will start in week view
                (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled)))) ;; limits agenda view to timestamped items

              ("d" "Upcoming deadlines" agenda ""
               ((org-agenda-entry-types '(:deadline))
                ;; a slower way to do the same thing
                ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
                (org-agenda-span 1)
                (org-deadline-warning-days 60)
                (org-agenda-time-grid nil)))

              ("P" "Printed agenda"
               ((agenda "" ((org-agenda-span 7)                      ;; overview of appointments
                            (org-agenda-start-on-weekday nil)         ;; calendar begins today
                            (org-agenda-repeating-timestamp-show-all t)
                            (org-agenda-entry-types '(:timestamp :sexp))))
                (agenda "" ((org-agenda-span 1)                      ; daily agenda
                            (org-deadline-warning-days 7)            ; 7 day advanced warning for deadlines
                            (org-agenda-todo-keyword-format "[ ]")
                            (org-agenda-scheduled-leaders '("" ""))
                            (org-agenda-prefix-format "%t%s")))
                (todo "TODO"                                          ;; todos sorted by context
                      ((org-agenda-prefix-format "[ ] %T: ")
                       (org-agenda-sorting-strategy '(tag-up priority-down))
                       (org-agenda-todo-keyword-format "")
                       (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
               ((org-agenda-with-colors nil)
                (org-agenda-compact-blocks t)
                (org-agenda-remove-tags t)
                (ps-number-of-columns 2)
                (ps-landscape-mode t))
               ("~/workspace/org/gtd/agenda.png"))

              ("g" . "GTD contexts")
              ("go" "Office" tags-todo "office")
              ("gc" "Computer" tags-todo "computer")
              ("gp" "Phone" tags-todo "phone")
              ("gh" "Home" tags-todo "home")
              ("ge" "Errands" tags-todo "errands")
              ("G" "GTD Block Agenda"
               ((tags-todo "office")
                (tags-todo "computer")
                (tags-todo "phone")
                (tags-todo "home")
                (tags-todo "errands"))
               nil                      ;; i.e., no local settings
               ("~/next-actions.html"))

              ("p" . "Priorities")
              ("pa" "A items" tags-todo "+PRIORITY=\"A\"")
              ("pb" "B items" tags-todo "+PRIORITY=\"B\"")
              ("pc" "C items" tags-todo "+PRIORITY=\"C\"")

              ;; ...other commands here

              ))

      (setq org-refile-allow-creating-parent-nodes 'confirm)

      (setq org-default-notes-file (concat org-directory "/notes.org"))

      (setq org-M-RET-may-split-line (quote ((default))))
      (setq org-agenda-default-appointment-duration 60)

      (setq org-agenda-log-mode-items (quote (closed clock state)))
      (setq org-agenda-restore-windows-after-quit t)
      (setq org-agenda-show-future-repeats nil)
      (setq org-agenda-span (quote week))
      (setq org-capture-use-agenda-date t)
      (setq org-clock-clocked-in-display (quote mode-line))
      (setq org-clock-in-resume t)
      (setq org-clock-mode-line-total (quote today))
      (setq org-clock-out-remove-zero-time-clocks t)
      (setq org-clock-persist t)
      (setq org-columns-default-format "%60ITEM(Task) %10Effort(Estimated Effort){:} %10CLOCKSUM")
      (setq org-deadline-warning-days 10)
      (setq org-duration-format (quote h:mm))
      (setq org-enforce-todo-checkbox-dependencies t)
      (setq org-enforce-todo-dependencies t)
      (setq org-export-taskjuggler-target-version 3)
      (setq org-fontify-done-headline t)
      (setq org-global-properties (quote (("Effort_ALL" . "1h 2h 4h 6h 8h 16h"))))
      (setq org-habit-graph-column 52)
      (setq org-hide-leading-stars t)
      (setq org-highlight-latex-and-related (quote (latex)))
      (setq org-indent-indentation-per-level 1)
      (setq org-log-done (quote time))
      (setq org-log-into-drawer t)
      (setq org-startup-folded t)
      (setq org-stuck-projects (quote ("+LEVEL=2/-DONE" ("TODO" "NEXT") nil "")))
      (setq org-tags-column -80)
      (setq org-tags-exclude-from-inheritance (quote ("project")))
      (setq org-time-clocksum-format
            (quote
             (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
      (setq org-todo-keywords
            (quote
             ((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)")
              (sequence "FEATURE(f)" "|" "COMPLETED(c)")
              (sequence "BUG(b)" "|" "FIXED(x)")
              (sequence "APPT(p)" "|" "DONE(d)" "CANCELLED(a)")
              (sequence "WAITING(w!)" "|" "DONE(d)"))))
      (setq org-export-babel-evaluate nil)
      (setq org-confirm-babel-evaluate nil)))
  )

(defun dotspacemacs/user-config ()
  (ido-mode -1)
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq projectile-enable-caching t)
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (setq magit-repository-directories '("/Users/ddinh/workspace/"))
  (setq-default flycheck-scalastylerc "/Users/ddinh/workspace/org/config/scalastyle_config.xml")
  )

