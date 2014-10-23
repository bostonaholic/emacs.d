;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda () (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda () (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda () (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda () (interactive)
                  (ignore-errors (backward-char 5))))

;; easy window scrolling up and down.
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

;; join line below to current line
(global-set-key (kbd "M-j")
                (lambda () (interactive)
                  (join-line -1)))

(global-set-key (kbd "C-<return>") 'msb/smart-open-line)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; buffer-move bindings
(global-set-key (kbd "C-S-<up>")     'buf-move-up)
(global-set-key (kbd "C-S-<down>")   'buf-move-down)
(global-set-key (kbd "C-S-<left>")   'buf-move-left)
(global-set-key (kbd "C-S-<right>")  'buf-move-right)

;; buffer-resize bindings
(global-set-key (kbd "M-+") 'enlarge-window)
(global-set-key (kbd "M--") 'shrink-window)
(global-set-key (kbd "M-}") 'enlarge-window-horizontally)
(global-set-key (kbd "M-{") 'shrink-window-horizontally)

;; start deft-mode
(global-set-key (kbd "C-c d") 'deft)
