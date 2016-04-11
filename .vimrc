" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

""""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tComment'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""VIM CONFIG""""""""""""""""""""
" 自动语法高亮
syntax on

" 主题配置
colorscheme desert

" 状态栏配置
set laststatus=2

" 行号和标尺
set nu
set ruler

" 设置tab键为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab 
set expandtab

" 缩进
set autoindent
set smartindent

" 设置匹配模式，如括号等
set showmatch

" 自动切换当前目录为当前文件所在的目录
set autochdir 

" 设置为nocompatible模式
set nocompatible

" 输入搜索内容时就显示搜索结果
set incsearch
 "搜索时高亮显示被找到的文本
set hlsearch 

" 取消备份
set nobackup
set noswapfile

" 代码折叠方式
set foldmethod=marker

" 自动重新读入
set autoread

" 允许使用鼠标
set mouse=a

" 状态栏显示目前所执行的指令
set showcmd

""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""
" airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'

" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
