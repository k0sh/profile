syntax on

set nocompatible " Use Vim defaults (much better!)
set bs=2         " allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set title
" set clipboard=unnamed

set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp

" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" autocmd BufAdd,BufNewFile * nested tab sball
autocmd BufNewFile *.h call New_Header_C_File()

" For C files update tags after save
autocmd BufWritePost *.c,*.h silent !ctags -a -f .tags <afile>

" Python support indent
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

"au InsertEnter * hi StatusLine term=reverse ctermbg=black
"au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=black

if !exists("g:auChKeymapLoaded")
    augroup ChKeymap
        autocmd!
        autocmd InsertEnter * set keymap=russian-jcukenwin | set iminsert=0
        autocmd InsertLeave * set keymap="
    augroup END
endif

let g:auChKeymapLoaded=1


"   По умолчанию проверка орфографии выключена.
setlocal spell spelllang=
setlocal nospell

function ChangeSpellLang()
if &spelllang =~ "en_us"
    setlocal spell spelllang=ru
    echo "spelllang: ru"
elseif &spelllang =~ "ru"
    setlocal spell spelllang=
    setlocal nospell
    echo "spelllang: off"
else
    setlocal spell spelllang=en_us,ru
    echo "spelllang: en,ru"
endif
endfunc

" map spell on/off for English/Russian
map \ss <Esc>:call ChangeSpellLang()<CR>   

filetype on
filetype plugin on

set wildmenu		" Show menu choice when tab completion
set ignorecase		" When search ignore case
set smartcase
set completeopt-=preview

set statusline=%t\ %y%m%r%w%h\ %l/%L(%p%%)%([%{Tlist_Get_Tagname_By_Line()}]%)
set laststatus=2
set nocursorline

" Russian keymap		
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" For C devel
autocmd Filetype c set omnifunc=ccomplete#Complete
set cindent		" C format indent
set tags=./.tags,./tags,~/.vim/kerneltags

" For Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
set tags+=$HOME/.vim/tags/python.ctags

" Always visible n rows
set t_Co=256
set scrolloff=8
set sidescrolloff=8

set smarttab
set smartindent
set tabstop=8
"set softtabstop=4
"set shiftwidth=4

set cmdheight=2
colorscheme ivim

" Function definition
map <F1> [i
imap <F1> <Esc>[i

" Open Tag in new split
map <S-F1> <c-w>]
imap <S-F1> <Esc><c-w>]

" Save		
"inoremap <F2> <Esc>:w<CR>
"nnoremap <F2> :w<CR>

" Selection
inoremap <F3> <Esc>lv
inoremap <S-F3> <Esc><S-v>
nnoremap <F3> v
nnoremap <S-F3> <S-v>

" Close window
"map <silent> <F4> :close<CR>
"imap <silent> <F4> <Esc>:close<CR>

" Close buffer
"map <silent> <C-F4> :bd<CR>
"imap <silent> <C-F4> <Esc>:bd<CR>

" Error broswer
map <F5> :cclose<CR>
map <F6> :cope<CR>
map <F7> :cp<CR>
map <F8> :cn<CR>

" Make key
imap <F9> <Esc>:wa<CR>:make<CR>
nmap <F9> :wa<CR>:make<CR>
imap <C-F9> <Esc>:wa<CR>:make<Space>clean<CR>:make<CR>
nmap <C-F9> :wa<CR>:make<Space>clean<CR>:make<CR>

" Exit
map! <F10> <Esc>:qa<CR>
nnoremap <silent> <C-F10> :q!<CR>

" Buffer next
map <silent> <F11> :VSBufExplorer<CR>
imap <silent> <F11> <Esc>:VSBufExplorer<CR>

"File Expolore
map <silent> <S-F11> :Vexplore!<CR>
imap <silent> <S-F11> <Esc>:Vexplore!<CR>

" Hi 
imap <S-F12> <Esc>:set<Space>hls!<CR>
nmap <S-F12> :set<Space>hls!<CR>

" Code browser
nnoremap <silent> <F12> :TlistToggle<CR> :ShowMarksToggle<CR>

noremap  <Caps> :let &iminsert = ! &iminsert<CR>
inoremap <Caps> <C-^>
noremap! <Caps> <C-^>

" Clipboard
vmap <C-Insert> "+y
nmap <S-Insert> "+P
imap <S-Insert> <C-o><S-Insert>
vmap <C-c> "*y
imap <C-v> <C-o>"*P

" PgUp/PgDown normal work
nmap <PageUp> 	<C-S-U><C-S-U>
nmap <PageDown> <C-S-D><C-S-D>
imap <PageUp> 	<C-O><C-S-U><C-O><C-S-U>
imap <PageDown> <C-O><C-S-D><C-O><C-S-D>

" Navigate
map g<Left>	:pop<cr>
map g<Right>	:<C-]>

" Comment selected code as //
map cc v:s!^!//!g <CR><CR>
map cx v:s!^\s*//!!g <CR>v=<CR>

" Exit and Close 
map <C-q> :qa<CR>
map <silent> <C-w> :bd<CR>
imap <silent> <C-w> <Esc>:bd<CR>

" Save action
map <silent> <C-s> :w<CR>
imap <silent> <C-s> <Esc>:w<CR>

