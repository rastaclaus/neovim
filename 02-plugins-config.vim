"YCM
let g:ycm_global_ycm_extra_conf = '/home/artems/.config/nvim/ycm_extra_conf.py'

"neomake
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


" fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }