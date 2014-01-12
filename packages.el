(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar msb/packages
  '(;; general
    auto-complete
    ag
    buffer-move ; move buffers with ease
    flymake
    flymake-cursor
    full-ack
    midnight ; run actions at midnight
    deft ; notes
    ido-ubiquitous
    smex ; ido-mode for M-x commands
    window-number
    yasnippet

    ;; clojure
    ac-nrepl
    ac-slime
    clojure-mode
    clojure-test-mode
    clojurescript-mode
    nrepl
    paredit
    slamhound
    slime
    slime-repl

    ;; ruby
    ruby-mode
    feature-mode ; cukes
    flymake-ruby

    ;; javascript
    coffee-mode
    flymake-jslint

    ;; html and css
    flymake-haml
    flymake-less
    flymake-sass
    haml-mode
    handlebars-mode
    less-css-mode
    markdown-mode
    mustache-mode
    sass-mode
    scss-mode
    slim-mode

    ;; starter-kit
    starter-kit
    starter-kit-bindings
    starter-kit-js
    starter-kit-lisp
    starter-kit-perl
    starter-kit-ruby

    ;; other programming
    cperl-mode
    magit
    pivotal-tracker
    prolog
    yaml-mode

    ;; themes
    monokai-theme
    solarized-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (pkg msb/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))
