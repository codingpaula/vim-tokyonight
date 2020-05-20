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

" -------------------
"  Editor Settings
" -------------------
hi Normal
hi Cursor
hi CursorLine
hi LineNr
hi CursorLineNR

" ------------------
"  - Number Column -
" ------------------
hi CursorColumn
hi FoldColumn
hi SignColumn
hi Folded
