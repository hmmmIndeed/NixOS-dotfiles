set number					" show line numbers on sidebar
set relativenumber	" show line num on current line, relative nums on all other lines
set clipboard=unnamedplus
set cursorline			" highlight cursorline undeneath cursor horizontally
set cursorcolumn		" highlight cursorline undeneath cursor vertically
set ttyfast
set title						" set window's title as file name
set background=dark	" use colors that suit a dark bg

set tabstop=2				" 2 spaces per indent
set shiftwidth=2		" 2 spaces to indent when shifting
set softtabstop=0
set noexpandtab			" don't convert tabs to spaces
set smartindent
set smarttab				" insert "tabstop" number of spaces when "tab" key is pressed
set linebreak				" avoid wrapping a line in the middle of a word
set scrolloff=2			" keep 2 screen lines to keep above and below the cursor
set spell						" enable spellchecking
syntax enable				" enable syntax highlighting
set foldmethod=indent	" fold based on indent levels
set foldnestmax=3		" only fold up to 3 nested levels

colorscheme kanagawa	" sets color scheme to kanagawa

nnoremap t :NERDTree	" runs NERDTree

" commands can't be on same line as command since the tab and " are registered
" as part of the command for some reason
" runs opened file in python, ran with ":PY"
command PY !python %
" runs opened file in bash, ran with ":SH"
command SH !bash %

" sources:
" https://www.meetgor.com/vim-keymaps/
