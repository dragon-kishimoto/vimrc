"---------------------------------------
" vimの初期設定
"---------------------------------------
set shortmess+=I
set number
set relativenumber
set cmdheight=1
set laststatus=2
"タブページを常に表示
set showtabline=2
set mouse=a
set cursorline

"タブ文字の設定
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab
set clipboard+=unnamedplus

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

"---------------------------------------
"キーバインドの設定
"---------------------------------------
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
inoremap <silent> <ESC> <ESC>:call ImInActivate()<CR>
inoremap <silent> jj <ESC>
noremap <silent> <A-s> :w<CR>
cnoremap w!! w suda://%<CR> :e!<CR>

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
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python3 %
autocmd BufNewFile *.py 0r $HOME/vimrc/templates/template.py
autocmd BufNewFile *.cpp 0r $HOME/vimrc/templates/template.cpp
autocmd BufNewFile *.sh 0r $HOME/vimrc/templates/template.sh

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
hi Visual ctermbg=244 ctermfg=16
"背景を半透明にするときはコメント外す
"hi Normal ctermbg=none ctermfg=none cterm=none
hi LineNr ctermbg=none ctermfg=none cterm=none
hi CursorLineNr ctermbg=234
hi Statement cterm=none
hi MatchParen ctermfg=255 ctermbg=208 cterm=bold

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

