;; Turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
	(when (fboundp mode) (funcall mode -1)))

;; font
(set-face-attribute 'default nil :family "Monaco" :height 160)

;; Global whitespace mode
(global-whitespace-mode t)

(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq
 ;; Do not show a splash screen.
 inhibit-splash-screen t
 ;; Never show dialog boxes.
 use-dialog-box nil

 visible-bell t
 inhibit-startup-message t
 shift-select-mode nil
 apropos-do-all t
 uniquify-buffer-name-style 'forward
 whitespace-style '(face trailing lines-tail tabs))

(setq-default
 ;; Default tab-width
 tab-width 2
 ;; do not use tabs
 indent-tabs-mode nil
 ;; max column width
 whitespace-line-column 9999)

;; Show what text is selected.
(transient-mark-mode t)

;; And delete selected text if we type over it.
(delete-selection-mode t)

;; Turn on line numbers.
(global-linum-mode t)

;; format line numbers
(setq linum-format "%4d ")

;; Turn off line hilight
(global-hl-line-mode -1)
(hl-line-mode -1)

;; Show the end of files.
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(when window-system
  ;; Make the window title reflect the current buffer.
  (setq frame-title-format (concat "%b - emacs@" system-name))
  ;; Load theme of choice
  (msb/light))
