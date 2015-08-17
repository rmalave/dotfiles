" Sections:
"    -> Plugin Management
"    -> General
"    -> Writing Mode
"    -> VIM user interface
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Colors and Fonts
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.nvim/bundle')

" Make sure you use single quotes
Plug 'chriskempson/base16-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'JulesWang/css.vim'
Plug 'othree/html5.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'shawncplus/phpcomplete.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'Yggdroot/indentLine'
Plug 'kchmck/vim-coffee-script'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'kien/ctrlp.vim'
Plug 'hdima/python-syntax'
Plug 'ryanoasis/vim-webdevicons'
Plug 'godlygeek/csapprox'
Plug 'spolu/dwm.vim'
Plug 'rking/ag.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'itchyny/lightline.vim'
Plug 'benekastah/neomake'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/sql.vim--Stinson'
Plug 'gregsexton/MatchTag'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplcache.vim'
Plug 'vim-scripts/Eddie.vim'
Plug 'KurtPreston/vim-autoformat-rails'

" On-demand loading
Plug 'scrooloose/syntastic', {'on': 'SyntasticCheck' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"visualhtml
"let g:visualHtml#ftblacklist = ["markdown"]

"visualHtml#SetLive(b)
"visualHtml#ToggleLive()
"let g:visualHtml#live = 1
"let g:visualHtml#serverRoot = "/srv/http"
"let g:visualHtml#serverRootUrl = "http://localhost"
"let g:visualhtml#browser = "clcb"
"let g:visualhtml#clcb#exe = "/usr/bin/clcbrowser"
"let g:visualhtml#clcb#geometry = "683x741+683+0"

"let g:visualHtml#active = 1

"easytags
let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_always_enabled = 1

"vCoolor settings
let g:vcoolor_map = '<leader>r'

"Neomake settings
autocmd BufWritePost *.py,*.js Neomake

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

let g:neomake_python_flake8 = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_python_enabled_makers = ['flake8']


"Dispatch settings
autocmd FileType java let b:dispatch = 'javac %'

" indentLine plugin settings
let g:indentLine_color_term = 67
let g:indentLine_color_gui = '#8C9DA0' 
let g:indentLine_char = '┆'

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
  n
  e #
endif

syn on
" ultisnips settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-s>"
"let g:ultisnipsjumpforwardtrigger="<c-b>"
"let g:ultisnipsjumpbackwardtrigger="<c-z>"
" if you want :ultisnipsedit to split your window.
"let g:ultisnipseditsplit="vertical"

"singlecompile mappings
nmap <f7> :SCCompile<cr>
nmap <f8> :SCCompileRunAsync<cr>
nmap <f9> :SCViewResultAsync<cr>

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'myfugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? ' '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"end lightline

" ctrlp settings
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_working_path_mode = '1'
let g:ctrlp_user_command = 'ag %s -l --nocolor -i -g ""'
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

" do not save data
set nobackup
set noswapfile

" Set terminal title to vim
set title
"set no paste
set pastetoggle=<f10>

" vim multiple cursors plugin
let g:multi_cursor_use_default_mapping=0
" Default mapping
 let g:multi_cursor_next_key='<C-m>'
 let g:multi_cursor_prev_key='<C-p>'
 let g:multi_cursor_skip_key='<C-x>'
 let g:multi_cursor_quit_key='<Esc>'

"toggle NERDTree
map <C-i> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "left"
let g:NERDTreeQuitOnOpen=1

"" set color column 
"execute "set colorcolumn=" . join(range(81,335), ',')
"hi ColorColumn ctermbg=8


" Youcompleteme clang file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles,~/.vim/after,~/.vim/bundle

" Sets how many lines of history VIM has to remember
set history=700

""vim-plug is already taking care of these"
" Enable filetype plugins
filetype plugin on
filetype indent on
syntax on


" latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations

let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"preview html file in browser
nnoremap <leader>p :! open -a safari %<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable oble heavy omni completion.
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
"   endif
"   let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"   let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"   let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"   " For perlomni.vim setting.
"   " https://github.com/c9s/perlomni.vim
"   let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"   ')'
"   ')'mni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"identifiy the highlighling group of the thing under the cursor
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:AutoPairsShortcutJump = '<leader>n'

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=r
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


autocmd FileType python nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>

" Syntastic settings
let g:syntastic_python_python_exec='/usr/bin/python3.4'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_error_symbol=''
let g:syntastic_warning_symbol=''
let g:syntastic_quiet_messages = { "!level": "errors", "type": "style" }
hi SyntasticWarning ctermbg=0 ctermfg=yellow
hi SyntasticStyleError ctermbg=0 ctermfg=red
hi SyntasticStyleWarning ctermbg=27

" YCM settings
let g:ycm_show_diangnostics_ui=1
let g:ycm_error_symbol='x'
let g:ycm_warning_symbol='>>'
let g:ycm_enable_diagnostic_sign=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set undofile
set undodir=~/.vim/undo//
set undolevels=3000
set undoreload=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500
set number
set ai "Auto indent

set wrap "Wrap lines
set listchars=tab:\\ ,nbsp:☣,eol:¬,extends:❯,precedes:❮
set showbreak=↪\ 

" allow backspacing over autoindent, linebreaks, and start of insert
set bs=2 
" won't redraw while executing macros, registers, and commands that have not been typed (not default)
" for example, stops flickering when have up and down mapped to c-o gk and gj in insert
set lazyredraw  
" at least 5 lines show below and above cursor
set scrolloff=5
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" python
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 sm"arttab expandtab
" indent folding for python
" au BufEnter *.py set foldmethod=indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog='/usr/bin/python2.7'
"incsearch options
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

hi IncSearchCursor ctermfg=0 ctermbg=072
hi Search cterm=NONE ctermfg=white ctermbg=027

" Use vim-sneak as a minimal easymotion
let g:sneak#streak = 1


" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"do not show modes since lightline takes care of that
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
set noshowmode
hi SyntasticWarningSign ctermbg=0 ctermfg=yellow
hi SyntasticErrorSign ctermbg=0 ctermfg=red

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap r :normal vs<CR>


" Resap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vp doesn't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

let g:solarized_termtrans = 1
set background=light
set t_co=256

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

colorscheme solarized 

"highlight the current line and line number
set cursorline
hi CursorLineNR cterm=NONE ctermfg=79 ctermbg=NONE
hi CursorLine term=NONE cterm=NONE ctermbg=NONE
hi LineNr ctermbg=15

" Set extra options when running in GUI mode
if has("gui_running")
    colorscheme solarize 
    hi LineNr guibg=#2D3E4F
    set transparency=10
    set guioptions-=T
    set guioptions-=M
    set guioptions-=r
    set guioptions-=e
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Pomicons.otf:h14 
    set guitablabel=%M\ %t
    set background=light
    set guioptions=bold
    set guioptions=-L
endif


