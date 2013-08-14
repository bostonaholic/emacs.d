Matthew Boston's Emacs 24 config

## Dependencies

This works best with Emacs 24. You can install via
[emacsforosx](http://emacsforosx.com), directly from
[GNU Emacs](http://www.gnu.org/software/emacs/), or homebrew.

## Installation

1. First start by cloning this repo to you local machine.

`$ git clone git@github.com:bostonaholic/emacs.d.git`

2. Symlink the repo into your home directory `$ ln -s /path/to/repo ~/.emacs.d`

3. Enable the option key to be `meta`.

For Terminal.app, starting from Snow Leopard: Go to Preferences > Settings > Keyboard > Use option as meta key.

## External Packages

Leiningen for Clojure development

first install a JDK

`$ brew install leiningen`

enable flymake for JavaScript

`$ brew install jsl`

enable flymake for CoffeeScript

`$ npm install -g coffee-script`

enable aspell for spell check

`$ brew install aspell --lang=en`
