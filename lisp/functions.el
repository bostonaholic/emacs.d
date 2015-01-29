(defun disapproval () (interactive) (insert "ಠ_ಠ"))

(defun msb/file-string (file)
  "Read the contents of a file and return as a string."
  (with-current-buffer (find-file-noselect file)
    (buffer-string)))

(defun msb/edit-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun msb/reload-config ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun msb/move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
;; (global-set-key (kbd "C-S-<up>") 'msb/move-line-up)

(defun msb/move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
;; (global-set-key (kbd "C-S-<down>") 'msb/move-line-down)

;; compile user init file to descrease load time
(defun msb/compiled-user-init-file ()
  (concat (substring user-init-file 0 (- (length user-init-file) 3)) ".elc"))

(defun msb/byte-compile-user-init-file ()
  (let ((byte-compile-warnings '(unresolved)))
    ;; in case compilation fails, don't leave the old .elc around:
    (when (file-exists-p (msb/compiled-user-init-file))
      (delete-file (msb/compiled-user-init-file)))
    (byte-compile-file user-init-file)
    (message "%s compiled" user-init-file)))

(defun msb/after-save-compile-init-hook ()
  (when (equal (or buffer-file-name "") user-init-file)
    (add-hook 'after-save-hook 'msb/byte-compile-user-init-file t t)))

(defun msb/smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (open-line 1)
  (forward-line 1)
  (indent-according-to-mode))

(defun msb/dark ()
  (interactive)
  (load-theme 'solarized-dark t))

(defun msb/light ()
  (interactive)
  (load-theme 'solarized-light t))

(defun msb/none ()
  (interactive)
  (while custom-enabled-themes
    (disable-theme (car custom-enabled-themes))))

(defun msb/pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun msb/pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun msb/pbcut ()
  (interactive)
  (msb/pbcopy)
  (delete-region (region-beginning) (region-end)))
