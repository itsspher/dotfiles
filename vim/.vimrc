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
let g:pandoc#modules#enabled=["formatting", "command", "folding", "bibliographies", "completion"]

" turn on line numbers
set relativenumber
set number

" Luke Smith's guide navigation
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Markdown macros
let g:goyo_width = 120
let g:vim_markdown_frontmatter = 1
let g:pandoc#biblio#sources = "bcgy"
let g:pandoc#completion#bib#use_preview = 1
autocmd BufRead,BufNewFile *.md :SoftPencil
autocmd BufRead,BufNewFile *.md :Goyo
autocmd Filetype markdown,rmd inoremap ,m <Enter>\begin{align*}<Enter><Enter>\end{align*}<Enter><Enter><++><Esc>kkkA
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,g {}{<++>}<++><Esc>10hci{
autocmd Filetype markdown,rmd inoremap ,$ $$<++><Esc>4hi
autocmd Filetype markdown,rmd inoremap ,i \begin{figure}<Enter><Tab>\centering<Enter><Tab>\includegraphics[width=0.5\textwidth]{}<Enter><Backspace>\caption{<++>}<Enter><Backspace>\end{figure}<Esc>2k0f}i

" Castel's spellcheck macro
autocmd Filetype markdown,rmd setlocal spell
autocmd Filetype markdown,rmd set spelllang=en_us
autocmd Filetype markdown,rmd inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Erik Falor's type a command and this will execute it macro
noremap Q !!sh<CR>
