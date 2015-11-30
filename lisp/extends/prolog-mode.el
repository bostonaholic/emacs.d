;;; settings for Prolog
;;; taken from http://www.swi-prolog.org/FAQ/GnuEmacs.html

(add-to-list 'auto-mode-alist '("\\.pl" 'prolog-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" 'prolog-mode))

(setq prolog-program-name (quote (((getenv "EPROLOG") (eval (getenv "EPROLOG")))
                                   (eclipse "eclipse")
                                   (mercury nil)
                                   (sicstus "sicstus")
                                   (swi "/usr/local/bin/swipl")
                                   (gnu "gprolog")
                                   (t "prolog"))))

(setq prolog-system 'swi)
