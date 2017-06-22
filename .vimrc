inoremap jk <ESC>
vnoremap <C-c> "*y
let mapleader=","
filetype off

" Basic Settings

filetype plugin indent on
syntax on
set mouse=a
set visualbell
set encoding=utf-8
set shell=/bin/bash
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set modelines=0
set nocompatible
set autoindent
set showmode
set showcmd
set ruler
set colorcolumn=80,100,120
set numberwidth=5
set foldcolumn=3
set wildmenu
set wildmode=list:longest,full
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set rnu

highlight FoldColumn guifg=black guibg=black
highlight ColorColumn ctermbg=52

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

colo koehler
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%f\ %l,%c
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:typescript_indent_disable = 1
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
autocmd BufNewFile,BufRead *.ts  set filetype=typescript
let g:pencil#autoformat = 1

" Relative line numbering goodness
" use <Leader>L to toggle the line number counting method
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <Leader>L :call g:ToggleNuMode()<cr>
set nornu
colorscheme termschool
set clipboard=unnamed
map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_smart_startup_focus=1
let g:nerdtree_tabs_focus_on_files=0
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1
map <Leader>t :tabe 
" Enable slim syntax highlight
" autocmd FileType slim setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'ruby', 'javascript', 'python', 'bash=sh']
hi clear SpellBad
let &t_Cs = "\e[6m"
let &t_Ce = "\e[24m""]"
hi SpellBad gui=undercurl term=underline cterm=underline

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g --nocolor""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" "nnoremap \ :Ag<SPACE>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text,txt call pencil#init()
augroup END

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
set autoread

" Mimic RubyMine <C-d> : duplicate line
map <C-d> yyp

nnoremap <Leader>l :ls<CR> :b<space>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
