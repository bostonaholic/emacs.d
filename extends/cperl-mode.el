;; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

;; add test files to cperl-mode
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
