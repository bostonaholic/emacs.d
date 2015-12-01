(eval-after-load 'sgml-mode
  '(progn
     (add-to-list 'auto-mode-alist '("\\.eco$" . html-mode))
     (add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))))
