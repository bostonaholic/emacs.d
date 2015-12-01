;;; starter-kit.el

(defvar msb/starter-kit-packages
  '(find-file-in-project
    idle-highlight-mode
    ;; magit
    ;; paredit
    ;; smex
    ))

(package-initialize)
(dolist (p msb/starter-kit-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
	(when (fboundp mode) (funcall mode -1)))

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

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

(add-hook 'prog-mode-hook 'msb/pretty-lambda)
(add-hook 'prog-mode-hook 'msb/add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)

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

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(defalias 'yes-or-no-p 'y-or-n-p)
