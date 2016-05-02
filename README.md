Matthew Boston's Emacs config

## Dependencies

You can install Emcas via [emacsforosx](http://emacsforosx.com), directly from [GNU Emacs](http://www.gnu.org/software/emacs/), or [homebrew](http://brew.sh/).

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

To enable flymake for JavaScript, first we must add the `binary` repo for homebrew.

`$ brew tap homebrew/binary`

Now, we can install jsl.

`$ brew install jsl`

enable flymake for CoffeeScript

`$ npm install -g coffee-script`

enable aspell for spell check

`$ brew install aspell --lang=en`
