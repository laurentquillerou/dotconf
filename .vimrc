" pathogen
execute pathogen#infect()

" turns on "detection", "plugin" and "indent"
filetype plugin indent on

" vim not vi
set nocompatible

" disable visualbell
set vb t_vb=
set visualbell

" line number
set number

" cursor location
set ruler

" highlight columns over 80
au BufWinEnter * let w:m1=matchadd('Error', '\%>120v.\+', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>160v.\+', -1)

" higlight search
set hlsearch

" ignore case on search
set ignorecase

" ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" reload a file when it is changed from the outside
set autoread

" write the file when we leave the buffer
set autowrite

" disable backup
set nobackup

" disable swapfiles
set noswapfile

" width of tab character
set tabstop=2

" amount of white space to be added
set softtabstop=2

" amount of whitespace to add in normal mode
set shiftwidth=2

" uses space instead of tabs
set expandtab

" intelligent backspace; :set bs=2
set backspace=indent,eol,start

" show current mode
set showmode

" show command being executed
set showcmd

" Provide nice menu when completion happen
set wildmenu

" Set basic indenting (i.e. copy the indentation of the previous line)
set autoindent

" Enables syntax highlighting
syntax on

" Associate Jenkinsfile with groovy syntax
au BufNewFile,BufRead Jenkinsfile setf groovy

" title
set title

" color theme
"" colorscheme industry
colorscheme cobalt2

" enable 24bit true color
set termguicolors

" Showmatcah
set showmatch

" show trailing whitespace
match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
