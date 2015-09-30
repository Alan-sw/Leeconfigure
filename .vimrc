set nocompatible 
filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
Bundle 'a.vim'
Bundle 'The-NERD-Commenter'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdtree'
"Bundle 'fholgado/minibufexpl.vim'
Bundle "scrooloose/syntastic"
Bundle "davidhalter/jedi"
"Bundle "c.vim"

filetype plugin indent on
Bundle 'Valloric/YouCompleteMe'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'majutsushi/tagbar'
Bundle 'easymotion/vim-easymotion'
Bundle 'jiangmiao/auto-pairs'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'kshenoy/vim-signature'


filetype plugin on


" 定义快捷键的前缀，即<Leader>
let mapleader=";"

"use 256 color
set t_Co=256
"use theme
colorscheme Tomorrow-Night-Bright


"vim itself setting
"禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
"show partial commands in the last line of the screen
set showcmd
set showmode
"enable use of the mouse for all modes
set mouse=a
"backspace to the uppper line
:set backspace=2



"vi man page
source $VIMRUNTIME/ftplugin/man.vim
cmap man Man
nmap K :Man <cword><CR>


"to the end of line
inoremap <leader>e <esc>A




"end of vim own setting


"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_y='%{strftime("%T")}'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9



"indent line
let g:indentLine_color_gui = '#A4E57E'

"a.vim
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>


" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
set completeopt=longest,menu
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
"回车选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" 跳转到定义处
nnoremap <leader>ja :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd  :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jf  :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>  "force recomile with synatastic
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"test
"let g:ycm_auto_start_csharp_server = 1

"NERD tree
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


"synatastic
let g:syntastic_ignore_files=[".*\.py$"]
let g:syntastic_cpp_compiler_options = ' -std=c++11'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"multiple cursors
"let g:multi_cursor_use_default_mapping=0
"default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"tagbar
nmap <F8> :TagbarToggle<CR>

"easymotion
map <Leader> <Plug>(easymotion-prefix)

"gundo tree
nnoremap <Leader>ud :GundoToggle<CR>
