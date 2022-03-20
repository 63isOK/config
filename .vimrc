call plug#begin()
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'buoto/gotests-vim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'voldikss/vim-translator'
Plug 'francoiscabrol/ranger.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'dbakker/vim-projectroot'
Plug 'rhysd/accelerated-jk'

call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enable Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
" set number                      " Show line numbers
set rnu
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set history=500 	        	" Sets how many lines of history VIM has to remember
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set foldmethod=syntax
set foldlevelstart=99           "打开文件是默认不折叠代码
" set spell

noremap <silent> <Tab> :normal %<CR>
set cc=80

" Height of the command bar
set cmdheight=2

" Add a bit extra margin to the left
set foldcolumn=1

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" ColorScheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

" Avoid garbled characters in Chinese language windows OS
" let $LANG='en'
" set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
imap jj <esc>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
" noremap <Up> gk
" noremap <Down> gj
" noremap j gj
" noremap k gk

" 加速jk的移动,1次之后每次移动两行
" 超过一屏,用c-d/c-f来移动
let g:accelerated_jk_acceleration_table = [1,1]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
" let g:go_fmt_command = "goimports"
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = [
    \ "deadcode",
    \ "errcheck",
    \ "gosimple",
    \ "govet",
    \ "ineffassign",
    \ "staticcheck",
    \ "structcheck",
    \ "typecheck",
    \ "unused",
    \ "varcheck",
    \ "asciicheck",
    \ "bodyclose",
    \ "containedctx",
    \ "contextcheck",
    \ "cyclop",
    \ "decorder",
    \ "dogsled",
    \ "dupl",
    \ "durationcheck",
    \ "errname",
    \ "errorlint",
    \ "forbidigo",
    \ "forcetypeassert",
    \ "exportloopref",
    \ "funlen",
    \ "gochecknoglobals",
    \ "gochecknoinits",
    \ "gocognit",
    \ "goconst",
    \ "gocritic",
    \ "gocyclo",
    \ "godot",
    \ "godox",
    \ "gofmt",
    \ "gofumpt",
    \ "goerr113",
    \ "gomnd",
    \ "lll",
    \ "ireturn",
    \ "makezero",
    \ "misspell",
    \ "nakedret",
    \ "nilerr",
    \ "nilnil",
    \ "nlreturn",
    \ "noctx",
    \ "paralleltest",
    \ "prealloc",
    \ "predeclared",
    \ "revive",
    \ "tenv",
    \ "unconvert",
    \ "testpackage",
    \ "wrapcheck",
    \ "wsl",
    \ ]
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_metalinter_autosave = 0
" let g:go_auto_type_info = 1
set updatetime=30
let g:go_auto_sameids = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>



augroup go
  autocmd!

  " start spell
  autocmd FileType go setlocal spell spelllang=en_us,cjk

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au filetype go inoremap <buffer> . .<C-x><C-o>
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" vim-go debug
" \ 'stack':      'belowright 13new',
" \ 'goroutines': 'belowright 9new',
  let g:go_debug_windows = {
            \ 'vars':       'topleft vnew',
            \ 'stack':      'botright 13new',
            \ 'goroutines': 'botright 9new',
            \ 'out':        'botright 5new',
  \ }

let g:go_debug_preserve_layout = 1
let g:go_highlight_debug = 1

let g:go_debug_mappings = {
 \ '(go-debug-continue)':   {'key': '<F5>'},
 \ '(go-debug-print)':      {'key': '<F6>'},
 \ '(go-debug-breakpoint)': {'key': '<F9>'},
 \ '(go-debug-next)':       {'key': '<F10>'},
 \ '(go-debug-step)':       {'key': '<F11>'},
 \ '(go-debug-stepout)':    {'key': '<S-F11>'},
\ }

let g:go_debug_mappings = {
\ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
\ '(go-debug-stop)': {'key': 'q'},
\ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
\ '(go-debug-step)': {'key': 's'},
\ '(go-debug-print)': {'key': 'p'},
\ '(go-debug-breakpoint)': {'key': 'b'},
\ '(go-debug-stepout)': {'key': 'o'},
\ '(go-debug-restart)': {'key': 'r'},
\}

augroup vim-go-debug-self  
    autocmd!
    autocmd FileType go nmap <F9>  <Plug>(go-debug-breakpoint)
augroup END



""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

" nmap <C-k> <Plug>yankstack_substitute_older_paste
" nmap <C-j> <Plug>yankstack_substitute_newer_paste


" back to last post
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" leaderF
let g:Lf_ShortcutF='<C-p>'
noremap <F1> :Leaderf buffer --popup-width 150 <CR>
noremap <F2> :Leaderf function --popup-width 150 <CR>
noremap <F3> :Leaderf mru --popup-width 150 <CR>
noremap <F4> :Leaderf rg --popup-width 150 <CR>
noremap <Space><Space> :<C-u>ProjectRootExe Leaderf file --popup-width 150 <CR>
" noremap <F5> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
let g:Lf_CacheDirectory=expand('~/.vim/cache')
" let g:Lf_HideHelp=1
let g:Lf_WindowPosition = 'popup'
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
" set ambiwidth=double
let g:Lf_PreviewInPopup = 0




" disable arrow key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

 " auto save
au InsertLeave *.* write " 每次退出插入模式时自动保存      

" tagbar
" nmap <silent> <F7> :TagbarToggle<CR>
" let g:tagbar_autofocus = 1
" let g:tagbar_width = 40 "设置tagbar的宽度为30列，默认40
" " let g:tagbar_left = 1
" let g:tagbar_position = 'topleft vertical'
" " let g:tagbar_autopreview = 1

" nerdtree
" nmap <silent> <F6> :NERDTreeToggle<CR>
" let g:NERDTreeWinSize=40

"" Buffer nav
nnoremap <F11> :bp<CR>
nnoremap <F12> :bn<CR>

" clipboard
" vim + clipboard: pacman -S gvim

" nerdcommenter
nnoremap <leader><Space> :call NERDComment(0,"toggle")<CR>
vnoremap <leader><Space> :call nerdcommenter#Comment(0,"toggle")<CR>
let g:NERDSpaceDelims=1
let g:NERDCompatSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_spell=1
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
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#formatter = 'short_path'

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" auto-pairs
" let g:AutoPairsFlyMode = 1

" copilot
highlight CopilotSuggestion guifg=#555555 ctermfg=8

" highlightedyank
let g:highlightedyank_highlight_duration = 100

" go debug config
function MyDebug()
    let l:configFile = expand('%:h') . '/debug.json'
    if filereadable(l:configFile)
        let l:jsonConfig = readfile(l:configFile)
        let l:str = join(l:jsonConfig, '')
        let l:json = JSON#parse(l:str)
        let env= l:json['env']
        let arg= l:json['arg']
        let envKeys = keys(env)
        for envKey in envKeys
            exec 'let $' . envKey . '="' . env[envKey] . '"'
        endfor
        echo arg
        exec 'GoDebugStart . ' . arg
    else
        exec 'GoDebugStart'
        echo "no arg"
    endif
endfunction
command! -nargs=0 GDB call MyDebug()

" win max
let g:maximizer_set_mapping_with_bang = 1

execute "set <M-f>=\ef"
let g:maximizer_default_mapping_key = '<M-f>'

" vim-translator
let g:translator_default_engines = ['youdao', 'bing', 'haici']

" spell highlight
" hi clear SpellBad
hi clear SpellCap	
hi clear SpellRare	
hi clear SpellLocal	

" ranger
let g:ranger_replace_netrw = 1

" whichkey
nnoremap <silent> <leader> :WhichKey ','<CR>

