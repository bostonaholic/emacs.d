(eval-after-load "clojure-mode"
  '(progn
     (add-hook 'clojure-mode-hook 'paredit-mode)
     (add-hook 'clojure-mode-hook 'eldoc-mode)
     (add-hook 'clojure-mode-hook 'msb/pretty-fn)))
