(add-to-list 'auto-mode-alist '("\\.irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

(add-hook 'ruby-mode-hook
          (lambda ()
            (paredit-mode)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)
            ;; (define-key ruby-mode-map "{" 'self-insert-command)
            ;; (define-key ruby-mode-map "}" 'self-insert-command)
            ))
