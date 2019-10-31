"  插件配置  "
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 文件浏览器  "
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos='left'
let g:NERDTreeSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeHidden=0
map <F2> :NERDTreeToggle<CR>
"这个是nerdtree插件相当于一个文件浏览器，我们在vim 编辑代码的界面下，直接按F2就可以在窗口右侧出现一个显示框，再按一下F2会关闭该窗口。默认是关闭该栏的。里面显示当前打开文件目录下的所有文件，并且有行号，且能够回到上一级目录，打开其他文件等等。

Plugin 'majutsushi/tagbar'
let g:tagbar_autopreview = 1
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_sort = 0
let g:tagbar_left = 1
let g:tagbar_width = 35
let g:tagbar_autofocus = 1
autocmd FileType c,cpp,h,hpp,cxx,cc,cxx nested :TagbarOpen
nmap <F3> :TagbarToggle<CR>
"tagbar插件是一个可以用于C/C++代码跳转的插件，前提是需要我们在Ubuntu中安装ctags，在某一工程中执行ctags -R，会在工程根目录下生成tags，将该tags加入到 .vimrc中(添加方法可以查看前面2.3中最后的配置代码段)。vim打开该工程下的任意文件，会自动在左边打开函数列表变量名等数据的窗口。

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
set t_Co=256
set encoding=utf-8
set langmenu=zh_CN.UTF-9
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>
"airline是一个非常良好的状态栏插件，按照如上的配置后我们可以使用Ctrl-M Ctrl-N Enter三个键进行tab窗口之间的跳转。
"我们可以在vim命令行执行 :vim  xxxx.cpp 或者 :tabeditxxx.cpp，会生成一个tab窗口(用前面的文件浏览插件打开其他文件时也会新建tab窗口)，我们用上面的三个键进行窗口之间的切换编辑。非常适合需要打开多个文件进行编辑查看的场景。

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
let mapleader="/"
"该插件是一个注释代码的插件。我们修改leader键为 "/"键，默认的是”\“,因为考虑注释都是这种斜杠。
"注释反注释某一行     /c<space> 
"切换注释模板/**/ //    /ca
"注释当前行                /cc
"注释掉某一整块代码只需要ctrl-v进入vim的Visual模式，然后执行上面的这些命令就可以了。

Plugin 'vim-scripts/EasyGrep'
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.so, *.pyc, *.bak"
"EasyGrep是一个字符串搜索工具，它本质上实用了vim里面的grep。其实用方法为：
"/vv or :Grep: \vv命令将在文件中搜索当前光标下的单词, :Grep word将搜索"word", 如果加叹号:Grep !word表示全词匹配的方式搜索, Grep也可以带参数, 比如:Grep -ir word, r表示递归目录. i表示不区分大小写.
"/vV : 全词匹配搜索, 同:Grep !word;
"/va : 与vv相似, 搜索结果append在上次搜索结果之后;
"/vA : 与vV相似, 搜索结果append在上次搜索结果之后;
"/vr or :Replace :替换;
"/vo or :GrepOptions: 打开选项菜单;

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"ctrlp插件是用于文件搜索的，在vim中执行 ctrl-P组合键后，就会生成一栏，我们直接输入自己所想找的文件名就会在当前工程下搜索所有的相关的文件，并全部列举出来，非常实用。

call vundle#end()            " required
filetype plugin indent on    " required
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

set nu
set nobackup
set cursorline
set autoindent
set ruler
syntax on
set tabstop=4
set showmatch

