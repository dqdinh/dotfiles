;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Modified from https://github.com/hlissner/doom-emacs-private

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "dd"
      user-mail-address "dd@lambda"

      doom-scratch-initial-major-mode 'lisp-interaction-mode

      ;;treemacs-width 32

       ;; This determines the style of line numbers in effect. If set to `nil', line
       ;; numbers are disabled. For relative line numbers, set this to `relative'.
      ;; NOTE Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil

      ;; NOTE modern editors have trained a bad habit into us all: a burning
      ;; need for completion all the time -- as we type, as we breathe, as we
      ;; pray to the ancient ones -- but how often do you *really* need that
      ;; information? I say rarely. So opt for manual completion:
      company-idle-delay nil

      ;; LSP config
      ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
      ;; lsp-ui-sideline is redundant with eldoc and much more invasive, so disable it by default.
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil
      ;; Disable on hover dialogs
      lsp-ui-doc-enable nil
      lsp-lens-enable nil
      lsp-headerline-breadcrumb-enable nil

      ;; More common use-case
      ;; The ":s" command changes every occurrence on the line by default,
      ;; and changes only one occurrence on the line with the global flag.
      ;; e.g., :%s/foo/bar/, :%s/foo/bar/g
      evil-ex-substitute-global t)

;;
;;; UI

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SF Mono" :size 18 :weight 'light)
      doom-variable-pitch-font (font-spec :family "SF Pro" :size 19))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;
;;; Modules

;;; :lang org
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/workspace/org/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db")
      org-journal-encrypt-journal t
      org-journal-file-format "%Y%m%d.org"
      org-startup-folded 'overview
      org-ellipsis " [...] ")

;; Org performance improvements
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#why-is-emacsdoom-slow
(remove-hook 'org-mode-hook #'org-superstar-mode)

(after! org
  (setq org-fontify-quote-and-verse-blocks nil
        org-fontify-whole-heading-line nil
        org-hide-leading-stars nil
        org-startup-indented nil))

;;; :tools magit
(setq magit-repository-directories '(("~/workspace" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t
      ;; transient-values '((magit-commit "--gpg-sign=<INSERT_GPG>")
      ;;                    (magit-rebase "--autosquash" "--gpg-sign=<INSERT_GPG>")
      ;;                    (magit-pull "--rebase" "--gpg-sign=<INSERT_GPG>"))
      )

;;; :completion ivy
(after! ivy
  ;; I prefer search matching to be ordered; it's more precise
  (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus)))

;;; :editor evil
;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;
;;; Language customizations

(custom-theme-set-faces! 'doom-dracula
  `(markdown-code-face :background ,(doom-darken 'bg 0.075))
  `(font-lock-variable-name-face :foreground ,(doom-lighten 'magenta 0.6)))
