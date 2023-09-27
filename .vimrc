syntax enable
let mapleader = " "
autocmd BufEnter * lcd %:p:h
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/suda.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'
Plug 'yegappan/mru'
" Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'

Plug 'jacoborus/tender.vim'
Plug 'patstockwell/vim-monokai-tasty'

Plug 'itchyny/lightline.vim'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'

" Initialize plugin system
call plug#end()

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m""]"


let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
let g:vim_monokai_tasty_machine_tint = 1              " use `mahcine` colour variant
let g:vim_monokai_tasty_highlight_active_window = 1   " make the active window stand out
silent! colorscheme vim-monokai-tasty                         " set the colorscheme

" Optional themes for airline/lightline
let g:airline_theme='monokai_tasty'                   " airline theme
let g:lightline = { 'colorscheme': 'monokai_tasty'  }  " lightline theme
"
" " If you don't like a particular colour choice from `vim-monokai-tasty`, you
" can
" " override it here. For example, to change the colour of the search
" hightlight:
hi Search guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold
"
" " If you want to know what the name of a particular hightlight is, you can
" use
" " `:What`. It prints out the syntax group that the cursor is currently
" above.
" "
" https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
" command! What echomsg synIDattr(synID(line('.'), col('.'), 1), 'name')"

set number
set relativenumber
set termguicolors
set clipboard=unnamed,unnamedplus
set ignorecase
set smartcase
set smartindent
set mouse=a
set wrap! 
set cmdheight=1
set timeoutlen=500
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set re=0
set autochdir!
set autowrite



inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent><tab> <Cmd>Buffers<CR>
nnoremap <silent><tab><tab> <Cmd>Files<CR>

nnoremap <silent><S-UP> <Cmd>m-2<CR>
nnoremap <silent><S-Down> <Cmd>m+1<CR>

nnoremap <silent>m<Up> <Cmd>resize -2<CR>
nnoremap <silent>m<Down> <Cmd>resize +2<CR>
nnoremap <silent>m<Right> <Cmd>vertical resize +5<CR>
nnoremap <silent>m<Left> <Cmd>vertical resize -5<CR>
nnoremap <silent> X <Cmd>:noh<cr>

"COC configuration
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Cmd>TagbarToggle<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')




nnoremap <silent><leader>e <Cmd>CocCommand explorer<CR>

noremap <leader><Down> <C-w>j
noremap <leader><Up> <C-w>k
noremap <leader><Right> <C-w>l
noremap <leader><Left> <C-w>h
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <silent><leader>fs <Cmd>Ag<CR>

nmap <leader>cr <Plug>(coc-rename)
xmap <leader>cf  <Cmd>call CocAction('format')<CR>
nmap <leader>cf  <Cmd>call CocAction('format')<CR>
nmap <leader>cc  <Plug>(coc-codeaction-cursor)
nmap <leader>cq  <Plug>(coc-fix-current)
"
" hi SpellBad       gui=undercurl  term=undercurl cterm=undercurl ctermbg=NONE  guibg=NONE
" hi SpellCap       gui=undercurl  term=undercurl cterm=undercurl ctermbg=NONE  guibg=NONE	
" hi SpellRare  	  gui=undercurl  term=undercurl cterm=undercurl ctermbg=NONE  guibg=NONE
" hi SpellLocal 	  gui=undercurl  term=undercurl cterm=undercurl ctermbg=NONE  guibg=NONE




