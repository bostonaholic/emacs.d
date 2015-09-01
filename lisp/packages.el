(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar msb/packages
  '(;; general
    ace-jump-mode ; ultra-fast cursor movement
    auto-complete
    ag ; the silver searcher
    buffer-move ; move buffers with ease
    company ; modular text completion framework
    flymake ; on-the-fly syntax checks
    flymake-cursor ; display flymake messages in the minibuffer
    midnight ; run actions at midnight
    deft ; notes
    ido-ubiquitous ; use ido (nearly) everywhere
    paredit
    smex ; ido-mode for M-x commands
    window-number
    yasnippet
    yas-jit ; load yasnippets on demand

    ;; themes
    ;; color-theme-solarized
    solarized-theme

    ;; clojure
    cider
    ;; cider-test
    clojure-mode
    cljsbuild-mode
    dash ; a modern list API for emacs
    pkg-info ; provide information about emacs packages
    slamhound

    ;; ruby
    ruby-mode
    rbenv
    feature-mode ; cukes
    flymake-ruby

    ;; javascript
    coffee-mode
    json-mode
    flymake-jslint
    flymake-json

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

    ;; other programming
    cperl-mode
    magit ; control git from emacs
    pivotal-tracker
    prolog
    yaml-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (pkg msb/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))
