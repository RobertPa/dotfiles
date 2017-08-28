let g:pathogen_disabled = [ 'vim-better-whitespace' ]
execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim

nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

set background=dark
colorscheme triplejelly

se title
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set shell=/bin/sh

filetype on
filetype plugin on
filetype indent on

set number
syntax on
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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set history=200
set undolevels=200
set undofile
set undodir=~/.vim/undodir

hi CursorLineNr ctermfg=blue

let g:AutoPairsFlyMode = 1

cmap w!! w !sudo tee > /dev/null %"
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
nnoremap <Leader>fs :w<CR>
nnoremap <leader>m :MRU<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <;> :VimShellCurrentDir<CR>
nnoremap <silent> zd :call Translate(expand("<cword>"), "de")<CR>
nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
nnoremap <leader><leader>k :TagbarToggle<CR>
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunction

let g:ranger_map_keys = 0
nnoremap <leader>ar :Ranger<CR>

"reopen previously opened file
nnoremap <Leader><Leader> :e#<CR>

nnoremap <leader>bd :bd<CR>

nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>bb :CtrlPBuffer<CR>
"reindex file for command-T pressing leader-r:
noremap <Leader>r :CommandTFlush<CR>
"ignore some file in command-t:
set wildignore+=*.mp3,*.mp4,*.gif,*.jpg,*.png

" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added thttps://www.reddit.com/user/cbmusero command).
function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
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

  "paste multiple lines multiple times with simple ppppp.
  vnoremap <silent> y y`]
  vnoremap <silent> p p`]
  nnoremap <silent> p p`]`

  "{{{Nerdtree:
  "Don't show some files in tree:
  let NERDTreeIgnore=['\.DS_Store', '\.swp', '\.jpg', '\.png', '\.mp3','\.mp4']

  "open/close nerdtree with ctrl-n:
  nnoremap <leader>nt :NERDTree<CR>
  "map  <S-l> :tabn<CR>
  "map  <S-h> :tabp<CR>
  "nnoremap  <leader><leader>t :tabnew<CR>

  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = '▼'
  "let NERDTreeMapActivateNode='<right>'
  "autocmd VimEnter * NERDTree
  "autocmd VimEnter * wincmd p
  "}}}

"{{{Spellcheck:
  "spellcheck with shift-s
  nnoremap <leader>tS :set spell!<CR>
  set spelllang=en_us
  hi SpellBad    ctermfg=000      ctermbg=011     cterm=bold
  "}}}

"autoformt
  let g:formatterpath = ['/usr/bin/astyle --style=java']
  noremap <F5> :Autoformat<CR>

  "cpp check:
  let g:cpp_cppcheck_options = '--language=c --enable=all'

  "{{{Syntax-Check:
  "Syntax-Check with leader-s
  nnoremap <leader>ts ::SyntasticCheck<CR>
  nnoremap <leader>tsq ::SyntasticReset<CR>
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_error_symbol = ""
  let g:syntastic_warning_symbol = ""
  let g:syntastic_c_compiler = "gcc"
  let g:syntastic_cpp_compiler_options = "-Wall -pedantic"
  "}}}
  
  let g:neocomplete#enable_at_startup = 1
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ neocomplete#start_manual_complete()

function! s:check_back_space()
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
              \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


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
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)



  "set cursorline    " enable the horizontal line
  "set cursorcolumn  " enable the vertical line
  "hi CursorLine   ctermbg=darkgrey
  "hi CursorColumn  ctermbg=darkgrey

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
     let g:airline_left_sep = '»'
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '«'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.linenr = '␊'
     let g:airline_symbols.linenr = '␤'
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
    
""  let g:lightline = {
"              \ 'colorscheme': 'jellybeans',
"              \ 'component_function': {
"              \ 'filetype': 'MyFiletype',
"             \ 'fileformat': 'MyFileformat',
"              \}
"              \}
"

  map <leader><leader>a :Assembly<CR>
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

  "sneak:
  nmap f <Plug>Sneak_s
  nmap F <Plug>Sneak_S
  xmap f <Plug>Sneak_s
  xmap F <Plug>Sneak_S
  omap f <Plug>Sneak_s
  omap F <Plug>Sneak_S

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
  nnoremap <leader>l :call NumberToggle()<CR>
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


  "edit file anyway when swapfile exists, but issue a warning!
  augroup NoSimultaneousEdits
      autocmd!
      autocmd SwapExists * let v:swapchoice = 'e'
      autocmd SwapExists * echo 'Swapfile detected,edited anyway'
      autocmd SwapExists * echohl None
      autocmd SwapExists * sleep 1
  augroup END

  "{{{ Handle tabstop, softtabstop and shiftwidth
  map <leader><leader><tab> :Stab<CR>

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


  "open pdfs in vim through  pdftotext-package
  autocmd BufReadPre *.pdf silent set ro
  autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk  -layout -q -eol unix "%" - | fmt -w78

  "open more documents in vim:
  " Read-only .doc through antiword
  autocmd BufReadPre *.doc silent set ro
  autocmd BufReadPost *.doc silent %!antiword "%"

  " Read-only odt/odp through odt2txt
  autocmd BufReadPre *.odt,*.odp silent set ro
  autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

  autocmd BufReadPre *.xls silent set ro
  autocmd BufReadPost *.xls silent setlocal nowrap
  autocmd BufReadPost *.xls silent %!xls2csv -c\| -b$'\n'$'\n' -q0 "%"
  autocmd BufReadPost *.xls silent %Tableize/|
  autocmd BufReadPost *.xls silent 1g/^/ TableModeRealign
  autocmd BufReadPost *.xls silent %g/\(^\n\)\@<=|/ TableModeRealign

  " For jpegs
  autocmd BufReadPre *.jpg,*.jpeg silent set ro
  autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"
  " For other image formats
  autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
  autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a  --width=78 -


  "copy everything to clipboard with <F3>
  vmap <leader>c :call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

  nmap <Leader>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

  " NERDTress File highlighting
"  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"      exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"      exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"  endfunction

  "call NERDTreeHighlightFile('sh', 'green', 'none', 'green', '#151515')
  "call NERDTreeHighlightFile('awk', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('h', 'blue', 'none', '#3366FF', '#151515')
  "call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  "call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  "call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  "call NERDTreeHighlightFile('c', 'Red', 'none', '#ffa500', '#151515')
  "call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
  "call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
  "call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
  "call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  "call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
  "call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
