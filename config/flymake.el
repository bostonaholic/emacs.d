;; display flymake errors in the minibuffer
(eval-after-load 'flymake '(require 'flymake-cursor))

(add-hook 'coffee-mode-hook 'flymake-coffee-load)
(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'js-mode-hook 'flymake-jslint-load)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

;; set jsl as the jslint command
(setq flymake-jslint-command "jsl")
