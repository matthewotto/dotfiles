syntax on
filetype plugin indent on
colorscheme vibrantink
set bg=dark

if has("win32")
    set backupdir=c:\temp
    set guifont=Consolas:h10:cANSI
endif

if has("gui_macvim")
    if &background == "dark"
        hi normal guibg=black
        set transp=8
    endif
    if (has('gui_running'))
        set guifont=Consolas:h13.0:cANSI
    endif
endif

if (has('gui_running'))
  set guioptions-=T
  set columns=120
  set lines=55
  set number
endif


set go-=T
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>ra :!rake
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

