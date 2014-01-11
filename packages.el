(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar msb/packages
  '(ac-slime
    ac-nrepl
    auto-complete
    ag
    buffer-move ; move buffers with ease
    clojure-mode
    clojure-test-mode
    clojurescript-mode
    coffee-mode
    cperl-mode
    deft ; notes
    feature-mode ; cukes
    flymake
    flymake-cursor
    flymake-haml
    flymake-jslint
    flymake-less
    flymake-ruby
    flymake-sass
    full-ack
    haml-mode
    handlebars-mode
    ido-ubiquitous
    less-css-mode
    magit
    markdown-mode
    midnight ; run actions at midnight
    monokai-theme
    mustache-mode
    nrepl
    paredit
    pivotal-tracker
    prolog
    ruby-mode
    sass-mode
    scss-mode
    slamhound
    slim-mode
    slime
    slime-repl
    smex ; ido-mode for M-x commands
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
