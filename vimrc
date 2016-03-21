" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                 " Fix broken backspace in some setups
set backupcopy=yes              " see :help crontab
set clipboard=unnamed           " yank and paste with the system clipboard
set directory-=.                " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                   " expand tabs to spaces
set hlsearch
set ignorecase                  " case-insensitive search
set incsearch                   " search as you type
set laststatus=2                " always show statusline
set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                      " show line numbers
set ruler                       " show where you are
set scrolloff=3                 " show context above/below cursorline
set shiftwidth=2                " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                   " case-sensitive search if any caps
set softtabstop=2               " insert mode tab and backspace use 2 spaces
set tabstop=8                   " actual tabs occupy 8 characters
set wildmenu                    " show a navigable menu for tab completion
set wildmode=longest,list,full
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:syntastic_auto_loc_list=1

" javascript specific
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

" keyboard shortcuts
let mapleader = ','
nmap <C-t> :tabnew<CR>
nmap <leader>v :vsp<CR>
nmap <leader>s :sp<CR>
nmap <leader>hr :%s/\1:/\v:(\w+) \=\>/g<cr>
nmap <leader>nh :nohlsearch<CR>
nmap <leader>lp i{-# LANGUAGE #-}<Esc>Bi
nmap <leader>er i<%= %><Esc>Bi

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ack<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader><space> :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR> " Remove trailing whitespace
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nnoremap <leader>g :GitGutterToggle<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>


" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle <CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

map <silent> hw :GhcModTypeInsert<CR>
map <silent> hs :GhcModSplitFunCase<CR>
map <silent> ht :GhcModType<CR>
map <silent> hc :GhcModTypeClear<CR>

let g:closetag_filenames = "*.html.*,*.xhtml,*.phtml,*.erb"
" vim rspec
let g:RspecSplitHorizontal=0
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
map <Leader>l :call RunLastSpec()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>R :call RunAllSpecs()<CR>
map <Leader>em :ElmMakeCurrentFile<CR>
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

au BufRead,BufNewFile *.tidal set filetype=haskell
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" " Fix Cursor in TMUX
" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
