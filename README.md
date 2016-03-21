# Dotfiles (adapted from many places including bitemyapp's dotfiles and Maximum Awesome)

Config files for vim, tmux, haskell platform, zsh and more

## What's in it?

* [tmux](http://tmux.github.io/)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

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
* `,hH` prompts for a hoogle search
* `,hh` searches hoogle for word under the cursor
* `,hi` get detailed information from Hoogle, under the cursor
* `,hz` close the hoogle window
* `,a=` align on equal signs
* `,a,` align on commas
* `,a|` align on |

### tmux

* `<C-a>` is the prefix
* mouse scroll initiates tmux scroll
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split

If you have three or more panes:
* `prefix +` opens up the main-horizontal-layout
* `prefix =` opens up the main-vertical-layout

You can adjust the size of the smaller panes in `tmux.conf` by lowering or increasing the `other-pane-height` and `other-pane-width` options.

### Zsh

Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and loads a
~/.zshrc.private file for private exports and such

## bootstrap

    rake bootstrap

## Install

    rake

## Update

    rake

This will update all installed plugins using Vundle's `:PluginInstall!`
command. Any errors encountered during this process may be resolved by clearing
out the problematic directories in ~/.vim/bundle. `:help PluginInstall`
provides more detailed information about Vundle.

## Customize
creates `.vimrc.local`, `.vimrc.bundles.local` and `.tmux.conf.local` files where you can customize settings

## Uninstall

    rake uninstall

Note that this won't remove everything, but your vim configuration should be reset to whatever it was before installing. Some uninstallation steps will be manual.

