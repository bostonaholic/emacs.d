;;; starter-kit.el

(defvar msb/starter-kit-packages
  '(
    ;; magit
    ;; paredit
    ))

(package-initialize)
(dolist (p msb/starter-kit-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
	(when (fboundp mode) (funcall mode -1)))

(defun msb/pretty-lambda ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun msb/pretty-function ()
  (font-lock-add-keywords
   'js-mode `(("\\(function *\\)("
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1)
                                         "\u0192")
                         nil))))))

(defun msb/pretty-fn ()
  (font-lock-add-keywords
   nil `(("(\\(\\<fn\\>\\)"
          (0 (progn (compose-region (match-beginning 1)
                                    (match-end 1)
                                    "\u0192"
                                    'decompose-region)))))))

(defun msb/add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(setq visible-bell t
			inhibit-startup-message t
			shift-select-mode nil
			apropos-do-all t
			uniquify-buffer-name-style 'forward
			whitespace-style '(face trailing lines-tail tabs)
			ediff-window-setup-function 'ediff-setup-windows-plain
			save-place-file (concat user-emacs-directory "places")
			diff-switches "-u")

(show-paren-mode t)
(setq-default indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)
