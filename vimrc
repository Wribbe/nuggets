set number
filetype plugin indent on
syntax on
set background=dark
colorscheme solarized
set clipboard=unnamed
set ts=2
set shiftwidth=0
set softtabstop=0
set hlsearch
nnoremap * *#

set clipboard^=unnamed,unnamedplus

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set spell
set noswapfile

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

inoremap <special> <F3> <c-r>=strftime('%F')<CR>
inoremap <special> <Leader><F3> -- <c-r>=strftime('%F')<CR> --
inoremap <special> <F4> (<c-r>=strftime('%R')<CR>)
inoremap <special> <Leader>N Note (<c-r>=strftime('%F')<CR> -- <esc>:read !whoami<CR> k$a<del><esc>$a):

noremap <special> <Leader>rr :syntax sync fromstart<CR>
inoremap <special> <Leader>rr <esc>:syntax sync fromstart<CR>i

set ignorecase

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
