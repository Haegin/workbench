" set this first (avoid use of -N for vi compatibility)
set nocompatible

" use pathogen
call pathogen#infect('pathogen')

" load matchit (use % to jump)
runtime macros/matchit.vim

" comma for map leader
let mapleader = ","
let g:mapleader = ","

" textwidth and format options
set textwidth=80
set fo-=t

" 256 color scheme
set t_Co=256
if &t_Co >= 256 || has("gui_running")
  colorscheme jellybeans
  " colorscheme ir_black
  " colorscheme Tomorrow-Night
  " colorscheme Tomorrow-Night-Eighties
endif

syntax on                         " turn on syntax highlighting
filetype plugin indent on         " turn on file type detection

set encoding=utf-8                " encoding
set showcmd                       " display incomplete commands
set showmode                      " display the mode you're in
set history=10000                 " remember more commands/searches

set backspace=indent,eol,start    " intuitive backspacing

set hidden                        " handle multiple buffers better
set wildmode=list:longest         " complete files like a shell

set ignorecase                    " case-insensitive searching
set smartcase                     " but case-sensitive if expression contains a capital letter

set cursorline                    " highlight the current line
set number                        " show line numbers
set ruler                         " show cursor position

set showmatch
set incsearch                     " highlight matches as you type
set hlsearch                      " highlight matches

set autoindent                    " always set autoindenting on
set copyindent                    " copy the previous indentation on autoindenting

set nowrap                        " turn on line wrapping
set scrolloff=3                   " show 3 lines of context around the cursor

set title                         " set the terminal's title
set visualbell                    " visual flash
set noerrorbells                  " no beeping please

set backup                        " save backups
set backupdir=$HOME/.vim/tmp      " keep backup files in one location
set noswapfile                    " don't use swp files

set softtabstop=2                 " soft tabs, ie. number of spaces for tab
set tabstop=2                     " global tab width
set shiftwidth=2                  " and again, related
set expandtab                     " use spaces instead of tabs
set smarttab                      " insert tabs on the start of a line according to shiftwidth, not
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set grepprg=ag                    " use Ag instead of grep (the silver searcher)
set ttyfast                       " for speed and better rendering
set splitbelow                    " open horizontal splits on the right
set splitright                    " open vertical splits below

" ctags are maintained/refreshed using this technique with git
" http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
set tags=./tags,tags

" status line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P
set statusline+=\ %{fugitive#statusline()}

" folding
set foldmethod=syntax
set foldcolumn=4
set nofoldenable

" turbux
let g:turbux_command_prefix = 'bundle exec'
let g:turbux_command_rspec = 'spec'

" ctrlp
let g:ctrlp_max_height = 20      " window height
let g:ctrlp_follow_symlinks = 1  " do follow symlinks
let g:ctrlp_lazy_update = 1      " update after 250ms

" gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" zencoding (HTML) expand with <c-y>,
let g:user_zen_settings = { 'erb' : { 'extends' : 'html' }}

" tabularize
if exists(":Tabularize")
  nmap <leader>a> :Tabularize /=><CR>
  vmap <leader>a> :Tabularize /=><CR>
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
endif

" Ctrl+t opens ctrlp.vim
nmap <silent> <C-t> :CtrlP<CR>

" Ctrl+c or ,c toggles commenting
nmap <leader>c \\\
vmap <leader>c \\\

" Ctrl+f opens global search
map <C-F> :Ag<Space>

" F3 alphabetize sorts inner css
nmap <F3> :g#\({\n\)\@<=#.,/}/sort<CR>

" F5 formats and tidy up
map <silent> <F5> mmgg=G'm
imap <silent> <F5> <Esc> mmgg=G'm

" F7 spell checks
map <F7> :setlocal spell! spelllang=en<CR>

" convert hashes to new style
map <leader>ch :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" format paragraph including set textwidth
nnoremap <leader>q gqip

" other shortcuts
map <leader>w :w!<cr>
map <leader>v :sp ~/.vimrc<cr>
map <leader>u :source ~/.vimrc<cr>
map <leader>e :Explore<cr>
map <leader>ev :new <C-R>=expand("%:p:h") . '/'<cr><cr>
map <leader>m :! mate %<cr>

" buffers
nnoremap <tab> :bn<cr>
nnoremap <S-tab> :bp<cr>
nmap <leader>d :bd<cr>
nmap <leader>D :bufdo bd<cr>

" search result browsing
nnoremap <C-k> :cn<cr>
nnoremap <C-j> :cp<cr>
nnoremap <C-o> :copen<cr>

" save and run in shell
map <leader>rn :w ! %<CR>

" save and run with ruby
map <leader>rr :w ! ruby<CR>

" rails plugin shortcuts
map <leader>ra :A<CR>
map <leader>fr :.Rake<CR> " focused Rake
map <leader>rf :1R<Space>
map <leader>rg :Rgenerate migration<Space>
map <leader>rm :Rmodel<CR>
map <leader>rv :Rview<CR>
map <leader>rc :Rcontroller<CR>
map <leader>ru :RVunittest<CR>
map <leader>rt :RVfunctionaltest<CR>
map <leader>rs :<C-U>!bundle exec spec <c-r>=expand("%:p") <CR> -c -l <c-r>=line(".") <CR> <CR>
map <leader>sr :<C-U>!bundle exec script/runner %<CR>

" fugitive plugin shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gg :Ggrep<Space>
map <leader>ge :Gedit<cr>
map <leader>gl :Glog -250<cr><cr>:copen<cr><cr>
map <leader>gL :Glog -250 --<cr><cr>:copen<cr><cr>
map <leader>gc :Gcommit

" turn OFF arrow keys
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>

" custom syntax highlighting
au BufRead,BufNewFile *.as    set filetype=actionscript
au BufRead,BufNewFile *.mxml  set filetype=mxml
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,bluepill.pill,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" auto strip whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" auto spell check & limit width of git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" copy and paste with pbcopy/pbpaste in visual mode
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-V> :call setreg("\"",system("pbpaste"))<CR>p

" rename a file
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

" ignores
set wildignore+=*.o,*.obj,**/vendor/apache-ant-1.8.2/**
set wildignore+=**/vendor/rails/**,**/vendor/bundle/**,**/tmp/cache/**,**/public/destinations/**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,tags
