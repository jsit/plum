## Plum colorscheme

Plum is a vim colorscheme for any occasion.

### Usage

1. Copy `plum.vim` to `~/.vim/colors` or use your favorite plugin manager such as 
[Vundle](https://github.com/gmarik/vundle), [Pathogen](https://github.com/tpope/vim-pathogen) 
or [Neobundle](https://github.com/Shougo/neobundle.vim).

2. Set in your `.vimrc` the desired default background before setting the colorscheme:

    ```vim
    set bg=dark
    colorscheme plum
    ```

3. Set in your `.vimrc` the desired colorscheme options: 

    ```vim
    " set this option to 1 (default is 0) to highlight only the current the line number when 'cursorline' is on.                                                                                                                                  
    let g:plum_cursorline_highlight_only_linenr = 1
    ```
     
4. To switch between dark and light background set the following mapping in your `.vimrc`:

    ```vim
    nnoremap <silent> <F7> :exe 'set bg=' . (&bg == 'dark' ? 'light' : 'dark')<CR>   
    ```

### Screenshots

All screenshots have been taken from MacVim (font: GohuFont 13, language: go).

#### dark background
![Screenshot](extra/dark.jpg "The plum colorscheme with dark background (language: go)")   
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/dark.jpg)

#### light background
![Screenshot](extra/light.jpg "The plum colorscheme with light background (language: go)")   
[see full size](https://raw.github.com/gcmt/plum.vim/master/extra/light.jpg)
