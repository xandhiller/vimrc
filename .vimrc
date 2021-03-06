"  APPEARANCE/INPUT 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"
colorscheme peachpuff
syntax on
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set splitright 
set splitbelow
set number 
set relativenumber
set confirm
set cmdheight=1
set autoindent
set linebreak
set ignorecase
set smartcase
set cursorline
set wildmenu
set hlsearch
set updatetime=100
set colorcolumn=81
hi Visual       cterm=reverse
hi ColorColumn  ctermbg=3
hi LineNr       ctermfg=29
hi CursorLineNr cterm=reverse   ctermfg=29
hi Folded       ctermfg=61      ctermbg=none
hi VertSplit    ctermbg=42      ctermfg=41
hi StatusLine   ctermbg=black   ctermfg=41
hi StatusLineNC ctermbg=black   ctermfg=23
hi CursorLine   cterm=none      ctermbg=237
hi String ctermfg=35
hi Number ctermfg=134


"  PLUG-INS [start]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim/ 
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'     
Plugin 'scrooloose/nerdtree'      
	map <C-n> :NERDTreeToggle<CR>
Plugin 'xuhdev/vim-latex-live-preview'
  let g:livepreview_previewer = 'okular'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'JuliaEditorSupport/julia-vim'
  let g:latex_to_unicode_file_types = ".*" 
Plugin 'junegunn/goyo.vim'
  let g:goyo_width=85
  let g:goyo_margin_top=0
  let g:goyo_margin_bottom=0
  nnoremap <C-c> :Goyo<CR>
  inoremap <C-c> <Esc>:Goyo<CR>i
  vnoremap <C-c> <Esc>:Goyo<CR>
  function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
  endfunction
  function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    highlight CursorLineNr ctermfg=red
  endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
Plugin 'vimwiki/vimwiki'
  let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  call vundle#end()
  filetype plugin indent on
  let s:vimwiki = {}
  let s:vimwiki.path = '~/vimwiki'
  let s:vimwiki.ext = '.md'
  let s:vimwiki.syntax = 'default'
  let s:vimwiki.ext2syntax = {}
  let g:vimwiki_list = [s:vimwiki]
Plugin 'connorholyday/vim-snazzy'

if !has('gui_running')
  set t_Co=256
endif


"  SHORTCUTS/MAPPINGS/ABREVIATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile the current document into markdown syntax pdf.
nnoremap <Leader>md :w<CR>:silent ! livemd.py %:p %:p<CR>:source $MYVIMRC<CR>
" Moving around windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Resizing windows
noremap <C-Left>  5<C-w><
noremap <C-Down>  5<C-w>+
noremap <C-Up>    5<C-w>-
noremap <C-Right> 5<C-w>>
" Refresh vimrc
inoremap <F5>   <Esc>:source<Space>$MYVIMRC<CR>:echom ".vimrc refreshed"<CR>i
nnoremap <F5>   :source<Space>$MYVIMRC<CR>:echom ".vimrc refreshed"<CR>
vnoremap <F5>   <Esc>:source<Space>$MYVIMRC<CR>:echom ".vimrc refreshed"<CR>
" Unmapping rubbish keys
nnoremap Q      <Nop>
vnoremap Q      <Nop>
vnoremap <F8>   <Nop>
vnoremap <F6>   <Nop>
vnoremap <F7>   <Nop>
nnoremap <F3>   <Nop>
nnoremap <F4>   <Nop>
inoremap <F3>   <Nop>
inoremap <F4>   <Nop>
inoremap <F9>   <Nop>
nnoremap <F9>   <Nop>
vnoremap <F9>   <Nop>
inoremap <F10>  <Nop>
nnoremap <F10>  <Nop>
vnoremap <F10>  <Nop>
inoremap <F11>  <Nop>
nnoremap <F11>  <Nop>
vnoremap <F11>  <Nop>
inoremap <F12>  <Nop>
nnoremap <F12>  <Nop>
vnoremap <F12>  <Nop>
" Hardcore Vim
nnoremap <Home>   <Nop>
nnoremap <End>    <Nop>
nnoremap <Right>  <Nop>
nnoremap <Left>   <Nop>
nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>
inoremap <Right>  <Nop>
inoremap <Left>   <Nop>
inoremap <Up>     <Nop>
inoremap <Down>   <Nop>
vnoremap <Right>  <Nop>
vnoremap <Left>   <Nop>
vnoremap <Up>     <Nop>
vnoremap <Down>   <Nop>
" Copy and paste to the clipboard
set clipboard=unnamedplus
inoremap <C-y> <Nop>
nnoremap <C-y> <Nop>
vnoremap <C-y> "+y
inoremap <C-p> <Esc>"+pi
nnoremap <C-p> "+p
vnoremap <C-p> "+p
" Make saving quicker
nnoremap SS :w<CR>
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
nnoremap K 0i<BS><Space><Esc>h
nnoremap v <C-v>
nnoremap <Leader>m :marks abcdefghijklmnopqrstuvwxyz<CR>
nnoremap <Leader>dm :delmarks abcdefghijklmnopqrstuvwxyz<CR>:echom "Marks deleted."<CR>
let g:EIGHTY=0
set colorcolumn=81
function! EIGHTYon()
  highlight ColorColumn ctermbg=grey
endfunction
function! EIGHTYoff()
  highlight ColorColumn ctermbg=none
endfunction
function! EIGHTYtoggle()
  if !g:EIGHTY
    let g:EIGHTY=1
    call EIGHTYon()
  else 
    let g:EIGHTY=0
    call EIGHTYoff()
  endif
endfunction
"call EIGHTYtoggle()
call EIGHTYoff()
nnoremap <Leader>cl :call EIGHTYtoggle()<CR>
" Text Hooks
vnoremap <Leader><Leader> /<++><Enter>
nnoremap <Leader><Leader> /<++><Enter>
nnoremap <Leader>' <Esc>/++><Enter>h"_c4l
inoremap <Leader><Leader> <Esc>/<++><Enter>
inoremap <Leader>' <Esc>/++><Enter>h"_c4l
vnoremap <Leader><Leader> /<++><Enter>
" Paste hook?
nnoremap <Leader>vv :vsplit<Space>~/.vimrc<Enter>
nnoremap <Leader>bb :vsplit<Space>~/.bashrc<Enter>
vnoremap <Leader>h <Esc><++>
inoremap <Leader>h <++>
nnoremap <Leader>h i<++><Esc>
vnoremap <Leader>h <Esc>i<++><Esc>
" Commenting out paragraphs or lines
nnoremap <Leader>/ {j>ip0<C-v>}0kc#<Esc>
nnoremap <Leader>? {j<C-v>}k0x<ip
" Run python file
nnoremap <Leader>r :w<CR>:! clear && python3 %<CR>
nnoremap <Leader>R :w<CR>:! clear && time python3 %<CR>
" Automatically make a notes file in the same firecotry as current file and 
"   open it in vsplit
nnoremap <Leader>nn :vsp %:p:h/_notes.md<CR>
" Turn off highlight search
nnoremap <Leader><CR> :noh<CR>
" Insert a line of space above and below the line you're on
nnoremap <Leader>o ko<Esc>jjO<Esc>k
nnoremap o o<Esc>
nnoremap O O<Esc>
" Change the character below the cursor to uppercase.
nnoremap <Leader>u vu
nnoremap <Leader>U vU
nnoremap <Leader>f zfip
nnoremap <Leader>e zD
nnoremap <Leader>E zE
nnoremap <Leader>F zfip}j
nnoremap <Leader>= <C-w>=
nnoremap <Leader>co :vsp col<CR>:source ~/.colorDemo.vim<CR>
nnoremap QQ :q!<CR>
nnoremap Y y$


" FILETYPE SPECIFIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown set tabstop=4 shiftwidth=4
autocmd FileType wiki set tabstop=4 
" LaTeX Settings
function! InputTex()
  nnoremap  <Leader>m :call ToggleMATH()<CR>
  nnoremap  <Leader>m :call ToggleMATH()<CR>
" nnoremap  <Leader>n :call ToggleNOTES()<CR>
" nnoremap  <Leader>n :call ToggleNOTES()<CR>
endfunction
autocmd FileType tex call InputTex()


" TEX MATH MODE 
"   shortcuts to improve the experience of writing equations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:MATH=0
" MATH TOGGLE
function! ToggleMATH()
  if !g:MATH
    call MATHon()
  else 
    call MATHOff()
  endif
endfunction
" MATH ON
function! MATHon()
  echo "MATH macros ACTIVATED."
  let g:MATH=1
  inoremap  <Leader>s \sum^{<++>}_{<++>}<++><esc>Bi
  inoremap  <Leader>e \begin{equation}<Enter><Enter><Esc>0i\end{equation}<Enter><Enter><++><Esc>3kA<Space><Space><++><Esc>k0i
  inoremap  <Leader>i \int^{<++>}_{<++>}<++><esc>Bi
  inoremap  <Leader>f \frac{<++>}{<++>}<++><esc>Bi
  inoremap  <Leader><space> ^{<++>}_{<++>}<++><esc>/\^<CR>Ni
  inoremap  <Leader>t \text{<++>}<++><esc>Bi
  inoremap  <Leader>d \frac{d}{d<++>}\left( <++> \right)<esc>/frac<CR>Nhi
  " ---- More infrequent bindings are bound with "o" for "operation"
  inoremap  <Leader>ol \Lapl{<++>}<++><esc>Bi
  inoremap  <Leader>oL \Lapl{<++>} = \int^{\infty}_{0} <++> e^{st} dt = <++><esc>/Lapl<CR>Nhi
  inoremap  <Leader>ti \mathit{<++>}<++><esc>Bi 
  inoremap  <Leader>tb \mathbf{<++>}<++><esc>Bi 
endfunction
" MATH OFF
function! MATHOff()
  echo "MATH macros DEACTIVATED."
  let g:MATH=0
  unmap <Leader>s
  unmap <Leader>e
  unmap <Leader>i
  unmap <Leader>f
  unmap <Leader><space>
  unmap <Leader>t
  unmap <Leader>d
  unmap <Leader>ol
  unmap <Leader>oL
  unmap <Leader>ti \textit{<++>}<++><esc>Bi 
  unmap <Leader>tb \textbf{<++>}<++><esc>Bi 
endfunction


" TEX NOTES MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap  <Leader>n <esc>:call ToggleNOTES()<CR>
" nnoremap  <Leader>n :call ToggleNOTES()<CR>
let g:NOTES=0
function! ToggleNOTES()
  if !g:NOTES
    call NOTESon()
  else 
    call NOTESoff()
  endif
endfunction
function! NOTESon()
  let g:NOTES=1
  echo "NOTE macros ACTIVATED."
endfunction
function! NOTESoff()
  let g:NOTES=0
  echo "NOTE macros DEACTIVATED."
endfunction


" IGNORE FILES VIM DOESN'T USE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
