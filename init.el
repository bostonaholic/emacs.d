;;; init.el --- Where all the magic begins

;; increase garbage collection threshold
(setq gc-cons-threshold 2400000)

;; User details
(setq user-full-name "Matthew Boston")
(setq user-mail-address "matthew@matthewboston.com")

;; Environment
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(require 'cl)
(require 'cl-lib)

;; OS X workarounds
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; Configuration root
(setq config-dir (concat (file-name-directory (or (buffer-file-name)
                                                  load-file-name))
                         "lisp"))
(add-to-list 'load-path config-dir)

;; my super-special configurations
(load "packages")
(load "functions")
(load "bindings")

;; custom configurations
(load "config/auto-complete")
(load "config/erc")
(load "config/flymake")
(load "config/ispell")
(load "config/magit")
(load "config/midnight")
(load "config/smex")

;; extend modes
(load "extends/clojure-mode")
(load "extends/cider-mode")
(load "extends/coffee-mode")
(load "extends/cperl-mode")
(load "extends/emacs-lisp-mode")
(load "extends/html-mode")
(load "extends/ido-mode")
(load "extends/js2-mode")
(load "extends/markdown-mode")
(load "extends/prog-mode")
(load "extends/prolog-mode")
(load "extends/ruby-mode")
(load "extends/scss-mode")
(load "extends/sh-mode")
(load "extends/window-number-mode")

;; miscellaneous configurations
(load "config/misc")

;; now, make it pretty.
(load "config/cosmetics")
