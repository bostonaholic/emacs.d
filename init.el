;;; init.el

(setq user-full-name "Matthew Boston"
      user-mail-address "matthew@matthewboston.com")

(setq gc-cons-threshold 100000000)

(require 'package)

(require 'diminish)

(setq package-enable-at-startup nil
      use-package-always-ensure t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq large-file-warning-threshold 100000000
      fill-column 80
      global-visual-line-mode t
      inhibit-startup-screen t
      kill-whole-line t
      linum-format " %3i "
      ring-bell-function 'identity
      whitespace-style '(face trailing lines-tail tabs))

(global-linum-mode t)
(winner-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook
          (lambda ()
            (make-local-variable 'column-number-mode)
            (column-number-mode t)
            (when window-system (hl-line-mode t))))
(add-hook 'prog-mode-hook 'whitespace-mode)

(use-package msb-mode
  ;; run before package is loaded
  :init (setq my-var t)

  ;; run after package is loaded
  :config (msb-mode 1)

  ;; run before everything except :disabled
  :preface ((defun i-need-this () ...))

  ;; added to 'auto-mode-alist
  :mode ("\\.py\\'" . python-mode)

  ;; added to 'interpreter-mode-alist
  :interpreter ("python" . python-mode)

  ;; define autoloads
  :commands msb-mode

  ;; keybindings
  :bind (("C-m" . do-something))

  ;; defer loading of a package, implied with :commands, :bind, :mode, :interpreter
  :defer t

  ;; defer loading of a package until after named features are loaded
  :after (python-mode)

  ;; prevent deferred loading in all cases
  :demand nil

  ;; ignore the package completely
  :disabled t)

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package better-defaults)

(use-package clojure-mode
  :defer t
  :mode
  ("\\.boot\\'" . clojure-mode)
  :init
  ;; This regexp matches shebang expressions like `#!/usr/bin/env boot'
  (add-to-list 'magic-mode-alist '("#!.*boot\\s-*$" . clojure-mode))
  :config
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'clojurescript-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode))

(use-package cider
  :defer t
  :init
  (setq cider-stacktrace-default-filters '(tooling dup)
        cider-repl-pop-to-buffer-on-connect nil
        cider-prompt-save-file-on-load nil
        cider-repl-use-clojure-font-lock t
        cider-repl-display-help-banner nil)
  (add-hook 'clojure-mode-hook 'cider-mode)
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))

(use-package company
  :diminish company-mode
  :config (global-company-mode))

(use-package coffee-mode
  :defer t)

(use-package delight)

(use-package highlight-parentheses)

(use-package idle-highlight-mode
  :config
  (add-hook 'prog-mode-hook
            (lambda ()
              (idle-highlight-mode t))))

(use-package js2-mode
  :defer t
  :mode
  ("\\.js\\'" . js2-mode))

(use-package json-mode
  :defer t)

(use-package magit
  :bind ("C-c g" . magit-status)
  :init (setq magit-commit-arguments (quote ("--gpg-sign=76D1E98162B00F5A"))))

(use-package markdown-mode
  :config
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl))

(use-package monokai-theme)

(use-package paredit
  :diminish paredit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-global-mode))

(defvar ruby-version-manager 'rbenv)

(use-package rbenv
  :if (equal ruby-version-manager 'rbenv)
  :defer t)

(use-package ruby-mode
  :defer t
  :mode ("Brewfile\\'" . ruby-mode))

(use-package smex)

(use-package winum
  :config
  (setq winum-auto-assign-0-to-minibuffer nil
        winum-auto-setup-mode-line nil
        winum-ignored-buffers '(" *which-key*"))
  (progn
    (define-key winum-keymap (kbd "M-0") 'winum-select-window-0-or-10)
    (define-key winum-keymap (kbd "M-1") 'winum-select-window-1)
    (define-key winum-keymap (kbd "M-2") 'winum-select-window-2)
    (define-key winum-keymap (kbd "M-3") 'winum-select-window-3)
    (define-key winum-keymap (kbd "M-4") 'winum-select-window-4)
    (define-key winum-keymap (kbd "M-5") 'winum-select-window-5)
    (define-key winum-keymap (kbd "M-6") 'winum-select-window-6)
    (define-key winum-keymap (kbd "M-7") 'winum-select-window-7)
    (define-key winum-keymap (kbd "M-8") 'winum-select-window-8)
    (define-key winum-keymap (kbd "M-9") 'winum-select-window-9)
    (winum-mode)))

(use-package yaml-mode
  :mode
  (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
   ("Procfile\\'" . yaml-mode))
  :config
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.
    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.
    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun sort-symbols (reverse beg end)
  "Sort symbols in region alphabetically, in REVERSE if negative.
    See `sort-words'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))

(progn
  (global-set-key (kbd "M-j")
                  (lambda () (interactive)
                    (join-line -1)))

  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)

  (global-set-key (kbd "M-n") 'scroll-up-line)
  (global-set-key (kbd "M-p") 'scroll-down-line)

  (global-set-key (kbd "C-S-<up>")    'buf-move-up)
  (global-set-key (kbd "C-S-<down>")  'buf-move-down)
  (global-set-key (kbd "C-S-<left>")  'buf-move-left)
  (global-set-key (kbd "C-S-<right>") 'buf-move-right))

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file t)

;;; init.el
