;;; init.el

(set-frame-parameter nil 'fullscreen 'maximized)

(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(let ((secret.el (expand-file-name ".secret.el" user-emacs-directory)))
  (when (file-exists-p secret.el)
    (load secret.el)))

(setq user-full-name my/user-full-name
      user-mail-address my/user-mail-address)

(setq gc-cons-threshold 100000000)

(require 'package)

(setq package-enable-at-startup nil
      use-package-always-ensure t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package.el is no longer needed at runtime
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq large-file-warning-threshold 100000000
      fill-column 80
      global-visual-line-mode t
      inhibit-startup-screen t
      kill-whole-line t
      linum-format " %3i "
      ring-bell-function 'ignore
      vc-follow-symlinks t
      visible-bell nil
      whitespace-style '(face trailing lines-tail tabs))

(global-linum-mode t)
(winner-mode t)

(set-face-attribute 'default nil :font "Fira Mono for Powerline")

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook
          (lambda ()
            (make-local-variable 'column-number-mode)
            (column-number-mode t)
            (when window-system (hl-line-mode t))))

(add-hook 'focus-out-hook #'garbage-collect)

(use-package msb-mode
  ;; run before package is loaded
  :init (setq my-var t)

  ;; run after package is loaded
  :config (msb-mode 1)

  ;; run before everything except :disabled
  :preface ((defun i-need-this () ...))

  ;; added to 'auto-mode-alist
  ;; infers :defer
  :mode "\\.rb\\'" ;; OR
  :mode ("\\.py\\'" . python-mode)

  ;; added to 'interpreter-mode-alist
  ;; infers :defer
  :interpreter "ruby" ;; OR
  :interpreter ("python" . python-mode)

  ;; define autoloads
  :commands msb-mode

  ;; keybindings
  ;; infers :defer
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

(use-package autorevert
  :diminish auto-revert-mode)

(use-package better-defaults)

(use-package clojure-mode
  :defer t
  :mode ("\\.boot\\'" "\\.edn\\'")
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

(use-package dockerfile-mode
  :defer t)
(use-package css-mode
  :ensure nil
  :config (setq-default css-indent-offset 2))

(use-package scss-mode
  :ensure nil
  :preface
  (defun msb/scss-set-comment-style ()
    (setq-local comment-end "")
    (setq-local comment-start "//"))
  :delight scss-mode "SCSS"
  :mode ("\\.css\\'" "\\.sass\\'" "\\.scss\\'")
  :init (add-hook 'scss-mode-hook #'msb/scss-set-comment-style))

(use-package helm
  :defer 1
  :commands (msb/helm-find-files)
  :init
  (defun msb/helm-find-files (arg)
    "Custom implementation for calling helm-find-files-1.
Removes the automatic guessing of the initial value based on thing at point. "
    (interactive "P")
    (let* ((hist (and arg helm-ff-history (helm-find-files-history)))
           (default-input hist)
           (input (cond ((and (eq major-mode 'dired-mode) default-input)
                         (file-name-directory default-input))
                        ((and (not (string= default-input ""))
                              default-input))
                        (t (expand-file-name (helm-current-directory))))))
      (set-text-properties 0 (length input) nil input)
      (helm-find-files-1 input)))
  (defun msb//helm-cleanup ()
    "Cleanup some helm related states when quitting."
    ;; deactivate any running transient map (transient-state)
    (setq overriding-terminal-local-map nil))
  (defun msb//helm-find-files-edit (candidate)
    "Opens a dired buffer and immediately switches to editable mode."
    (dired (file-name-directory candidate))
    (dired-goto-file candidate)
    (dired-toggle-read-only))
  (defun msb/helm-find-files-edit ()
    "Exits helm, opens a dired buffer and immediately switches to editable mode."
    (interactive)
    (helm-exit-and-execute-action 'spacemacs//helm-find-files-edit))
  (add-hook 'helm-cleanup-hook #'msb//helm-cleanup)
  (define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)
  :config
  (helm-mode)
  (helm-locate-set-command)
  (setq helm-locate-fuzzy-match (string-match "locate" helm-locate-command))
  :bind
  (("C-x C-f" . msb/helm-find-files)
   ("C-x b" . helm-buffers-list)))

(use-package helm-ag
  :defer t
  :after helm
  :init
  (defvar search-tools '("ag" "pt" "ack" "grep"))
  (progn
    (defun msb//helm-do-ag-region-or-symbol (func &optional dir)
      "Search with `ag' with a default input."
      (require 'helm-ag)
      (cl-letf* (((symbol-value 'helm-ag-insert-at-point) 'symbol)
                 ;; make thing-at-point choosing the active region first
                 ((symbol-function 'this-fn) (symbol-function 'thing-at-point))
                 ((symbol-function 'thing-at-point)
                  (lambda (thing)
                    (let ((res (if (region-active-p)
                                   (buffer-substring-no-properties
                                    (region-beginning) (region-end))
                                 (this-fn thing))))
                      (when res (rxt-quote-pcre res))))))
        (funcall func dir)))

    (defun msb//helm-do-search-find-tool (base tools default-inputp)
      "Create a cond form given a TOOLS string list and evaluate it."
      (eval
       `(cond
         ,@(mapcar
            (lambda (x)
              `((executable-find ,x)
                ',(let ((func
                         (intern
                          (format (if default-inputp
                                      "msb/%s-%s-region-or-symbol"
                                    "msb/%s-%s")
                                  base x))))
                    (if (fboundp func)
                        func
                      (intern (format "%s-%s"  base x))))))
            tools)
         (t 'helm-do-grep))))

    ;; Search in current file ----------------------------------------------

    (defun msb/helm-file-do-ag (&optional _)
      "Wrapper to execute `helm-ag-this-file.'"
      (interactive)
      (helm-do-ag-this-file))

    (defun msb/helm-file-do-ag-region-or-symbol ()
      "Search in current file with `ag' using a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-file-do-ag))

    (defun msb/helm-file-smart-do-search (&optional default-inputp)
      "Search in current file using `search-tools'.
Search for a search tool in the order provided by `search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
      (interactive)
      (call-interactively
       (msb//helm-do-search-find-tool "helm-file-do"
                                      search-tools
                                      default-inputp)))

    (defun msb/helm-file-smart-do-search-region-or-symbol ()
      "Search in current file using `search-tools' with
 default input.
Search for a search tool in the order provided by `search-tools'."
      (interactive)
      (msb/helm-file-smart-do-search t))

    ;; Search in files -----------------------------------------------------

    (defun msb/helm-files-do-ag (&optional dir)
      "Search in files with `ag' using a default input."
      (interactive)
      (helm-do-ag dir))

    (defun msb/helm-files-do-ag-region-or-symbol ()
      "Search in files with `ag' using a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-files-do-ag))

    (defun msb/helm-files-do-ack (&optional dir)
      "Search in files with `ack'."
      (interactive)
      (let ((helm-ag-base-command "ack --nocolor --nogroup"))
        (helm-do-ag dir)))

    (defun msb/helm-files-do-ack-region-or-symbol ()
      "Search in files with `ack' using a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-files-do-ack))

    (defun msb/helm-files-do-pt (&optional dir)
      "Search in files with `pt'."
      (interactive)
      (let ((helm-ag-base-command "pt -e --nocolor --nogroup"))
        (helm-do-ag dir)))

    (defun msb/helm-files-do-pt-region-or-symbol ()
      "Search in files with `pt' using a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-files-do-pt))

    (defun msb/helm-files-smart-do-search (&optional default-inputp)
      "Search in opened buffers using `search-tools'.
Search for a search tool in the order provided by `search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
      (interactive)
      (call-interactively
       (msb//helm-do-search-find-tool "helm-files-do"
                                      search-tools
                                      default-inputp)))

    (defun msb/helm-files-smart-do-search-region-or-symbol ()
      "Search in opened buffers using `search-tools'.
with default input.
Search for a search tool in the order provided by `search-tools'."
      (interactive)
      (msb/helm-files-smart-do-search t))

    ;; Search in buffers ---------------------------------------------------

    (defun msb/helm-buffers-do-ag (&optional _)
      "Wrapper to execute `helm-ag-buffers.'"
      (interactive)
      (helm-do-ag-buffers))

    (defun msb/helm-buffers-do-ag-region-or-symbol ()
      "Search in opened buffers with `ag' with a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-buffers-do-ag))

    (defun msb/helm-buffers-do-ack (&optional _)
      "Search in opened buffers with `ack'."
      (interactive)
      (let ((helm-ag-base-command "ack --nocolor --nogroup"))
        (helm-do-ag-buffers)))

    (defun msb/helm-buffers-do-ack-region-or-symbol ()
      "Search in opened buffers with `ack' with a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-buffers-do-ack))

    (defun msb/helm-buffers-do-pt (&optional _)
      "Search in opened buffers with `pt'."
      (interactive)
      (let ((helm-ag-base-command "pt -e --nocolor --nogroup"))
        (helm-do-ag-buffers)))

    (defun msb/helm-buffers-do-pt-region-or-symbol ()
      "Search in opened buffers with `pt' using a default input."
      (interactive)
      (msb//helm-do-ag-region-or-symbol 'msb/helm-buffers-do-pt))

    (defun msb/helm-buffers-smart-do-search (&optional default-inputp)
      "Search in opened buffers using `search-tools'.
Search for a search tool in the order provided by `search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
      (interactive)
      (call-interactively
       (msb//helm-do-search-find-tool "helm-buffers-do"
                                      search-tools
                                      default-inputp)))

    (defun msb/helm-buffers-smart-do-search-region-or-symbol ()
      "Search in opened buffers using `search-tools' with
default input.
Search for a search tool in the order provided by `search-tools'."
      (interactive)
      (msb/helm-buffers-smart-do-search t))

    ;; Search in project ---------------------------------------------------

    (defun msb/helm-project-do-ag ()
      "Search in current project with `ag'."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (helm-do-ag dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-do-ag-region-or-symbol ()
      "Search in current project with `ag' using a default input."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (msb//helm-do-ag-region-or-symbol 'helm-do-ag dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-do-ack ()
      "Search in current project with `ack'."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (msb/helm-files-do-ack dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-do-ack-region-or-symbol ()
      "Search in current project with `ack' using a default input."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (msb//helm-do-ag-region-or-symbol
             'msb/helm-files-do-ack dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-do-pt ()
      "Search in current project with `pt'."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (msb/helm-files-do-pt dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-do-pt-region-or-symbol ()
      "Search in current project with `pt' using a default input."
      (interactive)
      (let ((dir (projectile-project-root)))
        (if dir
            (msb//helm-do-ag-region-or-symbol
             'msb/helm-files-do-pt dir)
          (message "error: Not in a project."))))

    (defun msb/helm-project-smart-do-search (&optional default-inputp)
      "Search in current project using `search-tools'.
Search for a search tool in the order provided by `search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
      (interactive)
      (let ((projectile-require-project-root nil))
        (call-interactively
         (msb//helm-do-search-find-tool "helm-project-do"
                                        search-tools
                                        default-inputp))))

    (defun msb/helm-project-smart-do-search-region-or-symbol ()
      "Search in current project using `search-tools' with
 default input.
Search for a search tool in the order provided by `search-tools'."
      (interactive)
      (msb/helm-project-smart-do-search t))

    ;; This overrides the default C-s action in helm-projectile-switch-project
    ;; to search using ag/pt/whatever instead of just grep
    (with-eval-after-load 'helm-projectile
      (defun msb/helm-project-smart-do-search-in-dir (dir)
        (interactive)
        (let ((default-directory dir))
          (msb/helm-project-smart-do-search)))
      (define-key helm-projectile-projects-map
        (kbd "C-s")
        (lambda ()
          (interactive)
          (helm-exit-and-execute-action
           'msb/helm-project-smart-do-search-in-dir))))))

(use-package helm-projectile
  :defer t
  :after helm
  :commands (helm-projectile-switch-to-buffer
             helm-projectile-find-dir
             helm-projectile-dired-find-dir
             helm-projectile-recentf
             helm-projectile-find-file
             helm-projectile-grep
             helm-projectile
             helm-projectile-switch-project)
  :init
  (defalias 'msb/helm-project-do-grep 'helm-projectile-grep)
  (defalias 'msb/helm-project-do-grep-region-or-symbol 'helm-projectile-grep))

(use-package hi-lock
  :diminish hi-lock-mode)

(use-package highlight-parentheses)

(use-package sgml-mode
  :ensure nil
  :delight html-mode "HTML"
  :init
  (add-hook 'html-mode-hook #'sgml-electric-tag-pair-mode)
  (add-hook 'html-mode-hook #'sgml-name-8bit-mode)
  :config (setq-default sgml-basic-offset 2))

(use-package idle-highlight-mode
  :config
  (add-hook 'prog-mode-hook
            (lambda ()
              (idle-highlight-mode t))))

(use-package js2-mode
  :defer t
  :delight js2-jsx-mode "JSX"
  :mode ("\\.jsx?\\'" . js2-jsx-mode)
  :interpreter ("node" . js2-jsx-mode))

(use-package json-mode
  :defer t
  :mode "\\.jshintrc\\'")

(use-package magit
  :bind ("C-c g" . magit-status)
  :init (setq magit-commit-arguments (quote (concat "--gpg-sign=" my/gpg-signing-key))))

(use-package markdown-mode
  :config
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl))

(use-package monokai-theme
  :demand t)

(use-package mwim
  :defer t
  :init
  (global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
  (global-set-key (kbd "C-e") 'mwim-end-of-code-or-line))

(use-package neotree
  :defer t
  :commands neo-global--window-exists-p
  :init
  (setq neo-window-width 32
        neo-create-file-auto-open t
        neo-banner-message "Press ? for neotree help"
        neo-show-updir-line nil
        neo-mode-line-type 'neotree
        neo-smart-open t
        neo-dont-be-alone t
        neo-persist-show nil
        neo-show-hidden-files t
        neo-auto-indent-point t
        neo-modern-sidebar t
        neo-vc-integration nil)
  :bind ("C-c n" . neotree-toggle))

(use-package org
  :defer t
  :commands (orgtbl-mode))

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
  :mode "Brewfile\\'"
  :interpreter "ruby")

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(use-package smex
  :defer t
  :init
  (setq smex-history-length 32)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)))

(use-package tern
  :init (add-hook 'js-mode-hook #'tern-mode))

(use-package undo-tree
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t))

(use-package uuidgen)

(use-package whitespace
  :diminish whitespace-mode
  :config
  (add-hook 'prog-mode-hook 'whitespace-mode))

(use-package winum
  :config
  (setq winum-assign-func 'msb//winum-assign-func
        winum-auto-assign-0-to-minibuffer nil
        winum-auto-setup-mode-line nil
        winum-ignored-buffers '(" *which-key*")
        winum-scope 'frame-local)
  (defun msb//winum-assign-func ()
    "Custom number assignment for neotree."
    (when (string-match-p (buffer-name) ".*\\*NeoTree\\*.*")
      0))
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
  :mode ("\\.ya?ml\\'" "Procfile\\'")
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

;;; init.el
