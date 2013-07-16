"
" File: plum.vim
" Description: Dark, plum-flavored colorscheme
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/vim-plum-colorscheme
" Version: 0.1
" Last Changed: 16 Jul 2013
"

" Colors

let s:foreground     = ["6d6d97", 105]
let s:background     = ["000116", 233]
let s:darkerfg       = ["44486a", 239]
let s:lighterbg      = ["15161f", 234]
let s:verylighterbg  = ["26283a", 235]
let s:purple         = ["8957aa", 129]
let s:darkpurple     = ["4b2b5c", 53]
let s:blue           = ["345399", 27]
let s:greishblue     = ["3a3c68", 63]
let s:aqua           = ["2f6f7a", 31]
let s:red            = ["8e3737", 52]
let s:lightred       = ["ff6155", 197]
let s:orange         = ["965E61", 174]
let s:grey           = ["707070", 236]
let s:pink           = ["902e67", 90]
let s:green          = ["1d704a", 22]
let s:lightblue      = ["b5d5ff", 69]
let s:lightgrey      = ["cccccc", 242]


set background=dark
hi clear
syntax reset

let g:colors_name = "plum"


if has("gui_running") || &t_Co == 88 || &t_Co == 256


    fun <SID>H(group, fg, bg, attr)  " {{{
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

    call <SID>H( "Normal",             s:foreground,         s:background,       ""          )
    call <SID>H( "NonText",            s:blue,               "",                 ""          )
    call <SID>H( "SpecialKey",         s:verylighterbg,      "",                 ""          )
    call <SID>H( "Search",             "",                   s:lightred,         ""          )
    call <SID>H( "IncSearch",          s:lightred,           "",                 ""          )
    call <SID>H( "StatusLine",         s:blue,               s:lighterbg,        "none"      )
    call <SID>H( "StatusLineNC",       s:lighterbg,          s:greishblue,       ""          )
    call <SID>H( "StlErr",             s:pink,               s:lighterbg,        ""          )
    call <SID>H( "StlFname",           s:blue,               s:lighterbg,        "bold"      )
    call <SID>H( "VertSplit",          s:verylighterbg,      s:background,       "none"      )
    call <SID>H( "Visual",             "",                   s:verylighterbg,    ""          )
    call <SID>H( "MatchParen",         "",                   s:verylighterbg,    ""          )
    call <SID>H( "Directory",          s:greishblue,         "",                 ""          )
    call <SID>H( "Folded",             s:darkerfg,           s:background,       ""          )
    call <SID>H( "FoldColumn",         "",                   s:background,       ""          )
    call <SID>H( "ModeMsg",            s:pink,               "",                 ""          )
    call <SID>H( "MoreMsg",            s:pink,               "",                 ""          )
    call <SID>H( "Question",           s:aqua,               "",                 ""          )
    call <SID>H( "Cursor",             s:background,         s:aqua,             ""          )
    call <SID>H( "WarningMsg",         s:pink,               s:background,       ""          )
    call <SID>H( "ErrorMsg",           s:pink,               s:background,       ""          )
    call <SID>H( "WildMenu",           s:purple,             s:verylighterbg,    ""          )
    call <SID>H( "SignColumn",         "",                   s:background,       ""          )
    call <SID>H( "SignErr",            s:red,                s:background,       ""          )
    call <SID>H( "SignWrn",            s:orange,             s:background,       ""          )
    call <SID>H( "Linenr",             s:verylighterbg,      s:background,       ""          )

    if version >= 700

    call <SID>H( "CursorLine",          "",                  s:lighterbg,        "none"      )
    call <SID>H( "CursorColumn",        "",                  s:lighterbg,        "none"      )
    call <SID>H( "PMenu",               s:blue,              s:lightblue,        "none"      )
    call <SID>H( "PMenuSel",            s:lightblue,         s:blue,             "none"      )
    call <SID>H( "PMenuSBar",           s:grey,              s:grey,             "none"      )
    call <SID>H( "PMenuThumb",          s:grey,              s:lightgrey,        "none"      )
    call <SID>H( "TabLine",             s:foreground,        s:verylighterbg,    "none"      )
    call <SID>H( "TabLineSel",          s:background,        s:lightblue,        "none"      )
    call <SID>H( "TabLineFill",         s:lightgrey,         s:verylighterbg,    "none"      )

    endif

    if version >= 703

    call <SID>H( "ColorColumn",         "",                  s:lighterbg,        "none"      )
    call <SID>H( "Conceal",             s:verylighterbg,     "",                 ""          )

    end

    " Standard Language Highlighting
    call <SID>H( "Comment",             s:greishblue,        "",                 ""          )
    call <SID>H( "Todo",                s:blue,              s:verylighterbg,    ""          )
    call <SID>H( "Statement",           s:blue,              "",                 "none"      )
    call <SID>H( "Identifier",          s:foreground,        "",                 "none"      )
    call <SID>H( "Conditional",         s:purple,            "",                 ""          )
    call <SID>H( "Repeat",              s:orange,            "",                 ""          )
    call <SID>H( "Function",            s:blue,              "",                 ""          )
    call <SID>H( "Constant",            s:grey,              "",                 ""          )
    call <SID>H( "Number",              s:grey,              "",                 ""          )
    call <SID>H( "Boolean",             s:grey,              "",                 ""          )
    call <SID>H( "String",              s:darkpurple,        "",                 ""          )
    call <SID>H( "Character",           s:darkpurple,        "",                 ""          )
    call <SID>H( "Operator",            s:aqua,              "",                 "none"      )
    call <SID>H( "Type",                s:aqua,              "",                 "none"      )
    call <SID>H( "Exception",           s:pink,              "",                 ""          )
    call <SID>H( "Keyword",             s:foreground,        "",                 ""          )
    call <SID>H( "Title",               s:foreground,        "",                 "bold"      )
    call <SID>H( "Structure",           s:foreground,        "",                 ""          )
    call <SID>H( "Special",             s:darkerfg,          "",                 ""          )
    call <SID>H( "PreProc",             s:foreground,        "",                 ""          )
    call <SID>H( "Define",              s:darkerfg,          "",                 "none"      )
    call <SID>H( "Include",             s:darkerfg,          "",                 ""          )

    " Python Highlighting
    call <SID>H( "pythonFunction",      s:foreground,        "",                 ""          )
    call <SID>H( "pythonPreCondit",     s:darkerfg,          "",                 ""          )
    call <SID>H( "pythonSelf",          s:darkerfg,          "",                 ""          )
    call <SID>H( "pythonDottedName",    s:darkerfg,          "",                 ""          )

    " Go Highlighting
    call <SID>H( "goDirective",         s:greishblue,        "",                 ""          )
    call <SID>H( "goGoroutine",         s:pink,              "",                 ""          )
    call <SID>H( "goSpecial",           s:greishblue,        "",                 ""          )
    call <SID>H( "goFunction",          s:foreground,        "",                 "underline" )

    " Vim Highlighting
    call <SID>H( "vimCommand",          s:blue,              "",                 "none"      )
    call <SID>H( "vimFuncname",         s:foreground,        "",                 "none"      )

    " Java Highlighting
    call <SID>H( "javaTypeDef",         s:darkerfg,          "",                 ""          )
    call <SID>H( "javaOperator",        s:pink,              "",                 ""          )
    call <SID>H( "javaClassDecl",       s:blue,              "",                 ""          )
    call <SID>H( "javaStorageClass",    s:blue,              "",                 ""          )

    " JavaScript Highlighting
    call <SID>H( "javaScriptBraces",    s:darkerfg,          "",                 ""          )
    call <SID>H( "javaScriptIdentifier", s:darkerfg,         "",                 ""          )
    call <SID>H( "javaScriptLabel",     s:purple,            "",                 ""          )
    call <SID>H( "javaScriptMember",    s:darkerfg,          "",                 ""          )
    call <SID>H( "javaScriptGlobal",    s:darkerfg,          "",                 ""          )
    call <SID>H( "javaScriptReserver",  s:blue,              "",                 ""          )
    call <SID>H( "javaScriptNull",      s:grey,              "",                 ""          )
    call <SID>H( "javaScriptType",      s:foreground,        "",                 ""          )
    call <SID>H( "javaScriptNumber",    s:grey,              "",                 ""          )

    " HTML Highlighting
    call <SID>H( "htmlTag",             s:greishblue,        "",                 ""          )
    call <SID>H( "htmlEndTag",          s:greishblue,        "",                 ""          )
    call <SID>H( "htmlTagName",         s:blue,              "",                 ""          )
    call <SID>H( "htmlArg",             s:greishblue,        "",                 ""          )
    call <SID>H( "htmlScriptTag",       s:blue,              "",                 ""          )

    " Markdown Highlighting
    call <SID>H( "markdownListMarker",  s:aqua,              "",                 ""          )
    call <SID>H( "markdownCode",        s:greishblue,        "",                 ""          )
    call <SID>H( "markdownBold",        s:darkerfg,          "",                 "bold"      )
    call <SID>H( "markdownBlockquote",  s:darkerfg,          "",                 ""          )

    " Diff Highlighting
    call <SID>H( "diffAdded",          s:green,              "",                 ""          )
    call <SID>H( "diffRemoved",        s:red,                "",                 ""          )

    delf <SID>H
endif
