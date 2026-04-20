" Name:         wired
" Description:  Pure black background. Lain soul, readable contrast.
" Author:       generated for you
" Palette:      wired (black · rose · sage · amber · slate · teal)
" Background:   dark

set background=dark

source $VIMRUNTIME/colors/vim.lua
let g:colors_name = 'wired'

let s:t_Co = &t_Co

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = [
    \ '#000000',
    \ '#8f404b',
    \ '#4a6a50',
    \ '#7a5830',
    \ '#3d5a72',
    \ '#943f52',
    \ '#4e7070',
    \ '#b89090',
    \ '#1a0a10',
    \ '#c05060',
    \ '#6a9870',
    \ '#b07840',
    \ '#5a80a0',
    \ '#e76485',
    \ '#70a0a0',
    \ '#e7d0cd'
    \ ]
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif

hi! link Terminal         Normal
hi! link LineNrAbove      LineNr
hi! link LineNrBelow      LineNr
hi! link CurSearch        Search
hi! link CursorLineFold   CursorLine
hi! link CursorLineSign   CursorLine
hi! link EndOfBuffer      NonText
hi! link MessageWindow    Pmenu
hi! link PopupNotification Todo
hi! link PopupSelected    PmenuSel

" ── Core UI ───────────────────────────────────────────────────────────────────
hi Normal          guifg=#e7d0cd  guibg=NONE     gui=NONE      cterm=NONE
hi NormalFloat     guifg=#e7d0cd  guibg=NONE     gui=NONE      cterm=NONE
hi NormalNC        guifg=#b89090  guibg=NONE     gui=NONE      cterm=NONE

hi StatusLine      guifg=#e7d0cd  guibg=NONE     gui=NONE      cterm=NONE
hi StatusLineNC    guifg=#4e7070  guibg=NONE     gui=NONE      cterm=NONE
hi StatusLineTerm  guifg=#e7d0cd  guibg=NONE     gui=NONE      cterm=NONE
hi StatusLineTermNC guifg=#4e7070 guibg=NONE     gui=NONE      cterm=NONE

hi WinSeparator    guifg=#2a0f18  guibg=NONE     gui=NONE      cterm=NONE
hi VertSplit       guifg=#2a0f18  guibg=#1a0a10  gui=NONE      cterm=NONE

hi TabLine         guifg=#b89090  guibg=#1a0a10  gui=NONE      cterm=NONE
hi TabLineFill     guifg=NONE     guibg=#1a0a10  gui=NONE      cterm=NONE
hi TabLineSel      guifg=#e7d0cd  guibg=#943f52  gui=NONE      cterm=NONE

" ── Popup / Completion ────────────────────────────────────────────────────────
hi Pmenu           guifg=#e7d0cd  guibg=#1a0a10  gui=NONE      cterm=NONE
hi PmenuSel        guifg=#000000  guibg=#e76485  gui=NONE      cterm=NONE
hi PmenuSbar       guifg=NONE     guibg=#2a0f18  gui=NONE      cterm=NONE
hi PmenuThumb      guifg=NONE     guibg=#943f52  gui=NONE      cterm=NONE
hi PmenuMatch      guifg=#e76485  guibg=#1a0a10  gui=bold      cterm=bold
hi PmenuMatchSel   guifg=#000000  guibg=#e76485  gui=bold      cterm=bold

" ── Cursor / Line ─────────────────────────────────────────────────────────────
hi Cursor          guifg=#000000  guibg=#e76485  gui=NONE      cterm=NONE
hi lCursor         guifg=#000000  guibg=#c05060  gui=NONE      cterm=NONE
hi CursorLine      guifg=NONE     guibg=#1a0a10  gui=NONE      cterm=NONE
hi CursorColumn    guifg=NONE     guibg=#1a0a10  gui=NONE      cterm=NONE
hi CursorLineNr    guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi ColorColumn     guifg=NONE     guibg=#1a0a10  gui=NONE      cterm=NONE

" ── Line numbers / Signs ──────────────────────────────────────────────────────
hi LineNr          guifg=#2a0f18  guibg=NONE     gui=NONE      cterm=NONE
hi SignColumn      guifg=NONE     guibg=NONE     gui=NONE      cterm=NONE
hi FoldColumn      guifg=#4e7070  guibg=NONE     gui=NONE      cterm=NONE
hi Folded          guifg=#4e7070  guibg=#1a0a10  gui=italic    cterm=NONE

" ── Search / Selection ────────────────────────────────────────────────────────
hi Search          guifg=#000000  guibg=#b07840  gui=NONE      cterm=NONE
hi IncSearch       guifg=#000000  guibg=#e76485  gui=NONE      cterm=NONE
hi Visual          guifg=#e7d0cd  guibg=#3d5a72  gui=NONE      cterm=NONE
hi VisualNOS       guifg=#e7d0cd  guibg=#3d5a72  gui=NONE      cterm=NONE
hi WildMenu        guifg=#000000  guibg=#e76485  gui=NONE      cterm=NONE
hi QuickFixLine    guifg=#000000  guibg=#b07840  gui=NONE      cterm=NONE
hi MatchParen      guifg=#e76485  guibg=#1a0a10  gui=bold      cterm=bold

" ── Messages ──────────────────────────────────────────────────────────────────
hi ErrorMsg        guifg=#c05060  guibg=NONE     gui=bold      cterm=bold
hi WarningMsg      guifg=#b07840  guibg=NONE     gui=bold      cterm=bold
hi ModeMsg         guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi MoreMsg         guifg=#6a9870  guibg=NONE     gui=bold      cterm=bold
hi Question        guifg=#70a0a0  guibg=NONE     gui=bold      cterm=bold
hi Error           guifg=#c05060  guibg=NONE     gui=bold      cterm=bold

" ── Spelling ──────────────────────────────────────────────────────────────────
hi SpellBad        guifg=#c05060  guibg=NONE     guisp=#c05060 gui=undercurl cterm=underline
hi SpellCap        guifg=#5a80a0  guibg=NONE     guisp=#5a80a0 gui=undercurl cterm=underline
hi SpellLocal      guifg=#b07840  guibg=NONE     guisp=#b07840 gui=undercurl cterm=underline
hi SpellRare       guifg=#70a0a0  guibg=NONE     guisp=#70a0a0 gui=undercurl cterm=underline

" ── Misc UI ───────────────────────────────────────────────────────────────────
hi NonText         guifg=#2a0f18  guibg=NONE     gui=NONE      cterm=NONE
hi SpecialKey      guifg=#4e7070  guibg=NONE     gui=NONE      cterm=NONE
hi Conceal         guifg=#4e7070  guibg=NONE     gui=NONE      cterm=NONE
hi Underlined      guifg=#5a80a0  guibg=NONE     gui=underline cterm=underline
hi Directory       guifg=#70a0a0  guibg=NONE     gui=NONE      cterm=NONE
hi Title           guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi Todo            guifg=#000000  guibg=#e76485  gui=bold      cterm=bold
hi Ignore          guifg=NONE     guibg=NONE     gui=NONE      cterm=NONE

hi debugPC         guifg=#5a80a0  guibg=NONE     gui=reverse   cterm=reverse
hi debugBreakpoint guifg=#c05060  guibg=NONE     gui=reverse   cterm=reverse

hi ToolbarLine     guifg=NONE     guibg=#1a0a10  gui=NONE      cterm=NONE
hi ToolbarButton   guifg=#000000  guibg=#b07840  gui=bold      cterm=bold

" ── Diff ──────────────────────────────────────────────────────────────────────
hi DiffAdd         guifg=#6a9870  guibg=#0a1a0d  gui=NONE      cterm=NONE
hi DiffChange      guifg=#5a80a0  guibg=#0a1020  gui=NONE      cterm=NONE
hi DiffText        guifg=#b07840  guibg=#1a1000  gui=NONE      cterm=NONE
hi DiffDelete      guifg=#8f404b  guibg=#1a0a10  gui=NONE      cterm=NONE

" ── Syntax ────────────────────────────────────────────────────────────────────
"   Comment    → muted teal       (quiet, out of the way)
"   String     → sage green       (content)
"   Number     → amber            (literals)
"   Keyword    → bright pink      (lain signature)
"   Function   → bright teal      (calls)
"   Type       → slate blue       (types, structs)
"   Macro/Pre  → dark rose        (preprocessor)
"   Special    → warm foreground  (escape seqs, special chars)
"   Identifier → light teal       (variables)
"   Constant   → muted amber      (constants)

hi Comment         guifg=#4e7070  guibg=NONE     gui=italic    cterm=NONE
hi String          guifg=#6a9870  guibg=NONE     gui=NONE      cterm=NONE
hi Character       guifg=#6a9870  guibg=NONE     gui=NONE      cterm=NONE
hi Number          guifg=#b07840  guibg=NONE     gui=NONE      cterm=NONE
hi Float           guifg=#b07840  guibg=NONE     gui=NONE      cterm=NONE
hi Boolean         guifg=#b07840  guibg=NONE     gui=italic    cterm=NONE
hi Constant        guifg=#b07840  guibg=NONE     gui=NONE      cterm=NONE

hi Statement       guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi Keyword         guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi Conditional     guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi Repeat          guifg=#e76485  guibg=NONE     gui=bold      cterm=bold
hi Label           guifg=#e76485  guibg=NONE     gui=NONE      cterm=NONE
hi Operator        guifg=#b89090  guibg=NONE     gui=NONE      cterm=NONE
hi Exception       guifg=#c05060  guibg=NONE     gui=bold      cterm=bold

hi Identifier      guifg=#70a0a0  guibg=NONE     gui=NONE      cterm=NONE
hi Function        guifg=#70a0a0  guibg=NONE     gui=NONE      cterm=NONE

hi Type            guifg=#5a80a0  guibg=NONE     gui=bold      cterm=bold
hi StorageClass    guifg=#5a80a0  guibg=NONE     gui=NONE      cterm=NONE
hi Structure       guifg=#5a80a0  guibg=NONE     gui=NONE      cterm=NONE
hi Typedef         guifg=#5a80a0  guibg=NONE     gui=italic    cterm=NONE

hi PreProc         guifg=#943f52  guibg=NONE     gui=NONE      cterm=NONE
hi Include         guifg=#943f52  guibg=NONE     gui=NONE      cterm=NONE
hi Define          guifg=#943f52  guibg=NONE     gui=NONE      cterm=NONE
hi Macro           guifg=#943f52  guibg=NONE     gui=NONE      cterm=NONE
hi PreCondit       guifg=#943f52  guibg=NONE     gui=NONE      cterm=NONE

hi Special         guifg=#b89090  guibg=NONE     gui=NONE      cterm=NONE
hi SpecialChar     guifg=#b07840  guibg=NONE     gui=NONE      cterm=NONE
hi Tag             guifg=#e76485  guibg=NONE     gui=NONE      cterm=NONE
hi Delimiter       guifg=#b89090  guibg=NONE     gui=NONE      cterm=NONE
hi SpecialComment  guifg=#70a0a0  guibg=NONE     gui=italic    cterm=NONE
hi Debug           guifg=#c05060  guibg=NONE     gui=NONE      cterm=NONE

" ── Treesitter (nvim-treesitter) ──────────────────────────────────────────────
hi! link @comment              Comment
hi! link @comment.documentation SpecialComment
hi! link @string               String
hi! link @string.escape        SpecialChar
hi! link @string.special       SpecialChar
hi! link @character            Character
hi! link @number               Number
hi! link @float                Float
hi! link @boolean              Boolean
hi! link @constant             Constant
hi! link @constant.builtin     Constant
hi! link @constant.macro       Macro

hi! link @keyword              Keyword
hi! link @keyword.return       Keyword
hi! link @keyword.function     Keyword
hi! link @keyword.operator     Operator
hi! link @conditional          Conditional
hi! link @repeat               Repeat
hi! link @label                Label
hi! link @operator             Operator
hi! link @exception            Exception
hi! link @include              Include

hi! link @function             Function
hi! link @function.builtin     Function
hi! link @function.call        Function
hi! link @function.macro       Macro
hi! link @method               Function
hi! link @method.call          Function
hi! link @constructor          Type

hi! link @variable             Identifier
hi! link @variable.builtin     Special
hi! link @parameter            Identifier
hi! link @field                Identifier
hi! link @property             Identifier

hi! link @type                 Type
hi! link @type.builtin         Type
hi! link @type.qualifier       StorageClass
hi! link @namespace            Type
hi! link @module               Type

hi! link @tag                  Tag
hi! link @tag.attribute        Identifier
hi! link @tag.delimiter        Delimiter
hi! link @punctuation          Delimiter
hi! link @punctuation.bracket  Delimiter
hi! link @punctuation.special  SpecialChar

hi! link @text.title           Title
hi! link @text.uri             Underlined
hi @text.emphasis              guifg=NONE guibg=NONE gui=italic  cterm=NONE
hi @text.strong                guifg=NONE guibg=NONE gui=bold    cterm=NONE
hi! link @text.danger          ErrorMsg
hi! link @text.warning         WarningMsg
hi! link @text.note            MoreMsg

" ── LSP Diagnostics ───────────────────────────────────────────────────────────
hi DiagnosticError             guifg=#c05060  guibg=NONE     gui=NONE      cterm=NONE
hi DiagnosticWarn              guifg=#b07840  guibg=NONE     gui=NONE      cterm=NONE
hi DiagnosticInfo              guifg=#5a80a0  guibg=NONE     gui=NONE      cterm=NONE
hi DiagnosticHint              guifg=#4e7070  guibg=NONE     gui=NONE      cterm=NONE

hi DiagnosticUnderlineError    guifg=NONE     guibg=NONE     guisp=#c05060 gui=undercurl cterm=underline
hi DiagnosticUnderlineWarn     guifg=NONE     guibg=NONE     guisp=#b07840 gui=undercurl cterm=underline
hi DiagnosticUnderlineInfo     guifg=NONE     guibg=NONE     guisp=#5a80a0 gui=undercurl cterm=underline
hi DiagnosticUnderlineHint     guifg=NONE     guibg=NONE     guisp=#4e7070 gui=undercurl cterm=underline

hi DiagnosticVirtualTextError  guifg=#8f404b  guibg=NONE     gui=italic    cterm=NONE
hi DiagnosticVirtualTextWarn   guifg=#7a5830  guibg=NONE     gui=italic    cterm=NONE
hi DiagnosticVirtualTextInfo   guifg=#3d5a72  guibg=NONE     gui=italic    cterm=NONE
hi DiagnosticVirtualTextHint   guifg=#4e7070  guibg=NONE     gui=italic    cterm=NONE

hi! link LspReferenceText      CursorLine
hi! link LspReferenceRead      CursorLine
hi! link LspReferenceWrite     CursorLine

" ── Git signs (gitsigns.nvim) ─────────────────────────────────────────────────
hi GitSignsAdd                 guifg=#4a6a50  guibg=NONE     gui=NONE      cterm=NONE
hi GitSignsChange              guifg=#3d5a72  guibg=NONE     gui=NONE      cterm=NONE
hi GitSignsDelete              guifg=#8f404b  guibg=NONE     gui=NONE      cterm=NONE

" ── Color reference ───────────────────────────────────────────────────────────
" Color: background  #000000   pure black
" Color: bg_dim      #1a0a10   dark rose-tinted surface
" Color: bg_alt      #2a0f18   borders, inactive elements
" Color: color00     #000000   black
" Color: color01     #8f404b   dark rose (errors, git del)
" Color: color02     #4a6a50   dark sage (strings, git add)
" Color: color03     #7a5830   dark amber (numbers)
" Color: color04     #3d5a72   dark slate (types, git change)
" Color: color05     #943f52   dark magenta (macros, preproc)
" Color: color06     #4e7070   dark teal (comments)
" Color: color07     #b89090   warm muted fg (operators, delimiters)
" Color: color08     #1a0a10   bright black (surface)
" Color: color09     #c05060   bright rose (errors)
" Color: color10     #6a9870   bright sage (strings bright)
" Color: color11     #b07840   bright amber (numbers, search)
" Color: color12     #5a80a0   bright slate (types, info)
" Color: color13     #e76485   bright pink — lain signature (keywords, accent)
" Color: color14     #70a0a0   bright teal (functions, identifiers)
" Color: color15     #e7d0cd   warm white (foreground)
