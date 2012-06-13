set autoindent
set backupdir=/temp/vimbackup
set directory=/temp/vimbackup
set list
set number
set shiftwidth=2
syntax enable
set background=dark
colorscheme solarized

set nocompatible
filetype off

set rtp+=/home/kyoshida/.vim/vundle.git/
call vundle#rc()
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

filetype indent plugin on

