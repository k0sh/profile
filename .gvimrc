set viminfo='20,\"50	" read/write a .viminfo file, don't store more
 
" Show line numbers
set nu

set autochdir
	
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   " :tag and the like use :cstag
   " set cscopetag
   " first search cscope, than tags file
   set cscopetagorder=0 
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

function! New_Header_C_File()
	let filename=substitute(toupper(expand("%:t")), '[^A-Z]', '_', 'g')
	execute "normal i"."#ifndef ".filename."\<cr>"."#define ".filename."\<cr>\<cr>\<cr>"."#endif"."\<esc>0kk"
	set nomodified
endfunction


" Setup GUI
set guifont=Terminus\ 13
set guioptions-=T
set guioptions-=m
colorscheme ivim
set cmdheight=2

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
map <silent> <C-w> :close<CR>
imap <silent> <C-w> <Esc>:close<CR>

" Save action
map <silent> <C-s> :w<CR>
imap <silent> <C-s> <Esc>:w<CR>


" Abbreviations
abb cfor for (i=0; i<0; i++) {
abb cif if (1 == 1) {
abb cwh while (1) {
abb csw switch (1) {case 1:<CR>break;<CR>default:<CR>break;<CR>
abb cprn printf("\n");
abb cerr fprintf(stderr, "%s\n", "Error");

" Taglist
highlight MyTagListTagName ctermfg=black ctermbg=green
highlight MyTagListTagScope ctermfg=DarkRed ctermbg=LightGray
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 30

" Buf Exlporer
let g:bufExplorerSplitBelow = 1
let g:bufExplorerSplitRight = 1
let g:bufExplorerSplitVertical = 1
let g:bufExplorerUseCurrentWindow = 1

"File Expoler
let g:netrw_browse_split = 3
let g:netrw_hide = 1
"Hide some files
let g:explHideFiles = '^\.,*\.sw[po]$'
let g:explDetailedHelp = 0

"For Python
let python_highlight_all = 1
let python_highlight_exceptions = 0
let python_highlight_builtins = 0

"For C
let g:c_space_errors = 1

