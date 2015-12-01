;; ClojureScript files are clojure-mode
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

;; docs
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'msb/pretty-fn)

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)

;; use this function to open a repl on heroku deployed apps
(defun heroku-repl ()
  (interactive)
  (inferior-lisp "heroku run lein repl"))
