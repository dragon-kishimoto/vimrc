"---------------------------------------
" vimの初期設定
"---------------------------------------
set nocompatible
set shortmess+=I
set number
set relativenumber
set cmdheight=1
set laststatus=2
"タブページを常に表示
"set showtabline=2
set mouse=a
"set textwidth=0
"set colorcolumn=110
set cursorline
"set list
"set listchars=eol:$
"set synmaxcol=100
set ambiwidth=double

"タブ文字の設定
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab
set clipboard+=unnamedplus

if has('gui_running')
  set guiheadroom=0
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  "gVimでもテキストベースのタブを使う
  set guioptions-=e
  "GUIダイアログを非表示
  set guioptions+=c
  "カーソルスタイル
  set guicursor=a:hor15
  set guifont=CamingoCode\ for\ Powerline\ Regular\ 11
  set columns=110
  set lines=25
endif
set nocompatible
set shortmess+=I
"set number
set cmdheight=1
set laststatus=2
"タブページを常に表示
set showtabline=2
set mouse=a
"set textwidth=0
"set colorcolumn=110
"set cursorline
"set synmaxcol=100
set ambiwidth=double

"タブ文字の設定
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab
set clipboard=unnamedplus

"---------------------------------------
" deinの設定
"---------------------------------------
let s:dein_dir = expand('~/vimrc/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_git_command = '!git clone https://github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute s:dein_git_command s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir = expand('~/vimrc/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"---------------------------------------
" pluginの設定
"---------------------------------------
let g:Powerline_font = 1
let g:Powerline_symbols = 'fancy'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" lightline
"let g:lightline = { 'colorscheme': 'molokai' }
"IndentLine
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2 let g:indentLine_char_line = ['|'] let g:indentLine_color_term = 117 syntastic let g:syntastic_python_checkers = ['pylint'] vim-jedi autocmd FileType python setlocal completeopt-=preview taglist set tags = tags
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_Show_One_File = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Exit_OnlyWindow = 1
"map <silent> <leader>l :TlistToggle<CR>

"---------------------------------------
"キーバインドの設定
"---------------------------------------
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
inoremap <silent> <ESC> <ESC>:call ImInActivate()<CR>
"inoremap <silent> jj <ESC>
noremap <silent> <A-s> :w<CR>
if has('nvim')
  cnoremap w!! w suda://%<CR> :e!<CR>
else
  cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
endif


"矢印キー無効
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
"inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python3 %
autocmd BufNewFile *.py 0r $HOME/.vim/templates/template.py
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/template.cpp

autocmd BufWritePost * :call AddExecmod()
function! AddExecmod()
  let line = getline(1)
  if strpart(line, 0, 2) == "#!"
    call system("chmod +x ". expand("%"))
  endif
endfunction


"---------------------------------------
" カスタムカラー
"---------------------------------------
set t_Co=256
colorscheme molokai
syntax on

" 背景透明
if has('gui_running')
  hi Visual guibg=#75715E guifg=#FFFFFF
  "hi Normal guibg=#006A6A guifg=#FFFFFF
  "hi Cursor guibg=#000000 
  "hi String guifg=#FFE600
else
  hi Visual ctermbg=244 ctermfg=16
  "背景を半透明にするときはコメント外す
  "hi Normal ctermbg=none ctermfg=none cterm=none
  hi LineNr ctermbg=none ctermfg=none cterm=none
  hi CursorLineNr ctermbg=234
  hi Statement cterm=none
  hi MatchParen ctermfg=255 ctermbg=208 cterm=bold

"  hi IndentGuidesOdd ctermbg=234
"  hi IndentGuidesEven ctermbg=236

  hi Conditional cterm=bold
  hi Constant cterm=bold
  hi Debug cterm=bold
  hi DiffText cterm=italic,bold
  hi Directory cterm=bold
  hi ErrorMsg cterm=bold
  hi Exception cterm=bold
  hi Keyword cterm=bold
  hi MatchParen cterm=bold
  hi PreCondit cterm=bold
  hi Repeat cterm=bold
  hi SpecialChar cterm=bold
  hi SpecialComment cterm=bold
  hi Statement cterm=bold
  hi Todo cterm=bold
  hi Underlined cterm=underline
  hi VertSplit cterm=bold
  hi WarningMsg cterm=bold
endif

