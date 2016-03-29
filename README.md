# Dotfiles

Config files for vim, tmux, haskell platform, zsh and more


### vim

* `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `,<space>` brings up [ctrlp.vim](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `,a` starts project search with [ag.vim](https://github.com/rking/ag.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher) (like ack, but faster)
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `vii`/`vai` visually select *in* or *around* the cursor's indent
* `Vp`/`vp` replaces visual selection with default register *without* yanking selected text (works with any visual selection)
* `,S` strips trailing whitespace
* `<C-]>` jump to definition using ctags
* `,l` begins aligning lines on a string, usually used as `,l=` to align assignments
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`
* `,a=` align on equal signs
* `,a,` align on commas
* `,a|` align on |

haskell specific
----
* `,hw` insert the inferred type for the function under the cursor
* `,hs` split case functions for the variable under the cursor
* `,ht` show the type for the function under the cursor
* `,hc` clear the type information show from `ht`
* `,hh` searches hoogle for word under the cursor
* `,hi` get detailed information from Hoogle, under the cursor
* `,hz` close the hoogle window

stylish haskell is configured globally at ~/.stylish-haskell.yaml

### tmux

* `<C-a>` is the prefix
* mouse scroll initiates tmux scroll
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split

If you have three or more panes:
* `prefix +` opens up the main-horizontal-layout
* `prefix =` opens up the main-vertical-layout

### Zsh

Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and loads a
~/.zshrc.private file for private exports and such

## bootstrap

    ./bootstrap.sh
    ./system.sh

## Install

    rake

## Customize
creates `.vimrc.local`, `.vimrc.bundles.local` and `.tmux.conf.local` files where you can customize settings

## Credit

adapted from many places including [bitemyapp's dotfiles](https://github.com/bitemyapp/dotfiles) and [Maximum Awesome](https://github.com/square/maximum-awesome)
