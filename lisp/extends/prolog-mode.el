;;; settings for Prolog
;;; taken from http://www.swi-prolog.org/FAQ/GnuEmacs.html

(setq auto-mode-alist
      (cons (cons "\\.pl" 'prolog-mode)
            auto-mode-alist))

(setq prolog-program-name (quote (((getenv "EPROLOG") (eval (getenv "EPROLOG")))
                                   (eclipse "eclipse")
                                   (mercury nil)
                                   (sicstus "sicstus")
                                   (swi "/usr/local/bin/swipl")
                                   (gnu "gprolog")
                                   (t "prolog"))))

(setq prolog-system 'swi)
