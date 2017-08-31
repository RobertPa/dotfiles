
call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/c-syntax.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vinarise'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-webdevicons'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'zchee/deoplete-clang'
Plug 'chriskempson/vim-tomorrow-theme'
call plug#end()

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"gruvbox, triplejelly,molokai,PaperColor
set background=dark
colorscheme molokai 

se title
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set shell=/usr/local/bin/fish
set dictionary=/usr/share/dict/words

filetype on

set number
hi Visual ctermfg=000 ctermbg=011

let mapleader = "\<Space>"
inoremap jk <ESC>
inoremap <C-j> <C-o>A

set mouse=n
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set scrolloff=7

set visualbell
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set history=200
set undolevels=200
set undofile
set wildmenu
set wildmode=full
set clipboard+=unnamedplus

hi CursorLineNr ctermfg=blue

let g:AutoPairsFlyMode = 1
let g:goyo_width = 160
let g:ranger_map_keys = 0
let g:ctrlp_show_hidden = 1
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

set wildignore+=*.mp3,*.mp4,*.gif,*.jpg,*.png

let g:clang_format#detect_style_file = 1
"cpp check:
let g:cpp_cppcheck_options = '--language=c --enable=all'

let g:ale_c_clang_options = '-std=c11 -Wall'
let g:ale_c_cppcheck_executable = 'cppcheck'
let g:ale_c_cppcheck_options = '--enable=style'
"let g:ale_c_cppcheck_options = '--language=c --enable=all'
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_fixers = {}
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {}
let g:ale_linters = {}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 0

"airline
let g:airline_theme='deus'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
 " airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"sneak:
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"deoplete
let g:deoplete#enable_at_startup = 1
"use tab key
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/local/lib/libclang.so.5.0'
let g:deoplete#sources#clang#clang_header = '/usr/local/lib/clang/'


"{{{Search:
  "highlight searches make line blink
  hi Search guibg=red
  set hlsearch
  " Use shift-C to clear hlsearch
  map  <S-c> :nohlsearch<CR>

  nnoremap <silent> n n:call HLNext(0.4)<cr>
  nnoremap <silent> N N:call HLNext(0.4)<cr>

  function! HLNext (blinktime)
      set invcursorline
      redraw
      exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
      set invcursorline
      redraw
  endfunction
  "}}}

"{{{Spellcheck:
  "spellcheck with shift-s
  nnoremap <leader>tS :set spell!<CR>
  set spelllang=en_us
  set complete+=kspell
  hi SpellBad    ctermfg=000      ctermbg=011     cterm=bold
  "}}}

"autoformt
"let g:formatterpath = ['/usr/local/bin/astyle --style=java']
"noremap <F5> :Autoformat<CR>
noremap <F5> :ClangFormat<CR>

nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)

nnoremap <Leader>fs :w<CR>
nnoremap <leader>m :MRU<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>bb :CtrlPBuffer<CR>
nnoremap <leader>% :vsp<CR>
nnoremap <leader>" :sp<CR>

"paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]`

map <leader><leader><tab> :Stab<CR>
nnoremap <leader><leader>k :TagbarToggle<CR>

nnoremap <silent> zd :call Translate(expand("<cword>"), "de")<CR> nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
map <F9> :call CompileRunGcc()<CR>

nnoremap <leader>l :call NumberToggle()<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>ar :Ranger<CR>
map <leader><leader>as :Assembly<CR>

nnoremap <Leader>' :terminal<CR>
"reopen previously opened file
nnoremap <Leader><Leader> :e#<CR>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"copy/paste everything to/from system-clipboard
vmap <leader>y :call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <Leader>p :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
              \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)



"Functions
"_________________________________________________________________

"Reader Mode with goyo+limelight
function! s:goyo_enter()
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      set scrolloff=999
      colorscheme Tomorrow-Night-Eighties
      Limelight 0.7
endfunction      

function! s:goyo_leave()
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      set scrolloff=7
      colorscheme molokai 
      Limelight!
endfunction

func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunction

"
" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added ).
function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction


function! s:check_back_space()
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

    function! Assembly()
      colorscheme triplejelly
      set syntax=nasm
  endfunction

  command! -nargs=* Assembly call Assembly()

function! MyFiletype()
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
      return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction


"translate-de-en:
  function! Translate(text, to_lang)
      if a:to_lang ==? "de"
          exe "!trans -b en:de \"" . a:text . "\""
      else
          exe "!trans -b de:en \"" . a:text . "\""
      endif
  endfunction

  "{{{Lines-Toggle:
  " toggle between number and relative number on ,l
  function! NumberToggle()
      if(&number == 1)
          set number!
          set relativenumber!
          hi CursorLineNr ctermfg=blue

      elseif(&relativenumber==1)
          set relativenumber!
      else
          set norelativenumber
          set number
      endif
  endfunction
  "}}}

   "{{{ Handle tabstop, softtabstop and shiftwidth

  command! -nargs=* Stab call Stab()
  function! Stab()
      let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
      if l:tabstop > 0
          let &l:sts = l:tabstop
          let &l:ts = l:tabstop
          let &l:sw = l:tabstop
      endif
 call SummarizeTabs()
  endfunction

  function! SummarizeTabs()
      try
          echohl ModeMsg
          echon 'tabstop='.&l:ts
          echon ' shiftwidth='.&l:sw
          echon ' softtabstop='.&l:sts
          if &l:et
              echon ' expandtab'
          else
              echon 'noexpandtab'
          endif
      finally
          echohl None
      endtry
  endfunction "end of setting tabstop,stoftt..and shiftwidth
  "}}}

""Autocommands
autocmd CompleteDone * silent! pclose!

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd VimResized * wincmd =
  
"edit file anyway when swapfile exists, but issue a warning
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'e'
    autocmd SwapExists * echo 'Swapfile detected,edited anyway'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 1
augroup END

