;; A global minor mode that enables use of the M- prefix to select
;; windows, use `window-number-mode' to display the window numbers in
;; the mode-line.
(autoload 'window-number-meta-mode "window-number" t)
(window-number-meta-mode 1)
(window-number-mode t)
