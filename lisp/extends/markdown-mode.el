(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(eval-after-load 'markdown-mode
  '(progn
     ;; markdown should not have highlighted long lines
     (add-hook 'markdown-mode-hook (setq whitespace-style nil))))
