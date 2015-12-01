(eval-after-load 'coffee-mode
  '(progn
     (add-hook 'coffee-mode-hook 'paredit-mode)
     (define-key coffee-mode-map "{" 'paredit-open-curly)
     (define-key coffee-mode-map "}" 'paredit-close-curly)

     ;; This gives you a tab of 2 spaces
     (custom-set-variables '(coffee-tab-width 2))))
