(require 'package)

(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar msb/packages
  '(auto-complete
    buffer-move
    clojure-mode
    clojure-test-mode
    coffee-mode
    cperl-mode
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
    monokai-theme
    nrepl
    phoenix-dark-pink-theme
    phoenix-dark-mono-theme
    pivotal-tracker
    prolog
    rainbow-mode
    ruby-mode
    sass-mode
    scss-mode
    slamhound
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

(dolist (pkg msb/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))
