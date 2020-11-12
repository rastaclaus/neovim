Plug 'scrooloose/nerdtree'

"syntax
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'sbdchd/neoformat'

" apperance

Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rainglow/vim'

" behavior
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" editor
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
