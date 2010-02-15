set viminfo='20,\"50	" read/write a .viminfo file, don't store more

autocmd BufEnter *.html setfiletype htmldjango
 
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

function <SID>PythonGrep(tool)
  set lazyredraw
  " Close any existing cwindows.
  cclose
  let l:grepformat_save = &grepformat
  let l:grepprogram_save = &grepprg
  set grepformat&vim
  set grepformat&vim
  let &grepformat = '%f:%l:%m'
  if a:tool == "pylint"
    let &grepprg = 'pylint --output-format=parseable --reports=n'
  elseif a:tool == "pychecker"
    let &grepprg = 'pychecker --quiet -q'
  else
    echohl WarningMsg
    echo "PythonGrep Error: Unknown Tool"
    echohl none
  endif
  if &readonly == 0 | update | endif
  silent! grep! %
  let &grepformat = l:grepformat_save
  let &grepprg = l:grepprogram_save
  let l:mod_total = 0
  let l:win_count = 1
  " Determine correct window height
  windo let l:win_count = l:win_count + 1
  if l:win_count <= 2 | let l:win_count = 4 | endif
  windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
        \ execute 'resize +'.l:mod_total
  " Open cwindow
  execute 'belowright copen '.l:mod_total
  nnoremap <buffer> <silent> c :cclose<CR>
  set nolazyredraw
  redraw!
endfunction

if ( !hasmapto('<SID>PythonGrep(pylint)') && (maparg('<F3>') == '') )
  map <F3> :call <SID>PythonGrep('pylint')<CR>
  map! <F3> :call <SID>PythonGrep('pylint')<CR>
else
  if ( !has("gui_running") || has("win32") )
    echo "Python Pylint Error: No Key mapped.\n".
          \ "<F3> is taken and a replacement was not assigned."
  endif
endif

if ( !hasmapto('<SID>PythonGrep(pychecker)') && (maparg('<F4>') == '') )
  map <F4> :call <SID>PythonGrep('pychecker')<CR>
  map! <F4> :call <SID>PythonGrep('pychecker')<CR>
else
  if ( !has("gui_running") || has("win32") )
    echo "Python Pychecker Error: No Key mapped.\n".
          \ "<F4> is taken and a replacement was not assigned."
  endif
endif


" Setup GUI
set guifont=Terminus\ 13
set guioptions-=T
set guioptions-=m
colorscheme ivim
set cmdheight=2

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
let Tlist_Use_Right_Window = 1

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

