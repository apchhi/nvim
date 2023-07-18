""" HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2
au FileType html nnoremap <leader>hsv :syntax sync fromstart<CR>

""" CSS
autocmd FileType css setlocal shiftwidth=2 tabstop=2

""" PHP
autocmd FileType php setlocal shiftwidth=4 tabstop=4
set omnifunc=phpcomplete#CompletePHP
let g:UltiSnipsSnippetDirectories=["UltiSnips", "php"]

""" JavaScript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

""" Python
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\n\+\%$//e
autocmd BufWritePre *.py :%s/\(^\n\|\n\s*\n\)\zs\s\+/ /ge
autocmd BufWritePre *.py :%s/\v[\t ]+$//e
autocmd BufWritePre *.py :normal mzgg=G`z

""""""""""""""""""
""" language locale
set encoding=utf-8
set termencoding=utf-8
set langmenu=en_US.UTF-8

""" Отключение языков в polyglot
let g:polyglot_disabled = ['ada', 'cpp', 'cs', 'cuda', 'd', 'dart', 'erlang', 'fsharp', 'go', 'haskell', 'java', 'julia', 'kotlin', 'matlab', 'perl', 'c', 'go', 'lua', 'r', 'rust', 'scala', 'swift', 'CoffeeScript', 'LESS', 'Elixir', 'Elm', 'GraphQL', 'Handlebars', 'Markdown', 'Ruby', 'ERB', 'Slim', 'TOML', 'Vimscript', 'YAML']


""" plugin list
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'arnaud-lb/php-namespace'
Plug 'pangloos/vim-javascript'
Plug 'vim-syntastuc/syntastic'
Plug 'SirVer/ultisnips'
Plug 'majutsu-no-tori/tbone.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround' "Расширенные возможности со скобки, кавычи, теги HTML/XML
Plug 'junegunn/fzf.vim' "Интерфейс поиск файлов и строк в файлах
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Автодополнение и функции IDE
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'sheerun/vim-polyglot' "Улучшенная поддержка для языков программирования
Plug 'airblade/vim-gitgutter' "Подсветка изменений в git
Plug 'preservim/nerdtree' "Древовидное представление ФС
Plug 'dense-analysis/ale' "Автопроверка ошибок
Plug 'tpope/vim-commentary'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tc50cal/vim-terminal'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/tagbar'

call plug#end()


""" basic settings
set number "Номера строк
set cursorline "Выделение текущей строки
set hlsearch "Подсветка результатов поиска
set incsearch "Поиск в режиме набора
set ignorecase "Не учитывать регистр в поиске
set smartcase "При заглавной букве поик станет регистрочувствителен
set tabstop=2 "Размер табуляции
set shiftwidth=2 "Размер отступа
set expandtab "Использование пробелов вместо табуляций
set autoindent "Автовыравнивание кода при создании новой строки
set splitbelow "Новые окна создаются внизу
set splitright "Новые окна создаются справа
set backupdir=~/.nvim/backups "Каталог для резервных копий
set directory=~/.nvim/swapfiles "Каталог для временных файлов
set autoread "Автоперезагрузка файла при его изменении другим процессом
set relativenumber "Положение курсора относительно строки
set smarttab "По разному интерпретировал TAB
set softtabstop=4 "
set mouse=a "
set scrolloff=7

""" settings plugins

"""vim-surround
augroup surround
  autocmd!
  autocmd FileType ruby,svelte,javascript let b:surround_{char2nr('{')} = "{{ \r }}"
  autocmd FileType ruby,svelte,javascript let b:surround_{char2nr('[')} = "[{ \r }]"
  autocmd FileType ruby,svelte,javascript let b:surround_{char2nr('(')} = "({ \r })"
  autocmd FileType ruby,svelte,javascript let b:surround_{char2nr('"')} = "\"\" \r \"\""
  autocmd FileType ruby,svelte,javascript let b:surround_{char2nr("'")} = "'' \r ''"
augroup END

"""fzf.vim
set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <c-p> :Files<cr>
nnoremap <leader><space> :Buffers<cr>

""" coc.nvim
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ coc#expandableOrJumpable() ?
	\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
	\ : "\<Tab>"
" GoTo code navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-type-references)
" navigation diagnostic
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent><leader>c :CocCommand<CR>
nnoremap <silent>K :call CocAction('doHover')<CR>
nnoremap <silent><C-space> :call CocActionAsync('snippetNext')<CR>
inoremap <silent><expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
set completeopt=menuone,noinsert,noselect "Опции автодополнения
autocmd FileType javascript setl omnifunc=v:lua.vim.lsp.omnifunc "Установка omnifunc для JavaScript
autocmd FileType python setl omnifunc=v:lua.vim.lsp.omnifunc "Установка omnifunc для Python
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP "Установка omnifunc для PHP

""" Nerdtree
let NERDTreeWinSize=25 "Ширина окна NERDTree
let NERDTreeMinimalUI=1 "Минимальный интерфейс NERDTree
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'

""" vim-gitgutter
highlight GitGutterAdd guifg=#b8bb26 ctermfg=71 gui=NONE cterm=NONE
highlight GitGutterChange guifg=#fabd2f ctermfg=209 gui=NONE cterm=NONE
highlight GitGutterDelete guifg=#fd4934 ctermfg=203 gui=NONE cterm=NONE

""" vim-polyglot
let g:polyglot_disabled = ['autoindent'] "Отключение автодоступа для vim-polyglot
let g:ruby_indent_align_args = 0 "Отключение выравнивания в Ruby

"""YCM
set nocompatible
filetype plugin on
syntax enable
set rtp+=~/.config/nvim/plugged/YouCompleteMe

""" Функции
function! ToggleLineNumbers()
if(&number == 1)
set nonumber
else
set number
endif
endfunction

function! ShowWhiteSpace()
if(&list == 1)
set nolist
else
set list listchars=tab:▸\ ,trail:·
endif
endfunction

""" Определение группы команд, связанных с LSP
augroup lsp
autocmd!
autocmd FileType php lua require('lspconfig').intelephense.setup{}
"other settings for languages
augroup END

""" Маппинг
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>i :set ignorecase!<CR>
nnoremap <leader>I :set smartcase!<CR>
nnoremap <leader>L :call ToggleLineNumbers()<CR>
nnoremap <leader>E :call ShowWhiteSpace()<CR>
nnoremap <F8> :TagbarToggle<CR>

"""Отключение t в режиме вставки
inoremap <expr><ESC>t comple#close('<C-e>')."<C-w><C-p>"

""" Подсветка синатксиса
syntax on

""" Цветовая схема
colorscheme gruvbox

""" Интепретируем модуль completeopt
set completeopt-=preview

""" Indent filetype 
filetype indent plugin on

""" Автоперенос слов a new string
"set linebreak
"set columns=100
"set nowrap

""" Copy bump member
vmap <C-C> "+y

























































