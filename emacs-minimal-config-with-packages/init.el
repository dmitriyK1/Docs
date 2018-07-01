;; https://gist.github.com/huytd/6b785bdaeb595401d69adc7797e5c22c

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Newline at end of file
(setq require-final-newline t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(set-frame-parameter nil 'fullscreen 'fullscreen)

(setq inhibit-startup-screen t)

;; Minimal UI
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; ignore byte-compile warnings
(setq byte-compile-warnings '(not unresolved
                                  free-vars
                                  callargs
                                  redefine
                                  obsolete
                                  noruntime
                                  cl-functions
                                  interactive-only
                                  ))

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Dependency for ripgrep
(use-package counsel :ensure t)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

 ;; Theme
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

 ;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50))

 ;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "pf"  '(helm-find-file :which-key "find files")
  ;; Files
  "f."  '(helm-find-files :which-key "find files")
  "ff"  '(helm-find-files :which-key "find files")
  "fr"  '(helm-recentf :which-key "recent files")
  ;; Buffers
  "bb"  '(helm-buffers-list :which-key "buffers list")
  "bs"  '(save-buffer :which-key "save buffer")
  "bk"  '(kill-this-buffer :which-key "kill buffer")
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  ;; Git
  "G"   '(magit :which-key "magit")
  "gs"  '(magit-status :which-key "git status")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
  "q"   '(save-buffers-kill-emacs :which-key "quit emacs")
))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

;; Emacs key bindings
;; (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
;; (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
;; (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
;; (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
(use-package evil-nerd-commenter
  :ensure t
  :config (evilnc-default-hotkeys)
)

;; Vim key bindings
(use-package evil-leader
  :ensure t)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  ","  'save-buffer
)

;; (use-package evil-commentary
;;   :ensure t
;;   :config
;;   (evil-commentary-mode))

;; no bell
(setq ring-bell-function 'ignore)

;; swap alt and cmd
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

;; show matching parenthesis
(show-paren-mode 1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Highlight current line
(global-hl-line-mode 1)

(setq electric-indent-mode nil)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; delete selected text on typing
(delete-selection-mode)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; allows to detach M-x customize options to a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

 ;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; for ripgrep to work
(setq exec-path
  '(
    "/bin/"
    "/usr/local/bin"
  )
)

;; save on focus lost (without trashing a minibuffer)
(add-hook 'focus-out-hook (lambda () (cl-flet ((message (format &rest args) nil)) (save-some-buffers t))))

(global-set-key "\C-x\ \C-r" 'helm-recentf)

;; Save place in files between Sessions
(save-place-mode 1)
(setq save-place-forget-unreadable-files nil)

(electric-pair-mode 1)
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ) )

;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)

(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))
