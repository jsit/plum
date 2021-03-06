## Plum colorscheme

Plum is a vim colorscheme that support both light and dark background.
If you are a Mac OS X, Plum provides some functionalities that
allow you to automatically switch between *dark* and *light* background
as the ambient light changes.


### Installation

1. Copy the plugin folder to `~/.vim` or use a plugin manager such as
[Vundle](https://github.com/gmarik/vundle), [Pathogen](https://github.com/tpope/vim-pathogen)
or [Neobundle](https://github.com/Shougo/neobundle.vim).

2. If you're running Mac OS X and want to use ambient light detection you need to move to the
plugin root directory and run
```
$ ./install.sh
```

### Usage

Set in your `.vimrc` the default background before setting the colorscheme:
```vim
set bg=dark
colorscheme plum
```

To easily switch between dark and light background you might find useful the following mapping:
```vim
nnoremap <silent> <F7> :exe 'set bg=' . (&bg == 'dark' ? 'light' : 'dark')<CR>
```

If you are running Mac OS X  and a camera is available, Plum can detect the
current ambient light and change the colorscheme background accordingly.
By default Plum set the right background as Vim starts (unless you turn off the `g:plum_set_bg_at_start` 
variable) but with the function `PlumSetBackground()` you can change the background whenever you
want, normally with autocommand events, e.g.:
```vim
au FocusLost,CursorHold * call PlumSetBackgroud()
```


### Settings

Set in your `.vimrc` the options you find useful:

```vim
let g:plum_cursorline_highlight_only_linenr = 0
" Set this option to 1 (default is 0) to highlight only the current the line number
" when 'cursorline' is on.

let g:plum_set_bg_at_start = 1
" If you are using Mac OS X the background is automatically set according to the 
" current ambient light. This works just like setting an autocommand for the 
" VimEnter event but usually autocommands are executed at the end of all the startup 
" initialization and you'll end up seeing some delay in background setting. 
" Setting this option to 1 (default) will considerably speed up background setting 
" at startup.

let g:plum_threshold = 120000
" When the ambient light sensor read a value below this value, the background is
" set to 'dark', otherwise is set to 'light'.
" Note that the default value is somewhat arbitrary: the values read by the
" sensor span the range [0 - 67,092,408] but I've found that indoor the range
" is roughly [0 - 2,000,000]. To me, only below 120,000 (default) it seems
" reasonable to set a dark background but I also know this is just my preference.
" If the default value does not fit for you, to find the right one you can experiment 
" directly with the 'light' executable in the 'bin' directory.

let g:plum_force_bg = ""
" Set this option to `light` or `dark` to force a specific background
" regardless of the current ambient light.
```


### Screenshots

All screenshots have been taken from MacVim (font: GohuFont 14, language: go).

#### dark background
![Screenshot](extra/dark.jpg "The plum colorscheme with dark background (language: go)")
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/dark.jpg)

#### light background
![Screenshot](extra/light.jpg "The plum colorscheme with light background (language: go)")
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/light.jpg)
