;;; starter-kit-js.el

(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-curly)
          (define-key js-mode-map "}" 'paredit-close-curly)
          (setq js-indent-level 2)))

(add-hook 'js-mode-hook 'msb/pretty-function)

(add-hook 'json-mode-hook 'flymake-json-load)
(add-hook 'json-mode-hook 'paredit-mode)
