;;; starter-kit-js.el

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-curly)
          (define-key js-mode-map "}" 'paredit-close-curly)
          (setq js-indent-level 2)))

(add-hook 'js-mode-hook 'msb/pretty-function)
