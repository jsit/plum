" ============================================================================
" File: plum.vim
" Description: Plum, a vim colorscheme for any occasion.
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/plum.vim
" License: MIT
" Version: 0.3
" Last Changed: 25 Aug 2013
" ============================================================================


" Init
" ----------------------------------------------------------------------------

if !has('mac') || exists("g:plum_loaded")
    finish
endif
let g:plum_loaded = 1


" Initialize settings
" ----------------------------------------------------------------------------

" The default value is somewhat arbitrary. The range of the sensor readings is
" [0 - 67,092,408] but indoor I've found that the range is roughly [0 - 2,000,000].
" Only below 120,000 it sems reasonable to set a dark background.
let g:plum_threshold = get(g:, "plum_threshold", 120000)

" Internal use only
let g:plum_ambient_light_cmd = fnameescape(globpath(&rtp, 'bin/plum_ambient_light'))


" Main function
" ----------------------------------------------------------------------------

fu! s:setBg(newbg)
    if a:newbg != &bg
        exec "set bg=" . a:newbg
    endif
endfu


fu! PlumSetBackground()

    if get(g:, "plum_force_dark", 0)
        call s:setBg("dark")
        return
    endif

    if get(g:, "plum_force_light", 0)
        call s:setBg("light")
        return
    endif

    if !empty(g:plum_ambient_light_cmd)
        let al = system(g:plum_ambient_light_cmd)
        if v:shell_error == 0 && !empty(al)
            call s:setBg(al < g:plum_threshold ? "dark" : "light")
        else
            echohl WarningMsg |
                \ echomsg "[plum] Failed to connect to the ambient light sensor." |
                \ echohl None
        endif
    else
        echohl WarningMsg |
            \ echomsg "[plum] Execute ./install.sh from the plugin root directory to complete "
                    \ "the installation before using ambient light detection." |
            \ echohl None
    endif

endfu

if get(g:, "plum_set_bg_at_start", 1)
    call PlumSetBackground()
endif
