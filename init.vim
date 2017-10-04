call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/c-syntax.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet-snippets',{ 'for': ['c', 'cpp'] } 
Plug 'Shougo/neosnippet.vim',{ 'for': ['c', 'cpp'] } 
Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar', { 'for': ['c', 'cpp'] }
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'ujihisa/neco-look'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'zchee/deoplete-clang',{ 'for': ['c', 'cpp'] }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-rooter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'takac/vim-hardtime'
"Colors
"Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'MaxSt/FlatColor'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'joshdick/onedark.vim'
"Plug 'preocanin/greenwint'
Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
"Plug 'NLKNguyen/papercolor-theme'
"seoul256-light
"Plug 'junegunn/seoul256.vim'
call plug#end()
set inccommand=split

let g:hardtime_default_on = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set background=dark
colorscheme flatcolor
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
"let g:gruvbox_contrast_dark = 'medium'

set relativenumber
set listchars=tab:>\ ,eol:¬
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
"set expandtab
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

let g:table_mode_header_fillchar='='
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_manual_only = 1

let g:tagbar_ctags_bin = '/usr/local/bin/ectags'
"let g:AutoPairsFlyMode = 1
let g:goyo_width = 160
let g:ranger_map_keys = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0
set grepprg=rg\ --color=never
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(so|mp3|mp4)$',
  \ }
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*.mp3,*.mp4,*.gif,*.jpg,*.png,*.swp,*.tmp,*.pdf,*.mkv
set wildignore+=Music,Desktop,Videos,data,Downloads,chromium
set wildignore+=.cache,.emacs.d,.mozilla,.Trash,.gimp*,.vim,.ssh,.npm
set wildignore+=*.7z,*.lz4,*.zip,*.gz,*.rar,*.bz2

let g:rg_command = 'rg --files --no-ignore --hidden --follow  
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

let g:clang_format#detect_style_file = 1
"cpp check:
let g:cpp_cppcheck_options = '--language=c --enable=all'

"ALE
nnoremap <leader>ts :ALEToggle<cr>
let g:ale_c_clang_options = '-std=c11 -Wall'
let g:ale_c_cppcheck_executable = 'cppcheck'
let g:ale_c_cppcheck_options = '--enable=style'
"let g:ale_c_cppcheck_options = '--language=c --enable=all'
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 0
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
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 0

"airline
let g:airline_theme='distinguished'
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
let g:deoplete#auto_complete_delay = 25
"use tab key
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/local/lib/libclang.so.6.0'
let g:deoplete#sources#clang#clang_header = '/usr/local/lib/clang/'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

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
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>% :vsp<CR>
nnoremap <leader>" :sp<CR>
nnoremap <leader>wd <C-W>c
nnoremap <leader>tl :lopen<CR>
nnoremap <leader>tld :lclose<CR>
nnoremap <leader>tln :lnext<CR>
nnoremap <leader>tlp :lprevious<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>ti :set list!<CR>

"paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]`

map <leader><leader><tab> :Stab<CR>
nnoremap <leader><leader>k :TagbarToggle<CR>

nnoremap <silent> zd :call Translate(expand("<cword>"), "de")<CR> nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
map <F9> :call CompileRunGcc()<CR>

nnoremap <leader>tn :call NumberToggle()<CR>
map <leader><leader>as :Assembly<CR>

"open Terminal
nnoremap <Leader>' :below 20sp term://$SHELL<cr>i
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
function! s:goyo_enter() abort
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      set scrolloff=999
      colorscheme Tomorrow-Night-Eighties
      Limelight 0.7
endfunction      

function! s:goyo_leave() abort
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      set scrolloff=7
      colorscheme flatcolor
      Limelight!
endfunction

func! CompileRunGcc() abort
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
  function! Translate(text, to_lang) abort
      if a:to_lang ==? "de"
          exe "!trans -b en:de \"" . a:text . "\""
      else
          exe "!trans -b de:en \"" . a:text . "\""
      endif
  endfunction

  "{{{Lines-Toggle:
  " toggle between number and relative number on ,l
  function! NumberToggle() abort
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
  function! Stab() abort
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
    
  "Compatibility with multiple cursors
  function g:Multiple_cursors_before()
         let g:deoplete#disable_auto_complete = 1
  endfunction
  function g:Multiple_cursors_after()
         let g:deoplete#disable_auto_complete = 0
   endfunction


""Autocommands
"autocmd CompleteDone * silent! pclose!

"":autocmd InsertEnter * set cul
"":autocmd InsertLeave * set nocul

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd VimResized * wincmd =
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])


"edit file anyway when swapfile exists, but issue a warning
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'e'
    autocmd SwapExists * echo 'Swapfile detected,edited anyway'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 1
augroup END

