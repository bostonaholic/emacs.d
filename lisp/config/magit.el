(defun set-magit-scheme ()
  (set-face-foreground 'magit-diff-add "green4")
  (set-face-foreground 'magit-diff-del "red4"))

(add-hook 'magit-mode-hook 'set-magit-scheme)
