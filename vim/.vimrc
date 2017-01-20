set laststatus=2

autocmd vimenter * NERDTree

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
# Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

set number

call plug#end()
