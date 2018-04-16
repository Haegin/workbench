" set this first (avoid use of -N for vi compatibility)
set nocompatible

" change the leader
let mapleader=","
let g:mapleader=","

" #### Requirements
" for ctags setup see http://tinyurl.com/3lcrsrh
" now using http://docs.ctags.io (install with)
"   brew tap universal-ctags/universal-ctags
"   brew install --HEAD universal-ctags

" #### Plugins (https://github.com/junegunn/vim-plug)
let g:ascii = [
      \ '        __',
      \ '.--.--.|__|.--------.',
      \ '|  |  ||  ||        |',
      \ ' \___/ |__||__|__|__|',
      \ ''
      \]
let g:startify_custom_header =
      \ 'map(g:ascii + startify#fortune#quote(), "\"   \".v:val")'

call plug#begin('~/.vim/plugged')
  " core
  Plug 'rking/ag.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-unimpaired'
  Plug 'itchyny/lightline.vim'

  " extras
  Plug 'airblade/vim-gitgutter'
  Plug 'godlygeek/tabular'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  Plug 'mhinz/vim-startify'

  " tmux
  Plug 'sagotsky/vim-turbux'            " shortcuts for tslime testing (fork with minitest support)
  Plug 'jgdavey/tslime.vim'             " launch commands in tmux windows
  Plug 'christoomey/vim-tmux-navigator' " navigation across splits & panes

  " syntax
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
  Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
call plug#end()




" #### Shortcuts

" mapping fixes
map <Esc>[Z <S-Tab>
map <Esc>[24~ <F12>

map <leader>w :w!<cr>
map <leader>e :new <C-R>=expand("%:p:h")<cr><cr>
map <leader>rn :w ! %<cr>
map <leader>ev :sp ~/.vimrc<cr>
map <leader>sv :so ~/.vimrc<cr>
map <leader>cd :lcd %:h<cr>
map <leader>M :! mate %<cr>

" re-tag project with ctags
map <leader>ct :!echo 'retagging ctags...'; ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --languages=-javascript,sql; mv .git/tags.$$ .git/tags<cr><cr>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" use :w!! to save with sudo
cmap w!! w !sudo tee % >/dev/null

" grep project folder for word
nnoremap F :grep! "\b<C-R><C-W>\b"<cr>:cw<cr>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<cr>
" format paragraphs to textwidth
nnoremap <leader>q gqip

" quick fix window nav
nmap <C-n> :cn<cr>
nmap <C-p> :cp<cr>

" buffers
nmap <Tab> :bp<cr>
nmap <S-Tab> :bn<cr>
nnoremap <leader><leader> :b#<cr>
nmap <leader>d :bd<cr>
nmap <leader>D :bufdo bd<cr>
nnoremap <leader>b :Buffer<cr>

" delete to the black hole with X or XX
nmap X "_d
nmap XX "_dd
vmap X "_d

" use leader to interact with the system clipboard on y(ank), c(opy), x(elete)
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P
nnoremap <Leader>y :y*<cr>
nnoremap <Leader>c ^"*c$
nnoremap <Leader>x ^"*d$
vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>x "*d

" fzf shortcuts
nnoremap <leader>m :Marks<cr>
nnoremap <leader>s :Snippets<cr>
nnoremap <leader>g :BCommits<cr>

" jump between two files with backspace
nnoremap <bs> <c-^>

" function keys
map <F2> :sp ~/Documents/system/notes/vim help.md<cr>
map <F3> :sp ~/Documents/system/notes/todos.md<cr>
map <F4> :sp ~/Documents/system/notes/scratch.md<cr>
map <F5> :sp ~/Documents/system/notes/secrets.enc.md<cr>
" F6 formats and tidy up
noremap <F6> mmgg=G'm
inoremap <silent> <F6> <Esc> mmgg=G'mi
" alphabetize sorts inner css
nmap <F7> :g#\({\n\)\@<=#.,/}/sort<cr>
" F8 spell checks
map <F8> :setlocal spell! spelllang=en<cr>

" ruby/rails shortcuts
" convert hash rockets, visually select hash first, or on a single line
map <leader>ch :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
" convert string hash (with rockets) to symbols
map <leader>sh :s/[\"']\(.*\)[\"']\s*=>/\1:/g<cr>
" run spec
map <leader>rs :<C-U>!bundle exec rspec <c-r>=expand("%:p") <cr> -c -l <c-r>=line(".") <cr><cr>

" turn OFF evil arrow keys
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>

" #### Editing

" load matchit (use % to jump)
filetype plugin indent on
runtime macros/matchit.vim

" appearance
set t_Co=256                      " 256 color scheme
syntax on                         " turn on syntax highlighting
" colorscheme mirodark
" colorscheme molokai

" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
" colorscheme jellybeans
colorscheme iceberg

set textwidth=80                  " set textwidth
set fo-=t
set colorcolumn=+1                " show vertical break at textwidth
set number                        " show line numbers
set ruler                         " show cursor position
set title                         " set the terminal's title
set visualbell                    " visual flash
set noerrorbells                  " no beeping please
set laststatus=2                  " always show a status bar
set cursorline                    " only use cursorline for current window
set cpoptions+=$                  " show $ to indicate editing range

" speedy scrolling
syntax sync minlines=100
set nocursorcolumn
set norelativenumber
set ttyfast
set ttyscroll=3
set lazyredraw
set regexpengine=1                " issue with ruby syntax highlighting (use older RE engine)

" general
set encoding=utf-8
set history=200                       " remember all the things
set backspace=indent,eol,start        " intuitive backspacing
set hidden                            " handle multiple buffers better
set wildmode=list:longest             " complete files like a shell
set splitbelow                        " open vertical splits below
set splitright                        " open horizontal splits on the right
set cm=blowfish2                      " encryption mode (http://tuxdiary.com/2015/01/13/encrypt-files-with-vim/)
set complete=.,w,b,kspell,k           " complete on current, windows, buffers and dictionary

" dictionary locations
set dictionary+=~/.vim/spell/en.utf-8.add
set dictionary+=/usr/share/dict/words
set spellfile=~/.vim/spell/en.utf-8.add

" searching
set ignorecase                    " case-insensitive searching
set smartcase                     " but case-sensitive if expression contains a capital letter
set showmatch
set incsearch                     " highlight matches as you type
set tags+=.git/tags               " include tags from here
set hlsearch                      " highlight matches

" use Ag instead of grep (the silver searcher)
set grepprg=ag\ --nogroup\ --nocolor\ --hidden

" scrolling
set nowrap                        " turn on line wrapping
set scrolloff=3                   " show 3 lines of context around the cursor
set sidescroll=1                  " scroll horizontally without jumping http://tinyurl.com/zs3ntow

" backups
set backup                        " save backups
set backupdir=$HOME/.vim/tmp      " keep backup files in one location
set noswapfile                    " don't use swp files

" indenting, tabs and folds
set autoindent                    " autoindent on
set copyindent                    " copy the previous indentation on autoindenting
set smartindent
set softtabstop=2                 " soft tabs, ie. number of spaces for tab
set tabstop=2                     " global tab width
set shiftwidth=2                  " and again, related
set expandtab                     " use spaces instead of tabs
set smarttab                      " insert tabs on the start of a line according to shiftwidth, not
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set foldmethod=syntax
set foldcolumn=4
set nofoldenable

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" easier movement in vim command line
cnoremap <C-a>  <Home>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" double enter smart opens links/files (:help gx)
map <ENTER><ENTER> gx

" #### Plugin Shortcuts

" start a global search
map <C-F> :Ag --hidden<space>

" change CtrlP shortcut
" let g:ctrlp_map = '<space>'
map <space> :FZF<cr>

" tabularize
nmap <leader>a> :Tabularize /=><cr>
vmap <leader>a> :Tabularize /=><cr>
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :Tabularize /:\zs<cr>

" commentary
nmap <leader>c gcc
vmap <leader>c gc

" save and run in Tmux
map <leader>r :w\|:call SendToTmux("\"".expand('%:p%h')."\"\n")<cr>

" ulti-snips
map <leader>U :UltiSnipsEdit<cr>

" fugitive
map <leader>gg :Gpull<cr>
map <leader>gc :Gcommit<space>
map <leader>gp :Gpush<cr>
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>ge :Gedit<cr>
map <leader>gl :Glog -250<cr><cr>:copen<cr><cr>
map <leader>gL :Glog -250 --<cr><cr>:copen<cr><cr>

" vimdiff apply (local/remote) and move to next hunk
nmap <leader>dl :diffget LOCAL<cr>]c
nmap <leader>dr :diffget RE<cr>]c

" #### Plugin Settings

" ag
let g:ag_working_path_mode="r"

" git gutter
set updatetime=500
" working with hunks (blocks of changes)
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

" gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_post_private = 1 " always private to begin with

" turbux (minitest for unit tests)
let g:turbux_command_prefix = 'bundle exec'

" ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " super fast py ext
let g:ctrlp_max_height = 10      " window height
let g:ctrlp_follow_symlinks = 1  " do follow symlinks
let g:ctrlp_use_caching = 0      " so fast we dont need to cache
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'] " respects git ignore

" lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
\ }


" UltiSnips triggers
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]



" #### Functions

" lightline bar components
function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:p') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" insert tab if line is all whitespace, or fire autocomplete
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
    else
      return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" toggle markdown todo items
function! ToggleTodo()
  let saved_cursor = getpos('.')
  let current_line = getline('.')

  if (current_line =~ '- \[\s*\]')
    execute 's/- \[\s*\]/- [X]/g'
  else
    execute 's/- \[X\]/- [ ]/g'
  endif
  call setpos('.', saved_cursor)
endfunction

" execute a macro on multiple (visually selected) lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<cr>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" open a split for each dirty file in git
function! OpenChangedFiles()
  only " close windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

" #### Autocommands
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json', 'go', 'php']

  au WinEnter,FocusGained * setlocal cursorline
  au WinLeave,FocusLost   * setlocal nocursorline

  au BufRead,BufNewFile *.as   set ft=actionscript
  au BufRead,BufNewFile *.mxml set ft=mxml
  au BufNewFile,BufRead *.json set ft=javascript
  au BufNewFile,BufRead *.god  set ft=ruby
  au BufNewFile,BufRead {*.md,*.markdown} set ft=markdown
  au BufNewFile,BufRead /private/etc/apache2/*.conf* set ft=apache
  au BufRead,BufNewFile {Capfile,Gemfile,Appraisals,Rakefile,Thorfile,bluepill.pill,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

  autocmd BufNewFile,BufRead {*_test.rb} let g:turbux_test_type='minitest'
  autocmd BufNewFile,BufRead {*_spec.rb} let g:turbux_test_type='rspec'

  if has('unix')
    " toggle todo lists in markdown with Ctrl+Space
    autocmd Filetype markdown map <silent><buffer> <C-@> :call ToggleTodo()<cr>
  endif

  " spellcheck highlights
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=5 term=underline cterm=underline

  " auto strip whitespace when saving
  au BufWritePre * :%s/\s\+$//e
  " auto spell check & limit width of git commit messages
  au Filetype gitcommit setlocal spell textwidth=72
  " turn off backups and swap on encrypted files
  au BufRead *.enc.* setlocal nobackup noswapfile nowritebackup

  " auto chmod +x any shebang file, inspired from tpope/vim-eunuch
  au BufNewFile  * let b:brand_new_file = 1
  au BufWritePre *
    \ if exists('b:brand_new_file') |
    \   if getline(1) =~ '^#!' |
    \     let b:chmod_post = '+x' |
    \   endif |
    \ endif
  au BufWritePost,FileWritePost * nested
    \ if exists('b:chmod_post') && executable('chmod') |
    \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
    \   edit |
    \   unlet b:chmod_post |
    \ endif
endif

" #### Ignores
set wildignore+=*.o,*.obj,*/.hg/*,*/.svn/*,*.so,*/.git
set wildignore+=**/vendor/rails/**,**/vendor/bundle/**,**/tmp/**
