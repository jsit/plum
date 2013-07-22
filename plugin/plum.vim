" ============================================================================
" File: plum.vim
" Description: Plum, a vim colorscheme for any occasion.
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/plum.vim
" License: MIT
" Version: 0.2
" Last Changed: 21 Jul 2013
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

" Set this option to 1 to output the ambient light whenever 
" plum#SetBgAccordingToAmbientLight() is called.
let g:plum_debug = get(g:, "plum_debug", 0)

" Internal use only
let g:plum_ambient_light_cmd = ""


" Main function
" ----------------------------------------------------------------------------

fu! PlumSetBackground()
    " The location of the 'plum_ambient_light' binary
    if empty(g:plum_ambient_light_cmd)
        let g:plum_ambient_light_cmd = fnameescape(globpath(&runtimepath, 'bin/plum_ambient_light'))
        if empty(g:plum_ambient_light_cmd)
            echohl WarningMsg |
                \ echomsg "[plum] Run ./install.sh from the plugin directory to complete the installation before using ambient light detection." |
                \ echohl None
            return  
        endif
    endif

    " Get the current ambient light
    let out = system(g:plum_ambient_light_cmd)
    if v:shell_error != 0
        echohl WarningMsg |
            \ echomsg "[plum] Failed to connect to the ambient light sensor." |
            \ echohl None
        return 
    endif

    " Change the current background if needed
    if !empty(out)
        let al = str2nr(out)
        let newbg = al < g:plum_threshold ? "dark" : "light"
        if newbg != &bg
            exec "set bg=" . newbg 
        endif
        if g:plum_debug
            echom "[plum] at " . strftime("%X") . " ambient light: " . al
        endif
    endif
endfu

if get(g:, "plum_set_bg_at_start", 1)
    call PlumSetBackground()
endif
