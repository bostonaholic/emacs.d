(require 'package)

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar msb/packages
  '(;; general
    auto-complete
    ag ; the silver searcher
    buffer-move ; move buffers with ease
    company ; modular text completion framework
    flymake ; on-the-fly syntax checks
    flymake-cursor ; display flymake messages in the minibuffer
    ido-ubiquitous ; use ido (nearly) everywhere
    paredit
    smex ; ido-mode for M-x commands
    window-number

    ;; themes
    solarized-theme

    ;; clojure
    cider
    clojure-mode

    ;; ruby
    ruby-mode
    rbenv
    flymake-ruby

    ;; javascript
    ;; ac-js2-mode
    js2-mode
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
