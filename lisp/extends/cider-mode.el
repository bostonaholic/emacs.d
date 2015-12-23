(eval-after-load 'cider-mode
  '(progn
     ;; hide *nrepl-connection* and *nrepl-server* from buffer list
     (setq nrepl-hide-special-buffers t)

     ;; override buffer name separator
     (setq nrepl-buffer-name-separator "-")

     ;; show port in nrepl buffer name
     (setq nrepl-buffer-name-show-port t)

     ;; change default result prefix for REPL evaluation
     (setq cider-repl-result-prefix ";; => ")

     ;; change the default result prefix for interactive evaluation
     (setq cider-interactive-eval-result-prefix ";; => ")

     ;; always pretty print results in the REPL
     (setq cider-repl-use-pretty-printing t)

     ;; font-lock REPL as in clojure-mode
     (setq cider-repl-use-clojure-font-lock t)

     ;; enable paredit in REPL buffer
     (add-hook 'cider-repl-mode-hook 'paredit-mode)

     ;; enable eldoc in Clojure buffers
     (add-hook 'cider-mode-hook 'eldoc-mode)

     (global-set-key (kbd "C-c b") 'cider-eval-buffer)

     ;; store the REPL history in a file
     (setq cider-repl-history-file "~/.cider-repl-history")

     ;; logging
     (setq nrepl-log-messages t)))
