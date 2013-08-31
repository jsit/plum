" ============================================================================
" File: plum.vim
" Description: Plum, a vim colorscheme for any occasion.
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/plum.vim
" License: MIT
" Version: 0.2
" Last Changed: 21 Jul 2013
" ============================================================================


" Init colors

" dark-bg colors
let s:dark_fg              = ["65658b", 247]
let s:dark_bg              = ["000116", 233]
let s:dark_darkerfg        = ["44486a", 239]
let s:dark_lighterbg1      = ["15161f", 234]
let s:dark_lighterbg2      = ["26283a", 235]
let s:dark_pink            = ["603e76", 170]
let s:dark_plum            = ["4b2b5c", 53]
let s:dark_blue            = ["2d457c", 25]
let s:dark_paleblue        = ["3a3c68", 236]
let s:dark_cyan            = ["2b5359", 29]
let s:dark_orange          = ["6e583f", 173]
let s:dark_grey            = ["606060", 239]
let s:dark_red             = ["612548", 198]
let s:dark_lightblue       = ["b5d5ff", 69]
let s:dark_lightgrey       = ["cccccc", 242]

" light-bg colors
let s:light_fg             = ["4f4f4f", 238]
let s:light_bg             = ["f9f9f9", 255]
let s:light_blue           = ["4271ae", 25]
let s:light_lightblue      = ["b5d5ff", 153]
let s:light_cyan           = ["3e999f", 31]
let s:light_red            = ["d70000", 160]
let s:light_lightred       = ["f05145", 203]
let s:light_orange         = ["f5871f", 208]
let s:light_purple         = ["8959a8", 97]
let s:light_green          = ["718c00", 64]
let s:light_yellow         = ["ffff55", 227]
let s:light_gold           = ["e2b100", 178]
let s:light_grey1          = ['808080', 243]
let s:light_grey2          = ["b3b3b3", 250]
let s:light_grey3          = ["cccccc", 251]
let s:light_grey4          = ["efefef", 254]


" Init settings

let plum_cursorline_highlight_only_linenr =
    \ get(g:, "plum_cursorline_highlight_only_linenr", 0)


" Init

let s:curr_bg = &bg

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "plum"


" Set colors

if has("gui_running") || &t_Co == 88 || &t_Co == 256

    fun! <SID>H(group, fg, bg, attr)  " {{{
        if s:curr_bg == "dark"
            if !empty(a:fg)
                exec "hi " . a:group . " guifg=#" . a:fg[0][0] . " ctermfg=" . a:fg[0][1]
            endif
            if !empty(a:bg)
                exec "hi " . a:group . " guibg=#" . a:bg[0][0] . " ctermbg=" . a:bg[0][1]
            endif
        else
            if !empty(a:fg)
                exec "hi " . a:group . " guifg=#" . a:fg[1][0] . " ctermfg=" . a:fg[1][1]
            endif
            if !empty(a:bg)
                exec "hi " . a:group . " guibg=#" . a:bg[1][0] . " ctermbg=" . a:bg[1][1]
            endif
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun  " }}}

    " Vim Highlighting

    " e.g call <SID>H('Colorgroup', [dark fg, light fg], [dark bg, light bg], 'style')

    call <SID>H( "Normal", [s:dark_fg, s:light_fg], [s:dark_bg, s:light_bg], "")  " normal text

    call <SID>H( "Cursor", [], [s:dark_cyan, s:light_lightred], "")  " the character under the cursor

    call <SID>H( "NonText", [s:dark_blue, s:light_blue], [], "none")  " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line).
    call <SID>H( "SpecialKey", [s:dark_lighterbg2, s:light_grey2], [s:dark_bg, s:light_bg], "none")  " Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.

    call <SID>H( "Search", [],  [s:dark_red, s:light_yellow], "")  " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
    call <SID>H( "IncSearch", [s:dark_red, s:light_yellow], [s:dark_fg, s:light_fg], "")  " 'incsearch' highlighting; also used for the text replaced with ':s///c'

    call <SID>H( "StatusLine", [s:dark_blue, s:light_blue], [s:dark_lighterbg1, s:light_grey4], "none" )  " status line of current window
    call <SID>H( "StatusLineNC", [s:dark_lighterbg1, s:light_grey4], [s:dark_paleblue, s:light_grey2], "inverse" )  " status lines of not-current windows
    call <SID>H( "StatusLineErr", [s:dark_red, s:light_lightred], [s:dark_lighterbg1, s:light_grey4], "" )  " custom
    call <SID>H( "StatusLineBold", [s:dark_blue, s:light_blue], [s:dark_lighterbg1, s:light_grey4], "bold" )  " custom

    call <SID>H( "VertSplit", [s:dark_bg, s:light_bg],  [s:dark_lighterbg2, s:light_blue], "inverse" )  " the column separating vertically split windows

    call <SID>H( "Visual", [], [s:dark_lighterbg2, s:light_lightblue], "")  " visual mode selection
    call <SID>H( "MatchParen", [], [s:dark_lighterbg2, s:light_lightblue], "" )  " The character under the cursor or just before it, if it is a paired bracket, and its match.

    call <SID>H( "Directory", [s:dark_paleblue, s:light_purple], [], "" )  " directory names (and other special names in listings

    call <SID>H( "Folded", [s:dark_darkerfg, s:light_grey1], [s:dark_bg, s:light_bg], "" )  " line used for closed folds
    call <SID>H( "FoldColumn", [s:dark_grey, s:light_gold], [s:dark_bg, s:light_bg], "")  " see 'foldcolumn'

    call <SID>H( "WarningMsg", [s:dark_red, s:light_lightred], [s:dark_bg, s:light_bg], "" ) " warning messages
    call <SID>H( "ErrorMsg", [s:dark_red, s:light_lightred], [s:dark_bg, s:light_bg], "" )  " error messages on the command line
    call <SID>H( "ModeMsg", [s:dark_cyan, s:light_green], [], "")  " 'showmode' message (e.g., '-- INSERT --')
    call <SID>H( "MoreMsg", [s:dark_cyan, s:light_green],  [], "")  " more-prompt
    call <SID>H( "Question", [s:dark_cyan, s:light_green],  [], "")  " hit-enter prompt and yes/no questions

    call <SID>H( "WildMenu", [s:dark_pink, s:light_blue], [s:dark_lighterbg2, s:light_lightblue], "" )  " current match in 'wildmenu' completion

    call <SID>H( "SignColumn", [], [s:dark_bg, s:light_bg], "" )  " column where signs are displayed

    call <SID>H( "Linenr", [s:dark_lighterbg2, s:light_grey3], [], "" )  " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.


    call <SID>H( "DiffAdd", [s:dark_bg, s:light_bg], [s:dark_cyan, s:light_green], "")  " diff mode: Added line
    call <SID>H( "DiffDelete", [s:dark_bg, s:light_bg], [s:dark_red, s:light_lightred], "" )  " diff mode: Deleted line
    call <SID>H( "DiffChange", [s:dark_bg, s:light_bg], [s:dark_paleblue, s:light_gold], "" )  " diff mode: Changed line
    call <SID>H( "DiffText", [s:dark_bg, s:light_bg], [s:dark_red, s:light_lightred], "none" )  " diff mode: Changed text within a changed line

    if version >= 700

    call <SID>H( "CursorLineNr", [s:dark_cyan, s:light_lightred], [], "none" )  " like LineNr when 'cursorline' is set for the cursor line.
    if g:plum_cursorline_highlight_only_linenr
        call <SID>H( "CursorLine", [], [s:dark_bg, s:light_bg], "none" )  " the screen line that the cursor is in when 'cursorline' is set
    else
        call <SID>H( "CursorLine", [], [s:dark_lighterbg1, s:light_grey4], "none" )  " the screen line that the cursor is in when 'cursorline' is set
    endif

    call <SID>H( "CursorColumn", [], [s:dark_lighterbg1, s:light_grey4], "" )  " the screen column that the cursor is in when 'cursorcolumn' is set

    call <SID>H( "PMenu", [s:dark_blue, s:light_blue], [s:dark_lightblue, s:light_lightblue], "none" )  " popup menu: normal item
    call <SID>H( "PMenuSel", [s:dark_lightblue, s:light_lightblue], [s:dark_blue, s:light_blue], "none" )  " popup menu: selected item
    call <SID>H( "PMenuSBar", [s:dark_grey, s:light_grey1], [s:dark_grey, s:light_grey1], "none" )  " popup menu: scrollbar
    call <SID>H( "PMenuThumb", [s:dark_grey, s:light_grey1], [s:dark_lightgrey, s:light_grey2], "none" )  " popup menu: Thumb of the scrollbar

    call <SID>H( "TabLine", [s:dark_fg, s:light_grey1], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, not active tab page label
    call <SID>H( "TabLineSel", [s:dark_bg, s:light_bg], [s:dark_lightblue, s:light_lightblue], "none" )  " tab pages line, active tab page label
    call <SID>H( "TabLineFill", [s:dark_lightgrey, s:light_grey2], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, where there are no labels

    endif

    if version >= 703

    call <SID>H( "ColorColumn", [], [s:dark_lighterbg1, s:light_grey4], "" )  " used for the columns set with 'colorcolumn'

    call <SID>H( "Conceal", [s:dark_lighterbg2, s:light_grey2], [s:dark_bg, s:light_bg], "" )  " placeholder characters substituted for concealed text (see 'conceallevel')

    " TODO
    call <SID>H( "SpellBad", [], [], "undercurl" )  " word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellCap", [], [], "" )  " word that should start with a capital. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellLocal", [], [], "" )  " word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellRare", [], [], "" )  " word that is recognized by the spellchecker as one that is hardly ever used. This will be combined with the highlighting used otherwise

    end

    " Standard Language Highlighting
    call <SID>H( "Constant", [s:dark_grey, s:light_grey1], [], "" )  " any constant
    call <SID>H( "String", [s:dark_plum, s:light_green], [], "" )   " a string constant: 'this is a string'
    call <SID>H( "Character", [s:dark_plum, s:light_green], [], "" )  " a character constant: 'c', '\n'
    call <SID>H( "Number", [s:dark_grey, s:light_grey1], [], "" )  " a number constant: 234, 0xff
    call <SID>H( "Boolean", [s:dark_grey, s:light_grey1], [], "" )  " a boolean constant: TRUE, false
    call <SID>H( "Float", [s:dark_grey, s:light_grey1], [], "" )  " a floating point constant: 2.3e10
    call <SID>H( "Identifier", [s:dark_fg, s:light_fg], [], "none" )  " any variable name
    call <SID>H( "Function", [s:dark_blue, s:light_blue], [], "" )  " function name (also: methods for classes)
    call <SID>H( "Statement",  [s:dark_blue, s:light_blue], [], "none" )  " any statement
    call <SID>H( "Conditional",[s:dark_pink, s:light_purple], [], "" )  " if, then, else, endif, switch, etc
    call <SID>H( "Label", [s:dark_pink, s:light_purple], [], "" )  "  case, default, etc.
    call <SID>H( "Repeat", [s:dark_orange, s:light_orange], [], "" )  " for, do, while, etc.
    call <SID>H( "Comment", [s:dark_paleblue, s:light_grey2], [], "")  " any comment
    call <SID>H( "Operator", [s:dark_cyan, s:light_cyan], [], "none" )  " 'sizeof', '+', '*', etc.
    call <SID>H( "Keyword", [s:dark_fg, s:light_fg], [], "" )  " any other keyword
    call <SID>H( "Exception", [s:dark_red, s:light_lightred], [], "" )  " try, catch, throw
    call <SID>H( "PreProc", [s:dark_darkerfg, s:light_grey1], [], "" )  " generic Preprocessor
    call <SID>H( "Include", [s:dark_darkerfg, s:light_grey1], [], "" )  " preprocessor #include
    call <SID>H( "Define", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
    call <SID>H( "Macro", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
    call <SID>H( "PreCondit", [s:dark_pink, s:light_purple], [], "")  " preprocessor #if, #else, #endif, etc
    call <SID>H( "Type", [s:dark_cyan, s:light_cyan], [], "none" )  " int, long, char, etc.
    call <SID>H( "StorageClass", [s:dark_cyan, s:light_cyan], [], "" )  " static, register, volatile, etc.
    call <SID>H( "Structure", [s:dark_cyan, s:light_cyan], [], "" )  " struct, union, enum, etc.
    call <SID>H( "Typedef", [s:dark_darkerfg, s:light_grey1], [], "" )  " a typedef
    call <SID>H( "Special", [s:dark_darkerfg, s:light_grey1], [], "")  " any special symbol
    call <SID>H( "Underlined", [s:dark_darkerfg, s:light_grey1], [], "underline" )  " text that stands out, HTML links
    call <SID>H( "Title", [s:dark_fg, s:light_fg], [],   "bold" )
    call <SID>H( "Error", [], [s:dark_red, s:light_red], "none" )  " any erroneous construct
    call <SID>H( "Todo", [s:dark_blue, s:light_grey1], [s:dark_lighterbg2, s:light_grey4], "")  " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    " Python Highlighting
    call <SID>H( "pythonFunction", [s:dark_fg, s:light_fg], [], "" )
    call <SID>H( "pythonPreCondit",  [s:dark_paleblue, s:light_orange], [], "" )
    call <SID>H( "pythonDottedName",  [s:dark_darkerfg, s:light_grey1], [], "" )

    " Go Highlighting
    call <SID>H( "goDirective", [s:dark_paleblue, s:light_grey1], [], "" )
    call <SID>H( "goGoroutine", [s:dark_red, s:light_lightred], [], "" )
    call <SID>H( "goFunction", [s:dark_fg, s:light_fg], [], "" )
    call <SID>H( "goConditionalOperator", [s:dark_pink, s:light_purple], [], "" )

    " Vim Highlighting
    call <SID>H( "vimCommand", [s:dark_blue, s:light_blue], [], "none" )
    call <SID>H( "vimFuncName", [s:dark_darkerfg, s:light_fg], [], "none" )

    " Java Highlighting
    call <SID>H( "javaTypeDef", [s:dark_darkerfg, s:light_grey1], [], "" )
    call <SID>H( "javaOperator", [s:dark_red, s:light_lightred], [], "" )
    call <SID>H( "javaClassDecl", [s:dark_blue, s:light_blue], [], "" )
    call <SID>H( "javaStorageClass",[s:dark_blue, s:light_blue], [], "" )

    " JavaScript Highlighting
    call <SID>H( "javaScriptBraces", [s:dark_darkerfg, s:light_grey1], [], "" )
    call <SID>H( "javaScriptIdentifier", [s:dark_darkerfg, s:light_fg], [], "" )
    call <SID>H( "javaScriptLabel", [s:dark_pink, s:light_purple], [], "" )
    call <SID>H( "javaScriptMember", [s:dark_darkerfg, s:light_grey1], [], "" )
    call <SID>H( "javaScriptGlobal", [s:dark_darkerfg, s:light_grey1], [], "" )
    call <SID>H( "javaScriptReserver", [s:dark_blue, s:light_blue], [], "" )
    call <SID>H( "javaScriptNull", [s:dark_grey, s:light_grey1], [], "" )
    call <SID>H( "javaScriptType", [s:dark_fg, s:light_cyan], [], "" )
    call <SID>H( "javaScriptNumber", [s:dark_grey, s:light_grey1], [], "" )

    " HTML Highlighting
    call <SID>H( "htmlTag", [s:dark_paleblue, s:light_grey1], [], "" )
    call <SID>H( "htmlEndTag", [s:dark_paleblue, s:light_grey1], [], "" )
    call <SID>H( "htmlTagName", [s:dark_blue, s:light_blue], [], "" )
    call <SID>H( "htmlArg", [s:dark_paleblue, s:light_cyan],[], "" )
    call <SID>H( "htmlScriptTag", [s:dark_paleblue, s:light_grey1], [], "" )

    " Markdown Highlighting
    call <SID>H( "markdownListMarker", [s:dark_cyan, s:light_cyan], [], "" )
    call <SID>H( "markdownCode", [s:dark_paleblue, s:light_grey2], [], "" )
    call <SID>H( "markdownBold", [s:dark_darkerfg, s:light_grey1], [], "bold" )
    call <SID>H( "markdownBlockquote", [s:dark_darkerfg, s:light_grey1], [], "" )

    " Diff Highlighting

    delf <SID>H
endif


" FIXME Restore the background (needed for terminal vim):
" &bg is turned to `light` for no reason after setting the colorscheme.
" Am I missing something?
exec "set bg=" . s:curr_bg
