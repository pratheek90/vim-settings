" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Or use vividchalk
let g:solarized_termcolors=256
let g:solarized_termtrans=1
"let g:solarized_degrade=1

colorscheme solarized

if has('gui_running')
	set background=light
	set guioptions=egmrt
else
	set background=dark
endif

"map leader to comma
let mapleader = ","

" Tab mappings.
"map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
"imap <Tab> <C-N>
"imap <S-Tab> <C-P>
"vmap <Tab> >gv
"vmap <S-Tab> <gv
"nmap <S-Tab> <C-W><C-W>
" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec


"NERDTree settings
let g:NERDTreeWinPos = "left"
map <leader>nf :NERDTreeFind<cr>
map <F2> :NERDTreeToggle<CR>
"map <Leader>n :NERDTreeToggle<CR>
" don't open nerdtree on directory opens
let NERDTreeHijackNetrw=0 

nmap <silent> <leader>n :silent :nohlsearch<CR>

" dbext settings
let g:dbext_default_type   = 'MYSQL'

"let g:dbext_default_use_sep_result_buffer = 1

let g:sql_type_default = 'mysql'


" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
" set list

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/bundle/thrift/syntax/thrift.vim

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" fuzzy finder
nmap <leader>f :FufFile<CR>  
nmap <leader>o :FufCoverageFile<CR>
nmap <leader>d :FufFileWithCurrentBufferDir<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>t :FufTaggedFile<CR>
noremap <leader>j :FufLine<CR>

hi CursorLine   cterm=NONE ctermbg=black guibg=#e4e4e4
hi CursorColumn cterm=NONE ctermbg=black guibg=#e4e4e4
nnoremap <leader>c :set cursorline! cursorcolumn!<CR>

" from http://zwiener.org/vimautocomplete.html
" complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" limit popup menu height
set pumheight=15
" supertab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
" disable autopopup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" show clang errors in the quickfix window
let g:clang_complete_copen = 1

