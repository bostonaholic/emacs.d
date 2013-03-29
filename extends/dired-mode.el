(defun msb/dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  [remap beginning-of-buffer] 'msb/dired-back-to-top)

(defun msb/dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  [remap end-of-buffer] 'msb/dired-jump-to-bottom)
