filetype plugin indent on
syntax on
syntax enable

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set showcmd
set nowrap
set linebreak
set hidden
set undofile
set undodir=~/tmp/vim/undo
set laststatus=2
set notitle
set wildmenu
set wildmode=longest:full,full
set synmaxcol=1000 " Avoids editor lockup in files with extremely long lines."
set listchars=eol:$
set termguicolors
"set autowriteall  " <---- huh??
"set colorcolumn=80
" Elimiate delay switching to normal mode
"set timeoutlen=500 ttimeoutlen=0

" leader
let mapleader = ","
" nnoremap <Space> <Nop>
" let maplocalleader=" "
set completeopt=menu,menuone,noselect

" backup to ~/.tmp
" disabled for coc
"set backup
"set backupdir=~/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/tmp,/tmp
"set writebackup
" for coc.vim
"set nobackup
"set nowritebackup

" mouse select and scroll
set mouse=a

noremap <leader>. :wa<cr>

" clear highlighted search results.
nnoremap <silent> <c-l> :noh<cr>

" don't advance when searching with *
nnoremap <silent> <Leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * :keepjumps normal! mi*`i<CR>
" search for selection
" Esc to clear the selection, then search for the last selected thing.
vnoremap * "9y<Esc>/<C-r>9<CR>
vnoremap # "9y<Esc>?<C-r>9<CR>

" resize windows faster
nnoremap <C-w>, <C-w>10<
nnoremap <C-w>. <C-w>10>

" readline emulation
inoremap <C-d> <Del>
inoremap <C-t> <Esc>xpa
inoremap <C-b> <Left>
vnoremap <C-b> <Left>
inoremap <C-f> <Right>
vnoremap <C-f> <Right>
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a

" Navigate through wrapped lines intuitively
imap <silent> <down> <c-o>gj
imap <silent> <up> <c-o>gk
nmap <silent> <down> gj
nmap <silent> <up> gk
nmap <silent> j gj
nmap <silent> k gk

" close quickfix
nnoremap <leader>a :cclose<cr>

" Normal mode
nnoremap <F1> <Esc>
" Insert and Replace mode
inoremap <F1> <Esc>
" Visual and Select mode
vnoremap <F1> <Esc>
" Visual mode
xnoremap <F1> <Esc>
" Select mode
snoremap <F1> <Esc>
" Command-line mode
cnoremap <F1> <Esc>
" Operator pending mode
onoremap <F1> <Esc>


"-------------------------------------------------------------
" custom functions
"-------------------------------------------------------------
function! PutsDate()
    put =strftime('# %c')
endfunction
command! Date call PutsDate()


"-------------------------------------------------------------
" filetype adjustments
"-------------------------------------------------------------
" autocmd FileType eruby setlocal commentstring=<!--\ %s\ -->

" autocmd BufNewFile,BufRead *.tf         set ft=terraform
" autocmd BufNewFile,BufRead *.tfvars     set ft=terraform
" autocmd BufWritePre *.js Neoformat

" I think this was from when i was using a plugin for removing trailing
" whitespace
" let g:extra_whitespace_ignored_filetypes = ['TelescopePrompt']


"-------------------------------------------------------------
" clipboard
"-------------------------------------------------------------
if !empty($WSL_DISTRO_NAME)
    let g:clipboard = {
        \   'name': 'WslClipboard',
        \   'copy': {
        \      '+': 'clip.exe',
        \      '*': 'clip.exe',
        \    },
        \   'paste': {
        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

" yank selection to system clipboard
vnoremap Y "+y
" yank line to system clipboard without trailing newline
nnoremap Y ^"+y$
" yank line to system clipboard
nnoremap YY "+yy
" paste from system clipboard
nnoremap + "+p

function! CopyFilnameToClipboard()
    let @+=@%
    execute 'file'
endfunction

command! CopyFname call CopyFilnameToClipboard()


"-------------------------------------------------------------
" searching
"-------------------------------------------------------------
" global search prompt
nnoremap \ :Rg ''<Left>
" global search for whole word under cursor using '|' character
nnoremap <bar> :Rg '\b<cword>\b'<CR>
" global search for word under cursor as text (with no word boundary)
" nnoremap g\ :Rg <cword><CR>
" global search for selection (<Esc> clears the range)
vnoremap \ "9y<Esc>:Rg '<C-r>9'<CR>

" search for selection
" Esc to clear the selection, then search for the last selected thing.
vnoremap * "9y<Esc>/<C-r>9<CR>
vnoremap # "9y<Esc>?<C-r>9<CR>
