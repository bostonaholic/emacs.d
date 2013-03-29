;;; init.el --- Where all the magic begins

;; Work around a bug on OS X where system-name is FQDN
(when (eq system-type 'darwin)
  (setq system-name (car (split-string system-name "\\."))))

;; this is me
(setq user-full-name "Matthew Boston")
(setq user-mail-address "me@matthewboston.com")

;; Configuration root
(setq config-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path config-dir)

;; my super-special configurations
(load "packages")
(load "functions")
(load "hooks")
(load "bindings")

;; custom configurations
(load "config/ack")
(load "config/aspell")
(load "config/autocomplete")
(load "config/deft")
(load "config/erc")
(load "config/flymake")
(load "config/kibit")
(load "config/pivotal")

;; extend modes
(load "extends/window-number-mode")

;; let emacs find homebrews
(push "/usr/local/bin" exec-path)

;; Save file backups in a temporary directory.
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; All files should end in a newline.
(setq require-final-newline t)

;; clean un-used buffers at given time
(midnight-delay-set 'midnight-delay "3:33pm")

;; version control to follow symlinked files
(setq vc-follow-symlinks t)

;; Emacs is fast for OSX again!
(setq font-lock-verbose nil)
