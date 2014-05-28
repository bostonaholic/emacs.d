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

;; font-lock REPL as in clojure-mode
(setq cider-repl-use-clojure-font-lock t)

;; enable paredit in REPL buffer
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; ac-nrepl (Auto-complete for the nREPL)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

;; Poping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
