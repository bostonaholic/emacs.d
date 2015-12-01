;; JavaScript files are js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(eval-after-load 'js
  '(progn
     (define-key js-mode-map "(" 'paredit-open-round)
     (define-key js-mode-map ")" 'paredit-close-round)
     (define-key js-mode-map "{" 'paredit-open-curly)
     (define-key js-mode-map "}" 'paredit-close-curly)
     (setq js-indent-level 2)))

(setq js2-highlight-level 3)

(add-hook 'js-mode-hook 'msb/pretty-function)
(add-hook 'json-mode-hook 'flymake-json-load)
(add-hook 'json-mode-hook 'paredit-mode)
