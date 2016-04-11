""""""""""""""""""""""SYS CONFIG""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" ���ò˵�����
set langmenu=zh_cn

" =====================
" �����Ի���
"    Ĭ��Ϊ UTF-8 ����
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8

    if has('win32')
        language english
        let &termencoding=&encoding
    endif

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " ��ʹ�� Unicode ǩ��

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

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
Plugin 'L9'
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tComment'
Plugin 'scrooloose/syntastic'
Plugin 'snipMate'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'
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
" �Զ��﷨����
syntax on
syntax enable

" ����tab��Ϊ4���ո�
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab 
set expandtab

" ����
set autoindent
set smartindent

" ����ƥ��ģʽ�������ŵ�
set showmatch

" �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set autochdir 

" ����Ϊnocompatibleģʽ
set nocompatible

" ����
set ignorecase
set incsearch " ������������ʱ����ʾ�������
set hlsearch  "����ʱ������ʾ���ҵ����ı�

" �����۵���ʽ
set foldmethod=marker

" �ļ��޸ĺ��Զ����¶���
set autoread

" ȡ������
set nobackup
set noswapfile

" ����ʹ�����
set mouse=a

" ��������
colorscheme desert

" �кźͱ��
set nu
set ruler
set tw=100

" ״̬������
set laststatus=2
set showcmd " ״̬����ʾĿǰ��ִ�е�ָ��

" �������
" set cursorline
" set cursorcolumn

" ���ز˵����͹�����
set guioptions-=m
set guioptions-=T


""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""
" airline

" ����consolas����"
set guifont=Consolas\ for\ Powerline\ FixedD:h10

"����״̬��������ʾ�����������˫����"
let g:Powerline_symbols="fancy"
let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80" 
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"

"���ö���tabline��������ʾ"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"


" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'

" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
