;;; starter-kit-lisp.el

(defun msb/remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'msb/remove-elc-on-save)

(dolist (mode '(emacs-lisp lisp clojure clojurescript))
	(add-hook (intern (concat (symbol-name mode) "-mode-hook"))
						'paredit-mode))

(add-hook 'clojure-mode-hook 'msb/pretty-fn)
(add-hook 'clojurescript-mode-hook 'msb/pretty-fn)
