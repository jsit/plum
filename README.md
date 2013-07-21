## Plum colorscheme

Plum is a vim colorscheme that support both light and dark background.
If you are a Mac OS X, Plum provides some functionalities that in conjunction
with autocommands allow to automatically switch between *dark* and *light* background
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

If you are running Mac OS X you can take advantage of the camera in front of you for detecting
the ambient light and change the colorscheme background accordingly.
Plum defines for you the function `plum#SetBgAccordingToAmbientLight()` so that you can use it
whenever you what to set the background (_dark_ or _light_) according to the current ambient light.
Normally you want to use it in conjunction with autocommands, e.g.:
```                                    vim
au VimEnter,FocusLost * call plum#SetBgAccordingToAmbientLight()
```


### Settings

Set in your `.vimrc` the options you find useful:

```vim
let g:plum_cursorline_highlight_only_linenr = 0
" Set this option to 1 (default is 0) to highlight only the current the line number
" when 'cursorline' is on.

let g:plum_threshold = 120000
" When the ambient light sensor read a value below this value, the background is
" set to 'dark', otherwise is set to 'light'.
" Note that the default value is somewhat arbitrary: the values read by the
" sensor span the range [0 - 67,092,408] but I've found that indoor the range
" is roughly [0 - 2,000,000]. To me, only below 120,000 (default) it seems
" reasonable to set a dark background but I also know this is just my preference.
" To find the value right for you check out the next option.

let g:plum_debug = 0
" Set this option to 1 to output the ambient light read by the sensor whenever the
" plum#SetBgAccordingToAmbientLight() is called. You might find this useful when
" the default threshold value does not suit your tastes and you want to find the
" right one for you.
```


### Screenshots

All screenshots have been taken from MacVim (font: GohuFont 14, language: go).

#### dark background
![Screenshot](extra/dark.jpg "The plum colorscheme with dark background (language: go)")
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/dark.jpg)

#### light background
![Screenshot](extra/light.jpg "The plum colorscheme with light background (language: go)")
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/light.jpg)
