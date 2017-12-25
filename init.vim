""Начало Внешний вид
"let $TERM='fbterm'

syntax enable
set shortmess+=I
set syntax=on "Включить подсветку синтаксиса
set laststatus=2 "Всегда показывать строку состояния
set number "Нумеровать строки
set numberwidth=4 "Ширина поля нумерации строк
set showmatch "Показывать первую парную скобку после ввода второй
set guifont=Monospace\ 10 "не работает
set showcmd
set splitbelow
set splitright

set ruler "Всегда показывать позицию курсора

set cmdheight=2
set guicursor=a:blinkon0


set t_Co=256
colors seoul256
set guioptions=""

"Поведение
set nocompatible "Отключить режим совместимости с классическим Vi
set nobackup "Не создавать резервных копий файлов
set noswapfile "Не использовать swap-файл

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

"Начало <Настройки отступов>
set expandtab "Пробелы вместо табуляции
set autoindent "Автоматические отступы
set smartindent "Умные отступы
set list "Включить подсветку табуляции и пробелов в конце строки
set listchars=tab:>.,trail:. "Установить символы которыми будет осуществляться подсветка

autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType python set tabstop=4|set shiftwidth=4
autocmd BufWritePost *.py call Flake8()
autocmd FileType python map <buffer> <C-S> :call Flake8()<CR>

au BufNewFile *.py 0r ~/.config/nvim/templ/py.skel

autocmd FileType * 
      \ match Error /\%161v.\+/

autocmd FileType cpp 
      \ match Error /\%81v.\+/
"Конец

"Начало <Настройки поиска>
set nohlsearch "Подсветка результатов поиска
set incsearch "Поиск фрагмента текста во время набора
"set ignorecase "Игнорировать регистр символов при поиске
"Конец

"Начало <Раскладка>
set keymap=russian-jcukenwin 
set iminsert=0 " по умолчанию - латинская раскладка
set imsearch=0 " по умолчанию - латинская раскладка при поиске

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F5> :Autoformat<CR>
nmap <silent> <F6> :NextColorScheme<CR>
nmap <silent> <F7> :PrevColorScheme<CR>

if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif

set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ [%{&fenc}]\ [%{&enc}]

"Начало <Инициализация Pathogen>
filetype off
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on
"Конец <Инициализация Pathogen>

let g:SuperTabDefaultCompletionType = "context"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

let g:syntastic_cpp_compiler = "g++"

"let g:pymode_rope_completion = 0
" let g:pymode_rope_goto_definition_bind = "<C-]>"
"let g:pymode_doc_bind = "<C-S-d>"
"let g:pymode_python = 'python3'
"let g:pymode_folding = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_lint_checkers = ['pylint', 'pylama', 'pep8']
"let g:pymode_run = 1
"let g:pymode_run_bind = "<F29>"


let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0

let g:virtualenv = $VIRTUAL_ENV
let g:deoplete#omni_patterns = {}
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#complete_method = "omnifunc"
let g:deoplete#max_list = 40

let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1

let flake8_error_marker='EE' " set error marker to 'EE' 
let flake8_warning_marker='WW' " set warning marker to 'WW' 
"flake8_pyflake_marker='' " disable PyFlakes warnings 
"flake8_complexity_marker='' " disable McCabe complexity warnings 
"flake8_naming_marker='' " disable naming warnings

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

"set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set cursorline!
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

map <F3>  :call TRANSLATE()<cr>

function TRANSLATE()
   let  a=getline('.')
   let co=col('.')-1
   let starts=strridx(a," ",co)
   let ends = stridx(a," ",co)
   if ends==-1
       let ends=strlen(a)
   endif
   let res = strpart(a,starts+1,ends-starts)
   let cmds = "sdcv -n " . res
   let out = system(cmds)
   echo out
endfunction

set pdev=Virtual_PDF_Printer
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long
set printencoding=koi8-r


let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
