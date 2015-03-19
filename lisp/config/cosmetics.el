;; font
(set-face-attribute 'default nil :family "Monaco" :height 140)

;; Global whitespace mode
(global-whitespace-mode t)

(setq
 ;; Do not show a splash screen.
 inhibit-splash-screen t
 ;; Never show dialog boxes.
 use-dialog-box nil)

(setq-default
 ;; Default tab-width
 tab-width 2
 ;; Show trailing whitespace
 show-trailing-whitespace t
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
