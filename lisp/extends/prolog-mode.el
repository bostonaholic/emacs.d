;;; settings for Prolog
;;; taken from http://www.swi-prolog.org/FAQ/GnuEmacs.html

(add-to-list 'auto-mode-alist '("\\.pl" 'prolog-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" 'prolog-mode))

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)

(eval-after-load 'prolog
  '(progn
     (setq prolog-program-name (quote (((getenv "EPROLOG") (eval (getenv "EPROLOG")))
                                       (eclipse "eclipse")
                                       (mercury nil)
                                       (sicstus "sicstus")
                                       (swi "/usr/local/bin/swipl")
                                       (gnu "gprolog")
                                       (t "prolog"))))

     (setq prolog-system 'swi)))
