" Fixes syntax highlight for Ruby files
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Fake '|' as text object
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Fake '/' as text object
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,

" Enable spellcheck when needed
autocmd FileType gitcommit setlocal spell textwidth=72
autocmd BufRead,BufNewFile {*.md,*.mkd} setlocal spell
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript
