" /usr/share/vim/vimrc
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" syntax highlight
syntax on

" highlight current line by underline
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" alignment intelligent
set smartindent

" alignment auto
set autoindent

" space instead of tab
set expandtab

" auto indent with
set shiftwidth=4
" set textwidth=80

" tab width
set tabstop=4
set softtabstop=4

" show line number
"set number

" show in statusline
set laststatus=2
set statusline=%<%F%1*%m%*%r%y%=%b\ 0x%B\ \ [l,c]%l,%c%V\ %p%%
" history records
set history=50

" highlight when searching by characters
set hlsearch
set incsearch

" inline alternate
set gdefault

" encode
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

" color theme
colorscheme torte

" fonts
"set guifont=Menlo:h16:cANSI

" language
set langmenu=zn_CN.UTF-8
set helplang=cn

" mouse works
set mouse=a

"set c/c++ indent
"set cindent

"set c/c++ indent options
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

" if there's no this part, add it
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

" for command mode
" nmap <S-Tab> <<
" for insert mode
" imap <S-Tab> <Esc><<i

runtime vimrc_example.vim
" make matchit.vim work
au Filetype css,javascript
    \let b:match_words = &matchpairs
