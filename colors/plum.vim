"
" File: plum.vim
" Description: Dark, plum-flavored colorscheme
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/vim-plum-colorscheme
" Version: 0.1
" Last Changed: 16 Jul 2013
"
"
" options:
"
"   - g:plum_cursorline_highlight_only_linenr: when cursorline is set, only
"     the current the line number is highlighted.
"

" Colors

let s:foreground     = ["6d6d97", 237]
let s:background     = ["000116", 233]
let s:darkerfg       = ["44486a", 239]
let s:lighterbg1     = ["15161f", 234]
let s:lighterbg2     = ["26283a", 235]
let s:pink           = ["8957aa", 129]
let s:plum           = ["4b2b5c", 53]
let s:blue           = ["345399", 27]
let s:paleblue       = ["3a3c68", 63]
let s:aqua           = ["2f6f7a", 31]
let s:red            = ["b23e66", 52]
let s:lightred       = ["ff6155", 197]
let s:orange         = ["936365", 174]
let s:grey           = ["606060", 236]
let s:cerise         = ["902e67", 90]
let s:lightblue      = ["b5d5ff", 69]
let s:lightgrey      = ["cccccc", 242]

" Init settings
"
let plum_cursorline_highlight_only_linenr = get(g:, "plum_cursorline_highlight_only_linenr", 0) 


set background=dark
hi clear
syntax reset

let g:colors_name = "plum"


if has("gui_running") || &t_Co == 88 || &t_Co == 256


    fun! <SID>H(group, fg, bg, attr)  " {{{
        if !empty(a:fg)
            exec "hi " . a:group . " guifg=#" . a:fg[0] . " ctermfg=" . a:fg[1]
        endif
        if !empty(a:bg)
            exec "hi " . a:group . " guibg=#" . a:bg[0] . " ctermbg=" . a:bg[1]
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun  " }}}


    " Vim Highlighting

    call <SID>H( "Normal", s:foreground, s:background, "")  " normal text

    call <SID>H( "Cursor", [], s:aqua, "")  " the character under the cursor

    call <SID>H( "NonText", s:blue, [], "")  " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line).
    call <SID>H( "SpecialKey", s:lighterbg2, [], "")  " Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.

    call <SID>H( "Search", [],  s:cerise, "")  " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
    call <SID>H( "IncSearch", s:cerise, [], "")  " 'incsearch' highlighting; also used for the text replaced with ':s///c'

    call <SID>H( "StatusLine", s:blue, s:lighterbg1, "none" )  " status line of current window
    call <SID>H( "StatusLineNC", s:lighterbg1, s:paleblue, "inverse" )  " status lines of not-current windows
    call <SID>H( "StatusLineErr", s:cerise, s:lighterbg1, "" )  " custom
    call <SID>H( "StatusLineBold", s:blue, s:lighterbg1, "bold" )  " custom

    call <SID>H( "VertSplit", s:background, s:lighterbg2, "inverse" )  " the column separating vertically split windows

    call <SID>H( "Visual", [], s:lighterbg2, "")  " visual mode selection
    call <SID>H( "MatchParen", [], s:lighterbg2, "" )  " The character under the cursor or just before it, if it is a paired bracket, and its match.

    call <SID>H( "Directory", s:paleblue, [], "" )  " directory names (and other special names in listings

    call <SID>H( "Folded", s:darkerfg, s:background, "" )  " line used for closed folds
    call <SID>H( "FoldColumn", s:grey, s:background, "")  " see 'foldcolumn'

    call <SID>H( "WarningMsg", s:cerise, [], "" ) " warning messages
    call <SID>H( "ErrorMsg", s:cerise, s:background, "" )  " error messages on the command lin e
    call <SID>H( "ModeMsg", s:aqua, [], "")  " 'showmode' message (e.g., '-- INSERT --')
    call <SID>H( "MoreMsg", s:aqua,  [], "")  " more-prompt
    call <SID>H( "Question", s:aqua, [], "")  " hit-enter prompt and yes/no questions

    call <SID>H( "WildMenu", s:pink, s:lighterbg2, "" )  " current match in 'wildmenu' completion

    call <SID>H( "SignColumn", [], s:background, "" )  " column where signs are displayed

    call <SID>H( "Linenr", s:lighterbg2, [], "" )  " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    

    call <SID>H( "DiffAdd", s:background, s:aqua, "")  " diff mode: Added line
    call <SID>H( "DiffDelete", s:background, s:red, "" )  " diff mode: Deleted line
    call <SID>H( "DiffChange", s:background, s:paleblue, "" )  " diff mode: Changed line
    call <SID>H( "DiffText", s:background, s:red, "none" )  " diff mode: Changed text within a changed line

    if version >= 700

    call <SID>H( "CursorLineNr", s:darkerfg, [], "" )  " like LineNr when 'cursorline' is set for the cursor line.
    if g:plum_cursorline_highlight_only_linenr
        call <SID>H( "CursorLine", [], s:background, "" )  " the screen line that the cursor is in when 'cursorline' is set
    else
        call <SID>H( "CursorLine", [], s:lighterbg1, "" )  " the screen line that the cursor is in when 'cursorline' is set
    endif
        
    call <SID>H( "CursorColumn", [], s:lighterbg1, "" )  " the screen column that the cursor is in when 'cursorcolumn' is set

    call <SID>H( "PMenu", s:blue, s:lightblue, "none" )  " popup menu: normal item
    call <SID>H( "PMenuSel", s:lightblue, s:blue, "none" )  " popup menu: selected item
    call <SID>H( "PMenuSBar", s:grey, s:grey, "none" )  " popup menu: scrollbar
    call <SID>H( "PMenuThumb", s:grey, s:lightgrey, "none" )  " popup menu: Thumb of the scrollbar

    call <SID>H( "TabLine", s:foreground, s:lighterbg2, "none" )  " tab pages line, not active tab page label
    call <SID>H( "TabLineSel", s:background, s:lightblue, "none" )  " tab pages line, active tab page label
    call <SID>H( "TabLineFill", s:lightgrey, s:lighterbg2, "none" )  " tab pages line, where there are no labels

    endif

    if version >= 703

    call <SID>H( "ColorColumn", [], s:lighterbg1, "" )  " used for the columns set with 'colorcolumn'

    call <SID>H( "Conceal", s:lighterbg2, [], "" )  " placeholder characters substituted for concealed text (see 'conceallevel')

    call <SID>H( "SpellBad", [], [], "undercurl" )  " word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellCap", [], [], "" )  " word that should start with a capital. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellLocal", [], [], "" )  " word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise
    call <SID>H( "SpellRare", [], [], "" )  " word that is recognized by the spellchecker as one that is hardly ever used. This will be combined with the highlighting used otherwise

    end

    " Standard Language Highlighting
    call <SID>H( "Constant", s:grey, [], "" )  " any constant
    call <SID>H( "String", s:plum, [], "" )   " a string constant: 'this is a string'
    call <SID>H( "Character", s:plum, [], "" )  " a character constant: 'c', '\n'
    call <SID>H( "Number", s:grey, [], "" )  " a number constant: 234, 0xff
    call <SID>H( "Boolean", s:grey, [], "" )  " a boolean constant: TRUE, false
    call <SID>H( "Float", s:grey, [], "" )  " a floating point constant: 2.3e10
    call <SID>H( "Identifier", s:foreground, [], "none" )  " any variable name
    call <SID>H( "Function", s:blue, [], "" )  " function name (also: methods for classes)
    call <SID>H( "Statement",  s:blue, [], "none" )  " any statement
    call <SID>H( "Conditional",s:pink, [], "" )  " if, then, else, endif, switch, etc
    call <SID>H( "Label", s:pink, [], "" )  "  case, default, etc.
    call <SID>H( "Repeat", s:orange, [], "" )  " for, do, while, etc.
    call <SID>H( "Comment", s:paleblue, [], "")  " any comment
    call <SID>H( "Operator", s:foreground, [], "none" )  " 'sizeof', '+', '*', etc.
    call <SID>H( "Keyword", s:foreground, [], "" )  " any other keyword
    call <SID>H( "Exception", s:cerise, [], "" )  " try, catch, throw
    call <SID>H( "PreProc", s:darkerfg, [], "" )  " generic Preprocessor
    call <SID>H( "Include", s:darkerfg, [], "" )  " preprocessor #include
    call <SID>H( "Define", s:darkerfg, [], "none" )  " preprocessor #define
    call <SID>H( "PreCondit", s:darkerfg, [], "")  " preprocessor #if, #else, #endif, etc
    call <SID>H( "Type", s:aqua, [], "none" )  " int, long, char, etc.
    call <SID>H( "StorageClass", s:aqua, [], "" )  " static, register, volatile, etc.
    call <SID>H( "Structure", s:aqua, [], "" )  " struct, union, enum, etc.
    call <SID>H( "Typedef", s:darkerfg, [], "" )  " a typedef
    call <SID>H( "Special", s:darkerfg, [], "")  " any special symbol
    call <SID>H( "Underlined", s:darkerfg, [], "underline" )  " text that stands out, HTML links
    call <SID>H( "Title", s:foreground, [],   "bold" )
    call <SID>H( "Error", [], s:red, "" )  " any erroneous construct
    call <SID>H( "Todo", s:blue, s:lighterbg2, "")  " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    " Python Highlighting
    call <SID>H( "pythonFunction", s:foreground, [], "" )
    call <SID>H( "pythonSelf",      s:darkerfg, [], "" )
    call <SID>H( "pythonDottedName",s:darkerfg, [], "" )
    call <SID>H( "pythonOperator",  s:aqua, [], "" )

    " Go Highlighting
    call <SID>H( "goDirective", s:paleblue, [], "" )
    call <SID>H( "goGoroutine", s:cerise, [], "" )
    call <SID>H( "goKeyword", s:paleblue, [], "" )
    call <SID>H( "goFunction", s:foreground, [], "" )

    " Vim Highlighting
    call <SID>H( "vimCommand", s:blue, [], "none" )
    call <SID>H( "vimFuncname", s:foreground, [], "none" )

    " Java Highlighting
    call <SID>H( "javaTypeDef", s:darkerfg, [], "" )
    call <SID>H( "javaOperator", s:cerise, [], "" )
    call <SID>H( "javaClassDecl", s:blue, [], "" )
    call <SID>H( "javaStorageClass",s:blue, [], "" )

    " JavaScript Highlighting
    call <SID>H( "javaScriptBraces", s:darkerfg, [], "" )
    call <SID>H( "javaScriptIdentifier", s:darkerfg, [], "" )
    call <SID>H( "javaScriptLabel", s:pink, [], "" )
    call <SID>H( "javaScriptMember", s:darkerfg, [], "" )
    call <SID>H( "javaScriptGlobal", s:darkerfg, [], "" )
    call <SID>H( "javaScriptReserver", s:blue, [], "" )
    call <SID>H( "javaScriptNull", s:grey, [], "" )
    call <SID>H( "javaScriptType", s:foreground, [], "" )
    call <SID>H( "javaScriptNumber", s:grey, [], "" )

    " HTML Highlighting
    call <SID>H( "htmlTag", s:paleblue, [], "" )
    call <SID>H( "htmlEndTag", s:paleblue, [], "" )
    call <SID>H( "htmlTagName", s:blue, [], "" )
    call <SID>H( "htmlArg", s:paleblue,[], "" )
    call <SID>H( "htmlScriptTag", s:blue, [], "" )

    " Markdown Highlighting
    call <SID>H( "markdownListMarker", s:aqua, [], "" )
    call <SID>H( "markdownCode", s:paleblue, [], "" )
    call <SID>H( "markdownBold", s:darkerfg, [], "bold" )
    call <SID>H( "markdownBlockquote", s:darkerfg, [], "" )

    " Diff Highlighting

    delf <SID>H
endif
