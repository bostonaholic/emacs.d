;; hooks to compile the init.el file
(add-hook 'emacs-lisp-mode-hook 'msb/after-save-compile-init-hook)
(add-hook 'kill-emacs-hook 'msb/byte-compile-user-init-file t t)

;; paredit for nrepl
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; markdown should not have highlighted long lines
(add-hook 'markdown-mode-hook (setq whitespace-style nil))
