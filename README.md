## Plum colorscheme

Plum is a vim colorscheme for any occasion.

### Usage

1. Copy `plum.vim` to `~/.vim/colors`

2. Set in your `.vimrc` the desired default background before setting the colorscheme:

    ```vim
    set bg=dark
    colorscheme plum
    ```

3. Set in your `.vimrc` the desired colorscheme options: 
    
    - **g:plum_cursorline_highlight_only_linenr**: set this option to 1 (default is 0) to highlight only the current the line number when `cursorline` is set.
     
4. To switch between dark and light background set the following mapping in your `.vimrc`:

    ```vim
    nnoremap <silent> <F7> :exe 'set bg=' . (&bg == 'dark' ? 'light' : 'dark')<CR>   
    ```

### Screenshots

All screenshots have been taken from MacVim (font: GohuFont 13, language: go).

#### dark background
![Screenshot](extra/dark.jpg "The plum colorscheme with dark background (language: go)")   

#### light background
![Screenshot](extra/light.jpg "The plum colorscheme with light background (language: go)")   
