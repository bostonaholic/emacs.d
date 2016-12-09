;;; init.el

(setq user-full-name "Matthew Boston"
      user-mail-address "matthew@matthewboston.com")

(setq gc-cons-threshold 50000000)

(require 'package)

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
      linum-format " %i "
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

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package better-defaults)

(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'clojurescript-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode))

(use-package cider
  :init (setq cider-repl-display-help-banner nil)
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))

(use-package company
  :diminish company-mode
  :config (global-company-mode))

(use-package flx)

(use-package highlight-parentheses)

(use-package idle-highlight-mode
  :diminish idle-highlight-mode
  :config
  (add-hook 'prog-mode-hook
            (lambda ()
              (idle-highlight-mode t))))

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

(use-package smex)

(use-package yaml-mode)

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
