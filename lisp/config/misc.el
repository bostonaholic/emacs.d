;; let emacs find homebrews
(push "/usr/local/bin" exec-path)

;; Save file backups in a temporary directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; do not autosave
(setq auto-save-default nil)

;; All files should end in a newline.
(setq require-final-newline t)

;; clean un-used buffers at given time
(midnight-delay-set 'midnight-delay "3:33pm")

;; version control to follow symlinked files
(setq vc-follow-symlinks t)

;; Emacs is fast for OSX again!
(setq font-lock-verbose nil)

;; Automatically revert files when changed on disk
(global-auto-revert-mode t)
