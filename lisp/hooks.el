;; hooks to compile all emacs lisp files
(add-hook 'emacs-lisp-mode-hook 'msb/after-save-byte-compile-file-hook)

;; paredit for nrepl
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; markdown should not have highlighted long lines
(add-hook 'markdown-mode-hook (setq whitespace-style nil))
