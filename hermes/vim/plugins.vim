"Ctrlp configuration
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/.git/*,*/.jhw-cache/*,*/solr/data/*,*/node_modules/*,*/.DS_Store
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']

" Only cache if we're over this number of files.
let g:ctrlp_use_caching = 2000

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" See discussion at: https://github.com/thoughtbot/dotfiles/commit/f854c8d8ef08ab0f80639e0219f9800f0246fb90
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore node_modules
      \ --ignore "**/*.pyc"
      \ -g ""'
  
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" NERDTree customization
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=0
let g:NERDTreeChDirMode=2
