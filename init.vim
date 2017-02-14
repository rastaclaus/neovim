""Начало Внешний вид
let $TERM='fbterm'

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


"set t_Co=256
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

let g:ycm_auto_trigger = 0
let g:pymode_rope_completion = 0
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
" let g:ycm_cache_omnifunc = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <Tab>  deoplete#mappings#manual_complete()
let g:syntastic_cpp_compiler = "g++"


set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set cursorline!
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
