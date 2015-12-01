;; JavaScript files are js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(eval-after-load 'js2-mode
  '(progn
     (add-hook 'js2-mode-hook 'msb/pretty-function)
     (define-key js-mode-map "(" 'paredit-open-round)
     (define-key js-mode-map ")" 'paredit-close-round)
     (define-key js-mode-map "{" 'paredit-open-curly)
     (define-key js-mode-map "}" 'paredit-close-curly)
     (setq js2-highlight-level 3)
     (setq js-indent-level 2)))

(eval-after-load 'json-mode
  '(progn
     (add-hook 'json-mode-hook 'flymake-json-load)
     (add-hook 'json-mode-hook 'paredit-mode)))
