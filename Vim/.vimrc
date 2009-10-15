syntax on
filetype plugin indent on
colorscheme vibrantink
if (has('gui_running'))
  set guifont=Consolas:h13.0
  set guioptions-=T
  set columns=120
  set lines=55
  set number
endif
set go-=T
set bg=dark
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>ra :!rake<CR>
