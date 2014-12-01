(add-hook 'ruby-mode-hook 'paredit-mode)

(defun msb/ruby-paredit ()
  (define-key ruby-mode-map "{" 'paredit-open-curly)
  (define-key ruby-mode-map "}" 'paredit-close-curly))

(eval-after-load 'ruby 'msb/ruby-paredit)
