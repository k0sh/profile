" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Nasyrov Renat <renatn@gmail.com>
" Last Change:	2006 June 21
" Revision #4: Support for new "Underline" group. Removed superfluous html
"			   formatting.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "renat"
hi Normal		ctermfg=white	ctermbg=darkBlue  guifg=white 	guibg=darkBlue
hi NonText		ctermfg=lightMagenta
hi comment		ctermfg=gray	guifg=lightBlue
hi constant		ctermfg=red  	guifg=red
hi identifier		ctermfg=gray	guifg=lightCyan
hi statement		ctermfg=yellow	guifg=yellow gui=bold

hi preproc		ctermfg=magenta guifg=magenta
hi type			ctermfg=yellow  guifg=yellow
hi special		ctermfg=yellow	guifg=yellow

hi CursorLine		ctermbg=lightGray 	guifg=black 	guibg=lightGray
hi String		ctermfg=green 		guifg=green
hi Character		ctermfg=green		guifg=green
hi Tag			ctermfg=black		guifg=black
hi Function		cterm=underline 	ctermfg=white  guifg=#ffffff

hi ShowMarksHLl guifg=red guibg=green
hi ShowMarksHLl ctermfg=red ctermbg=green

hi Underlined	ctermfg=cyan	guifg=cyan
hi Underlined	cterm=underline

hi ErrorMsg		ctermfg=white ctermbg=red	guifg=lightRed
hi WarningMsg	ctermfg=cyan		guifg=lightYellow
hi ModeMsg		ctermfg=yellow		guifg=yellow
hi MoreMsg		ctermfg=yellow		guifg	=yellow
hi Error		ctermfg=white ctermbg=red		guifg=red

hi Todo			ctermfg=black	ctermbg=darkYellow	guifg=darkYellow
hi Cursor		ctermfg=black	ctermbg=white		guifg=black
hi Search		ctermfg=black	ctermbg=darkYellow
hi IncSearch		ctermfg=black	ctermbg=darkYellow
hi LineNr		guifg=pink	guibg=DarkCyan
hi LineNr		ctermfg=black ctermbg=darkCyan 	cterm=none

hi StatusLineNC	ctermfg=black  ctermbg=blue	guifg=black	guibg=blue
hi StatusLine	ctermfg=cyan   ctermbg=blue

hi label		ctermfg=yellow
hi Operator		ctermfg=brown	guifg=brown gui=bold
hi clear Visual
hi Visual		term=reverse	ctermfg=black	ctermbg=darkCyan
hi Visual		guifg=black	guibg=darkCyan

hi DiffChange	guibg=darkGreen		guifg=black
hi DiffChange	ctermbg=darkGreen	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black
hi DiffText		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		guibg=slateblue		guifg=black
hi DiffAdd		ctermbg=blue		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black
hi DiffDelete	ctermbg=cyan		ctermfg=black

hi Folded		guibg=orange		guifg=black
hi Folded		ctermbg=yellow		ctermfg=black
hi FoldColumn	guibg=gray30		guifg=black
hi FoldColumn	ctermbg=gray		ctermfg=black
hi cIf0			guifg=gray			ctermfg=gray

hi SpellBad	cterm=underline		ctermfg=red 	ctermbg=darkBlue
