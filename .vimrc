"""""""""

"
" vundle
"
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

"
" original repo
"
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'

"
" another repo
"
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'vim-ruby/vim-ruby'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'

"
" basic setting
"
colorscheme desert
syntax on
filetype plugin indent on

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set number
set ruler
set title
set background=dark
set nobackup
set noswapfile

"
" show invisible character
"
set list
set listchars=eol:$,tab:>\ ,extends:<
"
" beep
"
set visualbell
"
" add multibyte in text option
"
set formatoptions=lmoq 
"
" enable delete former line by backspace
"
set backspace=2
"
" not to stop line top and end
"
set whichwrap=b,s,h,l,<,>,[,]

"" status line
" show current vim mode
set showmode

"" show encoding and EOF
if winwidth(0) >= 120
	set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%F%=[%{GetB()}]\ %l,%c%V%8P
else
	set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%f%=[%{GetB()}]\ %l,%c%V%8P
endif


function! GetB()
	let c = matchstr(getline('.'), '.', col('.') - 1)
	let c = iconv(c, &enc, &fenc)
	return String2Hex(c)
endfunction


" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
	let n = a:nr
	let r = ""
	while n
		let r = '0123456789ABCDEF'[n % 16] . r
		let n = n / 16
	endwhile
	return r
endfunc

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
	let out = ''
	let ix = 0
	while ix < strlen(a:str)
		let out = out . Nr2Hex(char2nr(a:str[ix]))
	let ix = ix + 1
	endwhile
	return out
endfunc

"" search
" when use small letter ignore case
set ignorecase
set smartcase
" indent setting
set smartindent
" highlight searchword
set hlsearch
" when search end return top
set wrapscan
" inc search
set incsearch
" hide highlight seachword
" nmap <esc><esc> ;nohlsearch<CR><esc>


" split right or below
set splitright
set splitbelow
" tab setting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
" clipboard use in OS
set clipboard+=unnamed
" esc key map
imap <C-g> <esc>
vmap <C-g> <esc>


"set filetype
autocmd BufNewFile,BufRead *.wsgi set filetype=python
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
autocmd BufNewFile,BufRead *.go set filetype=go

" Enable omni completion.
autocmd FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType javascript:compiler gjslint
autocmd QuickfixCmdPost make copen


augroup MyXML
autocmd!
autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END


""
" Ruby
" extra space
let ruby_space_errors=1

""
" PHP
" sql syntax in string
let php_sql_query=1
" html syntax in string
let php_htmlInStrings=1
" ban short tag
let php_noShortTags=1


"""
" plugins
"
""

""
" neocomplecache
"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use auto select
"let g:neocomplcache_enable_auto_select = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 0


" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\'default' : '',
\ 'java' : $HOME.'/.vim/dict/java.dict',
\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
\ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
\ 'css' : $HOME.'/.vim/dict/css.dict',
\ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
\ 'perl' : $HOME.'/.vim/dict/perl.dict',
\ 'php' : $HOME.'/.vim/dict/php.dict',
\ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
\ 'python' : $HOME.'/.vim/dict/python.dict',
\ 'vim' : $HOME.'/.vim/dict/vim.dict'
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"let g:neocomplcache_snippets_dir = $HOME.'/snippets'


"" 
" unite.vim


let g:unite_enable_start_insert=1
nnoremap <C-u> :<C-u>Unite buffer file_mru file_rec<CR>

"mru,reg,buf
"noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
"noremap :ur :<C-u>Unite register -buffer-name=register<CR>
"noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
"noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
"noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>
