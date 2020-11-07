" Configurations for NeoVim
" Author: Luis David Villalobos

" Configurations
set number
set relativenumber
set modifiable

" Variables
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:plugins_folder = '~/.config/nvim/plugged'
let g:tex_flavor = 'latex'

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

call plug#end()

" Theme
set t_Co=256
set t_ut=
colorscheme codedark

" Recomended Configurations for coc.vim
:runtime! ~/config/nvim/coc_config.vim

