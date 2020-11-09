" Configurations for Neovim
" Author: Luis David Villalobos González

" Configurations
set number
set relativenumber
set modifiable

" Variables
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:plugins_folder = '~/.config/nvim/plugged'
let g:tex_flavor = 'latex'

" Move Lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Plugins
call plug#begin(g:plugins_folder)

Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Theme Code Dark
set t_Co=256
set t_ut=
colorscheme codedark

" Recomended Config for coc.vim
runtime! ./config/coc_config.vim
" Recomended Config for markdown-preview.nvim
runtime! ./config/markdown-preview-config.vim

