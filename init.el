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
      ring-bell-function 'identity)

(global-linum-mode t)
(winner-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package better-defaults)

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

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file t)

;;; init.el
