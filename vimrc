filetype on
filetype plugin indent on
syntax on

set exrc
set secure
set hidden

set termguicolors

""" Good searching
set ignorecase
	set smartcase
set hlsearch
" clear search hl
map <C-_> :noh<CR>

""" testing
set clipboard=unnamedplus

""" GUI settings
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

""" Display line numbers
set number
set relativenumber

""" vim-plug section
call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'chase/vim-ansible-yaml'
Plug 'davidhalter/jedi-vim'
Plug 'hpointu/chillax-du-relzen'
Plug 'janko-m/vim-test'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'python-mode/python-mode'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'stephpy/vim-yaml'
Plug 'suan/vim-instant-markdown'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'rfunix/vim-greenisgood'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Gummybears'
Plug 'w0rp/ale'
call plug#end()


""" Slime comfiguration
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "slime", "target_pane": ":"}

""" Use rainbows !
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
set foldlevelstart=3
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""" Use f5 to reload
set autoread
map <F5> :checktime<CR>

""" make background work with tmux
set term=xterm-256color
set t_ut=

""" Highlight trailing spaces
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufReadPre * match ExtraWhitespace /\s\+$/

""" A bit of theming
set background=dark
let g:gruvbox_improved_strings=0
let g:gruvbox_contrast_dark = 'hard'

colorscheme chillax_du_relzen

""" Todo command
" command TODO Ggrep! "TODO" | copen

""" hdevtools
""" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>

""" configure jedi
let g:jedi#use_tabs_not_buffers = 0

""" Few fzf stuff
nnoremap <C-p> :FZF<CR>
nnoremap <Space>bb :Buffers<CR>

nnoremap <Space>/ :Ack 
nnoremap <Space>gs :Gstatus<CR>

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

""" Do not fold everything on startup
set foldlevelstart=3

""" Tag bar
nmap <F8> :TagbarToggle<CR>

""" Syntastic check
nmap <F7> :Errors<CR>

""" Nerd tree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.pyc$[[file]]']

""" fzf default command
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

""" Moving around buffers
map <C-l> :bnext<CR>
map <C-h> :bprev<CR>

map <S-M-Right> :tabnext<CR>
map <S-M-Left> :tabprev<CR>

" """ Syntastic settings (default suggested)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

""" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

""" Integrate smartodds gitlab
let g:fugitive_gitlab_domains = ['http://gitlab.smartodds.co.uk']

let g:syntastic_always_populate_loc_list = 1


""" python-mode stuff from Michał
let g:pymode_syntax = 0
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = ",e"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = ",d"
let g:pymode_python = 'python'
let g:pymode_lint = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']  " No mccabe which is crap (but not really)

" let g:pymode_options_max_line_length = 80         " Set the max line length to 100 for PEP8 checks but it's actually 80
" let g:pymode_folding = 0      " don't fold

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let test#strategy = 'asyncrun'

""" Nice column
" let &colorcolumn=join(range(79, 9999), ",")
" hi ColorColumn ctermbg=235

" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()
" 	" Overwrite settings.
" 	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
" 	imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
" endfunction
"
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
