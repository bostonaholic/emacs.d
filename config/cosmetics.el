;; font
(set-face-attribute 'default nil :family "Monaco" :height 140)

(setq
 ;; Do not show a splash screen.
 inhibit-splash-screen t
 ;; Never show dialog boxes.
 use-dialog-box nil
 ;; Flash the screen on errors.
 visible-bell t)

(setq-default
 ;; default tab-width
 tab-width 2)

;; Show what text is selected.
(transient-mark-mode t)

;; And delete selected text if we type over it.
(delete-selection-mode t)

;; turn on line numbers.
(global-linum-mode t)

;; Show the end of files.
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(when window-system
  ;; Make the window title reflect the current buffer.
  (setq frame-title-format (concat "%b - emacs@" system-name))
  ;; load theme of choice
  (msb/mono))
