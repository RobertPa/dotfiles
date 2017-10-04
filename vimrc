call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/c-syntax.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet-snippets',{ 'for': ['c', 'cpp'] } 
Plug 'Shougo/neosnippet.vim',{ 'for': ['c', 'cpp'] } 
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'wellle/targets.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ujihisa/neco-look'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'jez/vim-superman'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter'
"Colors
Plug 'MaxSt/FlatColor'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"nmap <silent> <S-Up> :wincmd k<CR>
"nmap <silent> <S-Down> :wincmd j<CR>
"nmap <silent> <S-Left> :wincmd h<CR>
"nmap <silent> <S-Right> :wincmd l<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"gruvbox, triplejelly,molokai,PaperColor
set background=dark
colorscheme gruvbox

se title
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set shell=/bin/sh
set dictionary=/usr/share/dict/words

filetype on
filetype plugin on
filetype indent on
set number
if !exists("g:syntax_on")
    syntax enable
endif
hi Visual ctermfg=000 ctermbg=011

let mapleader = "\<Space>"
inoremap jk <ESC>
inoremap <C-j> <C-o>A
set mouse=n
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch

"set tabstop=4
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
set undodir=~/.vim/undodir
set wildmenu
set wildmode=full
set autoread
 
hi CursorLineNr ctermfg=blue

let g:AutoPairsFlyMode = 1

let g:goyo_width = 160

let g:ranger_map_keys = 0
set grepprg=rg\ --color=never

set wildignore+=*.mp3,*.mp4,*.gif,*.jpg,*.png

let g:clang_format#detect_style_file = 1
"cpp check:
let g:cpp_cppcheck_options = '--language=c --enable=all'

  "{{{Syntax-Check:
  "Syntax-Check with leader-s
  "nnoremap <leader>ts ::SyntasticCheck<CR>
  "nnoremap <leader>tsq ::SyntasticReset<CR>
  "let g:syntastic_always_populate_loc_list = 1
  "let g:syntastic_auto_loc_list = 1
  "let g:syntastic_check_on_open = 0
  "let g:syntastic_check_on_wq = 0
  "let g:syntastic_cpp_check_header = 1
  "let g:syntastic_error_symbol = ""
  "let g:syntastic_warning_symbol = ""
  "let g:syntastic_c_compiler = "clang"
  "let g:syntastic_cpp_compiler_options = "-Wall -pedantic"
  "}}}
 
let g:ale_c_clang_options = '-std=c11 -Wall'
let g:ale_c_cppcheck_executable = 'cppcheck'
let g:ale_c_cppcheck_options = '--enable=style'
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

"Don't show some files in tree:
let NERDTreeIgnore=['\.DS_Store', '\.swp', '\.jpg', '\.png', '\.mp3','\.mp4']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '▼'

let g:neocomplete#enable_at_startup = 1
let g:necosyntax#min_keyword_length=2
let g:neocomplete#max_list=50
let g:neocomplete#max_keyword_width=40
let g:neocomplete#auto_completion_start_length=2
let g:neocomplete#manual_completion_start_length=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#disable_auto_complete=0
let g:neocomplete#enable_auto_delimiter=1

if !exists('g:neoinclude#exts')
    let g:neoinclude#exts = {}
endif
let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hxx']

let g:neosnippet#snippets_directory= '~/.vim/bundle/vim-snippets/'

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

cmap w!! w !sudo tee > /dev/null %"
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)

nnoremap <Leader>fs :w<CR>
nnoremap <leader>m :MRU<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>% :vsp<CR>
nnoremap <leader>" :sp<CR>
nnoremap <leader>wd <C-W>c
nnoremap <leader>tl :lopen<CR>
nnoremap <leader>tld :lclose<CR>
nnoremap <leader>tln :lnext<CR>
nnoremap <leader>tlp :lprevious<CR>

"paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]`

map <leader><leader><tab> :Stab<CR>
nnoremap <leader><leader>k :TagbarToggle<CR>

nnoremap <silent> zd :call Translate(expand("<cword>"), "de")<CR> nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
map <F9> :call CompileRunGcc()<CR>

nnoremap <leader>tn :call NumberToggle()<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>ar :Ranger<CR>
map <leader><leader>as :Assembly<CR>
"reopen previously opened file
nnoremap <Leader><Leader> :e#<CR>
"reindex file for command-T pressing leader-r:
noremap <Leader>r :CommandTFlush<CR>
nnoremap <Leader>' :VimShellCurrentDir<CR>

command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>

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

  "neocomplete <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ neocomplete#start_manual_complete()
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
              \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"copy/paste everything to/from system-clipboard
vmap <leader>y :call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <Leader>p :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

"Functions
"_________________________________________________________________

"avoid conflict between neocomplete and multiple cursors
function! Multiple_cursors_before()
      if exists(':NeoCompleteLock')==2
          exe 'NeoCompleteLock'
      endif
endfunction

function! Multiple_cursors_after()
      if exists(':NeoCompleteUnlock')==2
              exe 'NeoCompleteUnlock'
      endif
endfunction

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
      colorscheme gruvbox
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


"open pdfs in vim through  pdftotext-package
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk  -layout -q -eol unix "%" - | fmt -w78

" Read-only odt/odp through odt2txt
autocmd BufReadPre *.odt,*.odp silent set ro
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

autocmd BufReadPre *.xls silent set ro
autocmd BufReadPost *.xls silent setlocal nowrap
autocmd BufReadPost *.xls silent %!xls2csv -c\| -b$'\n'$'\n' -q0 "%"
autocmd BufReadPost *.xls silent %Tableize/|
autocmd BufReadPost *.xls silent 1g/^/ TableModeRealign
autocmd BufReadPost *.xls silent %g/\(^\n\)\@<=|/ TableModeRealign

