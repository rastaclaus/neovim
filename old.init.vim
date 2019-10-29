""Начало Внешний вид
syntax enable
set shortmess+=I
set syntax=on "Включить подсветку синтаксиса
set laststatus=2 "Всегда показывать строку состояния
set number "Нумеровать строки
set numberwidth=4 "Ширина поля нумерации строк
set showmatch "Показывать первую парную скобку после ввода второй
set showcmd

set ruler "Всегда показывать позицию курсора

set cmdheight=2
set guicursor=a:blinkon0


set t_Co=256
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
set listchars=tab:->,trail:- "Установить символы которыми будет осуществляться подсветка

let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'

let g:formatdef_my_yaml = '"prettier --parser=yaml"'
let g:formatters_yaml = ['my_yaml']

autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType python set tabstop=4|set shiftwidth=4

filetype plugin on
autocmd BufNewFile,BufRead *.tsx set filetype=javascript
autocmd BufNewFile,BufRead *.ts set filetype=javascript

augroup javascript
    au!
    au FileType javascript setlocal foldmethod=syntax
"   au FileType javascript setlocal noexpandtab
augroup END

"Начало <Настройки поиска>
set nohlsearch "Подсветка результатов поиска
set incsearch "Поиск фрагмента текста во время набора
"Конец

"Начало <Раскладка>
set keymap=russian-jcukenwin
set iminsert=0 " по умолчанию - латинская раскладка
set imsearch=0 " по умолчанию - латинская раскладка при поиске

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F5> :Autoformat<CR>
nmap <silent> <F6> :hi Normal guibg=None ctermbg=None<CR>
nmap <silent> <F7> :hi Normal ctermbg=235 guibg=None<CR>

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

if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set cursorline!
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

set pdev=Virtual_PDF_Printer
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long
set printencoding=utf-8

function! MyOnBattery()
  if !empty(glob("/sys/class/power_supply/ACAD"))
    return readfile('/sys/class/power_supply/ACAD/online') == ['0']
  endif
endfunction
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nrw', 1000)
endif

let g:neomake_python_pylint_exe = g:python3_host_prog
let g:neomake_python_pylint_args = ['-m',
      \'pylint',
      \'-f',
      \'text',
      \'--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
      \'-r',
      \'n' ]

let g:neomake_python_enabled_makers = ['pylint']
let g:ycm_global_ycm_extra_conf = '/home/artems/.config/nvim/bundle/YouCompleteMe/.ycm_extra_conf.py'
set background=dark
colors deus
