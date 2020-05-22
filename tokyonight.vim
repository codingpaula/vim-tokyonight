" -----------------------------------------------------------------------------
"  File: tokyonight.vim
"  Description: colorscheme for vim, inspired by vscode theme tokyo night
"  Author: codingpaula <muna.takarya@gmail.com>
"  Source: https://github.com/codingpaula/vim-tokyonight
"  Last Modified: 19 May 2020
" -----------------------------------------------------------------------------
"
" Initialization: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = 'tokyonight'
let s:tokyonight_vim_version = "0.1.0"

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette Dictionary
let s:gb = {}

let s:gb.black        = ["#000000", 16]
let s:gb.darkgrey     = ["#444b6a", 239]
let s:gb.middlegrey   = ["#5a638c", 241]
let s:gb.middlegrey2  = ["#646e9c", 242]
let s:gb.lightpurple  = ["#bb9af7", 141]
let s:gb.middlepurple = ["#9d7cd8", 98]
let s:gb.purple       = ["#b267e6", 134]
let s:gb.lila         = ["#ba4c97", 168]
let s:gb.brightred    = ["#ff5370", 203]
let s:gb.lightred     = ["#f7768e", 210]
let s:gb.red          = ["#db4b4b", 167]
let s:gb.redorange    = ["#fc7b7b", 210]
let s:gb.orange       = ["#ff9e64", 209]
let s:gb.yelloworange = ["#e0af68", 179]
let s:gb.yellow       = ["#ffdb69", 221]
let s:gb.lightgreen   = ["#9ece6a", 149]
let s:gb.greenturkis  = ["#73daca", 115]
let s:gb.turkis       = ["#0db9d7", 38]
let s:gb.green        = ["#41a6b5", 73]
let s:gb.lightturkis  = ["#61bdf2", 81]
let s:gb.blue         = ["#7aa2f7", 111]
let s:gb.darkblue     = ["#6d91de", 68]
let s:gb.bluegrey     = ["#9abdf5", 117]
let s:gb.lightgrey    = ["#9aa5ce", 110]
let s:gb.lightblue    = ["#7dcfff", 117]
let s:gb.greyturkis   = ["#89ddff", 117]
let s:gb.lightgrey2   = ["#c0caf5", 153]
let s:gb.grey         = ["#4e5579", 60]
let s:gb.white        = ["#ffffff", 231]
let s:gb.dark_bg      = ["#1a1b26", 234]
let s:gb.dark_bg2     = ["#1e202e", 235]
let s:gb.grey_fg      = ["#a9b1d6", 146]

let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

let s:bg0 = s:gb.dark_bg
let s:bg1 = s:gb.dark_bg2
let s:fg1 = s:gb.grey_fg

" Functions:
function! s:HL(group, fg, ...)
  " arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'ctermfg=' . fg[1], 'guifg=' . fg[0],
        \ 'ctermbg=' . bg[1], 'guibg=' . bg[0],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

set background=dark

" Groups:
call s:HL('TokyoOrange', s:gb.orange)
call s:HL('TokyoLightGreen', s:gb.lightgreen)
call s:HL('TokyoLightRed', s:gb.lightred)
call s:HL('TokyoLightPurple', s:gb.lightpurple)
call s:HL('TokyoMiddlePurple', s:gb.middlepurple)
call s:HL('TokyoLila', s:gb.lila)
call s:HL('TokyoRedOrange', s:gb.redorange)
call s:HL('TokyoYellowOrange', s:gb.yelloworange)
call s:HL('TokyoGreenTurkis', s:gb.greenturkis)
call s:HL('TokyoTurkis', s:gb.turkis)
call s:HL('TokyoBlue', s:gb.blue)
call s:HL('TokyoBlueGrey', s:gb.bluegrey)
call s:HL('TokyoLightGrey', s:gb.lightgrey)
call s:HL('TokyoLightBlue', s:gb.lightblue)
call s:HL('TokyoGreyTurkis', s:gb.greyturkis)
call s:HL('TokyoLighterGrey', s:gb.lightgrey2)
call s:HL('TokyoYellow', s:gb.yellow)

" -------------------
"  Editor Settings
" -------------------
call s:HL('Normal', s:fg1, s:bg0)

if version >= 700
  call s:HL('CursorLine', s:none, s:bg1)
  hi! link CursorColumn CursorLine
endif

if version >= 703
  call s:HL('ColorColumn', s:none, s:bg1)
  call s:HL('CursorLineNr', s:gb.lightgrey2, s:none)
endif

call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

call s:HL('LineNr', s:gb.darkgrey, s:none)
call s:HL('Comment', s:gb.darkgrey, s:none, s:italic)

hi! link Identifier TokyoLighterGrey
hi! link Function TokyoBlue
hi! link Constant TokyoLightPurple

hi! link htmlTag TokyoLila " < >
hi! link htmlEndTag TokyoLila " </ >

hi! link htmlTagName TokyoLightRed " <htmlTagName 
hi! link htmlArg TokyoLightPurple " <div htmlArg=

hi! link htmlScriptTag TokyoLightGreen
hi! link htmlTagN TokyoLightGreen
hi! link htmlSpecialTagName TokyoLightGreen
hi! link htmlString TokyoLightGreen
hi! link Title Normal

hi! link htmlComment TokyoYellow
hi! link htmlCommentPart Comment
