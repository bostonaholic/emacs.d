;;; init.el --- Where all the magic begins

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
(load "hooks")
(load "bindings")

;; starter-kit
(load "starter-kit")
(load "starter-kit-bindings")
(load "starter-kit-js")
(load "starter-kit-lisp")
(load "starter-kit-ruby")
;; (load "starter-kit-eshell")
;; (load "starter-kit-perl")

;; custom configurations
(load "config/ace-jump-mode")
(load "config/ack")
(load "config/autocomplete")
(load "config/deft")
(load "config/erc")
(load "config/flymake")
(load "config/ispell")
(load "config/kibit")
(load "config/pivotal")
(load "config/rbenv")
(load "config/yasnippet")

;; extend modes
(load "extends/clojure-mode")
(load "extends/cider-mode")
(load "extends/coffee-mode")
(load "extends/cperl-mode")
(load "extends/dired-mode")
(load "extends/html-mode")
(load "extends/ido-mode")
(load "extends/prolog-mode")
(load "extends/scss-mode")
(load "extends/sh-mode")
(load "extends/window-number-mode")

;; miscellaneous configurations
(load "config/misc")

;; now, make it pretty.
(load "config/cosmetics")
