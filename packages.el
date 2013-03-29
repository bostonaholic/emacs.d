(require 'package)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/package/s") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; TODO: maybe don't need this
;; (when (not package-archive-contents)
;;   (package-refresh-contents))

(defvar msb/packages
  '(auto-complete
    buffer-move
    clojure-mode
    clojure-test-mode
    coffee-mode
    deft
    feature-mode
    flymake
    flymake-cursor
    flymake-haml
    flymake-jslint
    flymake-ruby
    flymake-sass
    full-ack
    haml-mode
    handlebars-mode
    htmlize
    markdown-mode
    midnight
    mustache-mode
    nrepl
    pivotal-tracker
    prolog
    ruby-mode
    sass-mode
    scss-mode
    slim-mode
    slime
    slime-repl
    ac-slime
    solarized-theme
    starter-kit
    starter-kit-bindings
    starter-kit-js
    starter-kit-lisp
    starter-kit-perl
    starter-kit-ruby
    window-number
    yaml-mode
    yasnippet)
  "A list of packages to ensure are installed at launch.")

(defun package-not-installed-p (pkg)
  (not (package-installed-p pkg)))

(defun packages-installed-p ()
  (loop for pkg in msb/packages
        when (package-not-installed-p pkg) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg msb/packages)
    (when (package-not-installed-p pkg)
      (package-install pkg))))
