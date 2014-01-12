;;; init.el --- Where all the magic begins

;; OS X workarounds
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; this is me
(setq user-full-name "Matthew Boston")
(setq user-mail-address "matthew.boston@gmail.com")

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
(load "config/autocomplete")
(load "config/deft")
(load "config/erc")
(load "config/flymake")
(load "config/ispell")
(load "config/kibit")
(load "config/pivotal")
(load "config/yasnippet")

;; extend modes
(load "extends/clojure-mode")
(load "extends/cperl-mode")
(load "extends/dired-mode")
(load "extends/html-mode")
(load "extends/prolog-mode")
(load "extends/ruby-mode")
(load "extends/scss-mode")
(load "extends/sh-mode")
(load "extends/window-number-mode")

;; miscellaneous configurations
(load "config/misc")

;; now, make it pretty.
(load "config/cosmetics")
