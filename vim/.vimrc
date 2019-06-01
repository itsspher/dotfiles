" set leader key to ,
let mapleader=","

" install plugin manager for vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim plugins

call plug#begin('~/.vim/plugged')

Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dylanaraps/wal.vim'

call plug#end()

" enable some vim-pandoc modules
let g:pandoc#modules#enabled=["command"]

" turn on line numbers
set relativenumber

" Luke Smith's guide navigation
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Markdown macros
let g:vim_markdown_folding_disabled = 1
let g:goyo_width = 120
let g:vim_markdown_frontmatter = 1
autocmd BufRead,BufNewFile *.md :SoftPencil
autocmd BufRead,BufNewFile *.md :Goyo
autocmd Filetype markdown,rmd inoremap ,m <Enter>$$<Enter><Enter>$$<Enter><Enter><++><Esc>kkkA
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,g {}{<++>} <++><Esc>11hci{
autocmd Filetype markdown,rmd inoremap ,$ $$ <++><Esc>5hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>) <++><Esc>11hi

