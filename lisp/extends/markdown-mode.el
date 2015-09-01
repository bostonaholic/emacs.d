(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; markdown should not have highlighted long lines
(add-hook 'markdown-mode-hook (setq whitespace-style nil))
