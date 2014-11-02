;;; starter-kit-bindings.el

(global-set-key (kbd "C-c f") 'find-file-in-project)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "M-/") 'hippie-expand)

;; font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

(global-set-key (kbd "C-c g") 'magit-status)
