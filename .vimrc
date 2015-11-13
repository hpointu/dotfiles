execute pathogen#infect()
syntax on
filetype plugin indent on

""" Good seraching
set ignorecase
set smartcase

""" testing
set clipboard=unnamedplus

""" Display line numbers
set number

""" Slime comfiguration
let g:slime_target = "tmux"
"let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
"let g:slime_default_config = {"socket_name": "slime", "target_pane": ":"}

""" Use f5 to reload
set autoread
map <F5> :checktime<CR>

""" make background work with tmux
set term=xterm-256color
set t_ut=

""" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufReadPre * match ExtraWhitespace /\s\+$/

""" A bit of theming
set hidden
set background=dark
colorscheme gruvbox

""" Todo command
command TODO Ggrep! "TODO"

""" hdevtools
""" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>

""" configure jedi
let g:jedi#use_tabs_not_buffers = 0

""" Unite mapping
nnoremap <C-p> :Unite -start-insert file_rec buffer<cr>
nnoremap <space>/ :Unite grep:.<cr>

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

""" Do not fold everything on startup
set foldlevelstart=3

""" Tag bar
nmap <F8> :TagbarToggle<CR>

""" Nerd tree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.pyc$[[file]]']

""" Moving around buffers
map <M-Right> :bnext<CR>
map <Esc>l :bnext<CR>
map <M-Left> :bprev<CR>
map <Esc>h :bprev<CR>

map <S-M-Right> :tabnext<CR>
map <S-M-Left> :tabprev<CR>

""" Syntastic settings (default suggested)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""" Integrate smartodds gitlab
let g:fugitive_gitlab_domains = ['http://gitlab.smartodds.co.uk']
