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
let s:gb.darker       = ["#16161e", 233]
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

" BOLD
let s:bold = 'bold,'

if !exists('g:tokyonight_bold')
  let g:tokyonight_italic=1
endif

if g:tokyonight_italic == 0
  let s:bold = ''
endif

" ITALICS
let s:italic = 'italic,'

if !exists('g:tokyonight_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:tokyonight_italic=1
  else
    let g:tokyonight_italic=0
  endif
endif

if g:tokyonight_italic == 0
  let s:italic = ''
endif

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

call s:HL('TokyoMiddlePurpleItalic', s:gb.middlepurple, s:none, s:italic)

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

hi! link SignColumn Normal

call s:HL('LineNr', s:gb.darkgrey, s:none)
call s:HL('Comment', s:gb.darkgrey, s:none, s:italic)
call s:HL('cssUrl', s:gb.yelloworange, s:none, s:underline)
call s:HL('Directory', s:none) " Todo
call s:HL('FoldColumn', s:none) " Todo
call s:HL('Folded', s:none) " Todo
call s:HL('PMenu', s:fg1, s:gb.darker) " Todo
call s:HL('PMenuSel', s:fg1, s:gb.middlegrey) " Todo
call s:HL('PMenuSbar', s:none, s:gb.lightgrey)
call s:HL('PMenuThumb', s:none, s:gb.bluegrey)
call s:HL('ErrorMsg', s:gb.red, s:none, s:undercurl)
call s:HL('Error', s:gb.red, s:none, s:undercurl, s:gb.red)
call s:HL('WarningMsg', s:gb.redorange, s:none, s:underline)
call s:HL('VertSplit', s:gb.lightblue)
call s:HL('Todo', s:gb.red, s:none, s:italic)
call s:HL('Visual', s:none, s:gb.middlegrey)
call s:HL('Search', s:none, s:gb.middlegrey, s:underline)
call s:HL('InSearch', s:none, s:none, s:inverse)
call s:HL('MatchParen', s:none, s:gb.middlegrey, s:inverse)

hi! link String TokyoLightGreen
hi! link Conceal Comment
hi! link NonText Comment
hi! link Identifier TokyoLighterGrey
hi! link Function TokyoBlue
hi! link Constant TokyoLightPurple
hi! link Statement TokyoTurkis
hi! link Noise TokyoGreyTurkis
hi! link Title Normal
hi! link Special TokyoGreyTurkis
hi! link Type TokyoBlue
hi! link PreProc TokyoLightPurple
hi! link Quote TokyoGreyTurkis
hi! link Define TokyoLightPurple
hi! link Conditional TokyoLightPurple
hi! link Float TokyoOrange
hi! link Number TokyoOrange
hi! link Operator TokyoGreyTurkis


hi! link htmlTag TokyoLila " < >
hi! link htmlEndTag TokyoLila " </ >

hi! link htmlTagName TokyoLightRed " <htmlTagName 
hi! link htmlArg TokyoLightPurple " <div htmlArg=

hi! link htmlScriptTag TokyoLightGreen
hi! link htmlTagN TokyoLightGreen
hi! link htmlSpecialTagName TokyoLightGreen
hi! link htmlString TokyoLightGreen

hi! link htmlComment Comment
hi! link htmlCommentPart Comment

hi! link cssStringQ TokyoLightGreen
hi! link cssBraces TokyoYellow
hi! link cssValueNumber TokyoOrange
hi! link cssVendor cssProp
hi! link cssAttrRegion TokyoLightPurple
hi! link cssFontAttr TokyoOrange
hi! link cssBackgroundAttr TokyoTurkis
hi! link cssFunctionName TokyoTurkis

hi! link javascriptBlock TokyoLightRed
hi! link javascriptBraces TokyoGreenTurkis
hi! link javascriptBrackets TokyoGreyTurkis
hi! link javascriptClassName TokyoTurkis
hi! link javascriptClassSuperName TokyoLightPurple
hi! link javascriptExport TokyoLightBlue
hi! link javascriptFuncKeyword TokyoMiddlePurpleItalic
hi! link javascriptIdentifierName TokyoLighterGrey
hi! link javascriptMethod TokyoBlue
hi! link javascriptObjectLabel TokyoLighterGrey
hi! link javascriptObjectLabelColon Noise
hi! link javascriptObjectMethodName TokyoLightRed
hi! link javascriptOperator TokyoGreyTurkis
hi! link javascriptProperty TokyoLightBlue
hi! link javascriptStringMethod TokyoLightRed
hi! link javascriptVariable TokyoLighterGrey

hi! link jsModuleName TokyoTurkis
hi! link jsBuiltinValues TokyoOrange
hi! link jsNew TokyoLightBlue
hi! link jsImport TokyoGreyTurkis
hi! link jsObjectKey TokyoGreenTurkis
hi! link jsIdentifierProp TokyoGreyTurkis

hi! link typescriptBOM TokyoTurkis
hi! link typescriptBraces TokyoYellow
hi! link typescriptParens TokyoYellow
hi! link typescriptString TokyoLightGreen
hi! link typescriptStringS TokyoLightGreen
hi! link typescriptVariable TokyoMiddlePurpleItalic
hi! link typescriptReserved TokyoLightPurple
hi! link typescriptStorageClass TokyoMiddlePurpleItalic
hi! link typescriptVariableDeclaration TokyoLightPurple
hi! link typescriptObjectLabel TokyoGreenTurkis
hi! link typescriptAssign TokyoGreyTurkis
hi! link typescriptObjectColon TokyoGreyTurkis
hi! link typescriptFuncKeyword TokyoLightPurple
hi! link typescriptBlock TokyoTurkis
hi! link typescriptDefault TokyoGreyTurkis
call s:HL('typescriptStatementKeyword', s:gb.lightpurple, s:none, s:italic)
hi! link typescriptFuncCallArg TokyoGreyTurkis
hi! link typescriptDotNotation TokyoGreyTurkis
hi! link typescriptOpSymbols TokyoGreyTurkis
hi! link typescriptGlobalObjects TokyoTurkis

hi! link jsxOpenPunct TokyoLila
hi! link jsxClosePunct TokyoLila
hi! link jsxCloseString TokyoLila
hi! link jsxAttrib TokyoLightPurple
hi! link jsxEqual TokyoGreyTurkis
hi! link jsxTagName TokyoLightRed
hi! link jsxComponentName TokyoLightRed
hi! link jsxString TokyoLightGreen

hi! link jsonBoolean TokyoOrange
hi! link jsonKeyword TokyoBlue
hi! link jsonString TokyoLightGreen
hi! link jsonKeywordMatch TokyoGreyTurkis

call s:HL('markdownH2', s:gb.lightturkis, s:none, s:bold)
hi! link markdownH2Delimiter markdownH2
call s:HL('markdownH3', s:gb.blue, s:none, s:bold)
hi! link markdownH3Delimiter markdownH3
call s:HL('markdownH4', s:gb.darkblue, s:none, s:bold)
hi! link markdownH4Delimiter markdownH4
call s:HL('markdownURL', s:gb.greenturkis, s:none, s:underline)
hi! link markdownLinkText TokyoGreenTurkis
call s:HL('markdownBold', s:none, s:none, s:bold)
hi! link markdownCode TokyoGreyTurkis

hi! link CocErrorSign TokyoRed
hi! link CocWarningSign TokyoYellow
hi! link CocInfoSign TokyoBlue
hi! link CocHintSign TokyoYellow
call s:HL('CocErrorHighlight', s:gb.red, s:none, s:undercurl, s:gb.red)
call s:HL('CocWarningHighlight', s:gb.yellow, s:none, s:undercurl)
call s:HL('CocInfoHighlight', s:none, s:none, s:underline)
hi! link CocHintHighlight CocWarningHighlight
hi! link CocErrorLine TokyoRed
hi! link CocWarningLine TokyoYellow
hi! link CocInfoLine TokyoBlue
hi! link CocHintLine TokyoYellow

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['209', '#ff9e64'],
      \ ['117', '#89ddff'],
      \ ['221', '#ffdb69'],
      \ ['149', '#9ece6a'],
      \ ['68', '#3d59a1'],
      \ ['210', '#f7768e']
    \ ]
endif

" let g:rbpt_max = 6

