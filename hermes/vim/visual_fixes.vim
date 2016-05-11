highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

let g:NeatStatusLine_color_normal = 'guifg=#ffffff guibg=#a2c01e gui=bold ctermfg=17 ctermbg=10 cterm=bold'
let g:NeatStatusLine_color_visual = 'guifg=#ffffff guibg=#f09c2f gui=bold ctermfg=15 ctermbg=208 cterm=bold'
let g:NeatStatusLine_color_insert = 'guifg=#ffffff guibg=#ff0000 gui=bold ctermfg=15 ctermbg=23 cterm=bold'
let g:NeatStatusLine_color_filetype='guifg=#000000 guibg=#00ffff gui=bold ctermfg=15 ctermbg=23 cterm=bold'
let g:NeatStatusLine_separator = ''

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set t_Co=256 " Force 256 colors

" " in case t_Co alone doesn't work, add this as well:
" " i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set enc=utf-8
let $TERM='screen-256color'
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
colorscheme molokai
" " Prevent Vim from clobbering the scrollback buffer. See
" " http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set timeout " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" Makes foo-bar considered one word
set iskeyword+=-

" Highlight current line and column
set cul
set cuc

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
