let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on
syntax enable
set noswapfile
set hlsearch
set number
set autoread

filetype plugin on
filetype indent on

" Visuals
set so=5 " scroll lines above/below cursor
set sidescrolloff=5
set lazyredraw
set ttyfast
set t_ut= " improve screen clearing by using the background color

set t_Co=256 " Force 256 colors

" " in case t_Co alone doesn't work, add this as well:
" " i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let $TERM='screen-256color'
set background=dark

" " Prevent Vim from clobbering the scrollback buffer. See
" " http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
set background=dark
colorscheme hybrid

" make background transparent
"hi Normal ctermbg=NONE
"hi EndOfBuffer ctermbg=NONE
hi LineNr ctermbg=234

set ruler		" show the cursor position all the time
set cursorline

set showcmd		" display incomplete commands

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

" Allow switching buffers without saving
set hidden

function! CSScomb()
  execute "silent !prettier-stylelint --quiet --write " . expand('%') | :e!
endfunction

if has('mouse')
  set mouse=a
endif

if has("autocmd")

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 80 characters.
    autocmd FileType text setlocal textwidth=80

    " Trim whitespace onsave
    autocmd BufWritePre * %s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

  au BufRead,BufNewFile *.ejs setfiletype html

  autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

  if executable('eslint')
    autocmd BufWritePost *.js,*,jsx,*.json eslint --fix %
  endif

  " autocmd BufWritePost *.css,*.less,*.scss,*.sass silent! :call CSScomb()<CR>

  " detect .md as markdown instead of modula-2
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " stop highlighting of underscores in markdown files
  autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"
endif " has("autocmd")

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "address,article,aside,audio,blockquote,canvas,dd,div,dl,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,hr,main,nav,noscript,ol,output,p,pre,section,table,tfoot,ul,li,video"
let g:html_indent_tags = '\|p\|nav\|li'

" tab stuff
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

set complete-=i

set nrformats-=octal

" Escape timeout
set ttimeout
set ttimeoutlen=100

" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8

" set encoding=utf-8
set fileencoding=utf-8

set magic " for regular expressions

" Make strings with - a keyword
setlocal iskeyword+=-

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" buffer settings
set hid " buffer becomes hidden when abandoned

" clipboard
set clipboard=unnamedplus

" Use Bash as shell
set shell=/usr/local/bin/bash

