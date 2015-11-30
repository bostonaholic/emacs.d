;; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

;; add test files to cperl-mode
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.p[lm]$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))
