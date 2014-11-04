;; activate rbenv for emacs
(global-rbenv-mode)

(add-hook 'ruby-mode-hook 'rbenv-use-corresponding)

;; rbenv installation location
(setq rbenv-installation-dir "/usr/local")

;; show ruby version in modeline
(setq rbenv-show-active-ruby-in-modeline t)

;; this will remove the colors
;;(setq rbenv-modeline-function 'rbenv--modeline-plain)

