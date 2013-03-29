;;; init.el --- Where all the magic begins

;; Work around a bug on OS X where system-name is FQDN
(when (eq system-type 'darwin)
  (setq system-name (car (split-string system-name "\\."))))

;; this is me
(setq user-full-name "Matthew Boston")
(setq user-mail-address "me@matthewboston.com")

;; load my custom functions first
(load-file "msb/functions")

;; my super-special configurations
(load-file "msb/packages")
(load-file "msb/hooks")
(load-file "msb/bindings")

;; custom configurations
(load-file "config-flymake")

;; let emacs find homebrews
(push "/usr/local/bin" exec-path)

;; All files should end in a newline.
(setq require-final-newline t)

;; clean un-used buffers at given time
(midnight-delay-set 'midnight-delay "3:33pm")

;; version control to follow symlinked files
(setq vc-follow-symlinks t)

;; Emacs is fast for OSX again!
(setq font-lock-verbose nil)
