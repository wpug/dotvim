set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'

" color schemas {{{
Bundle 'beauty256'
Bundle 'desert256.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'endel/vim-github-colorscheme'
Bundle 'goatslacker/mango.vim'
Bundle 'mayansmoke'
Bundle 'molokai'
Bundle 'marcus/vim-mustang'
Bundle 'tabula.vim'
Bundle 'trivial256'
Bundle 'tpope/vim-vividchalk'
Bundle 'xoria256.vim'
Bundle 'wombat256.vim'
" }}}

" utilities {{{
Bundle 'bufkill.vim'
Bundle 'IndentAnything'
Bundle 'mru.vim'
Bundle 'The-NERD-Commenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-speeddating'
" SnipMate - begin
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'wpug/snipmate-snippets'
Bundle 'honza/vim-snipmate'
" SnipMate - end
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-unimpaired'
Bundle 'VisIncr'
Bundle 'wpug/vim-utl-calutil'
" }}}

" languages {{{
Bundle 'wpug/vim-lang-alloy4'
Bundle 'Better-CSS-Syntax-for-Vim'
Bundle 'wpug/vim-lang-html'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-Indent'
Bundle 'groenewege/vim-less'
Bundle 'jinfield/vim-nginx'
Bundle 'guileen/vim-node'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'adimit/prolog.vim'
Bundle 'promela'
Bundle 'promela.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'derekwyatt/vim-sbt'
" }}}

" programming utilities {{{
Bundle 'walm/jshint.vim'
Bundle 'jpalardy/vim-slime'
Bundle 'harleypig/vcscommand.vim'
Bundle 'mattn/zencoding-vim.git'
" }}}

set number

" Set <F2> as the toggle key between the 'paste' and 'insert' modes
set pastetoggle=<F2>

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
set t_Co=256

try 
    colorscheme xoria256
catch
    colorscheme elflord
endtry

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Tabstops are 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Turn tabs into spaces
set expandtab

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=cesB$

" Set the status line the way i like it
set stl=%f\ %y\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{&ff}

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode
set nowrap

" Switch on syntax highlighting.
syntax on

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" get rid of the silly characters in window separators
set fillchars=""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" code folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Buffer commands
noremap <silent> ,bd :bd<CR>
 
" Let's make it easy to edit this file (mnemonic for the key sequence is
" " 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>
"
" " And to source this file as well (mnemonic for the key sequence is
" " 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>

:let g:html_tag_case = 'lowercase'
:let g:html_default_charset = 'utf-8'
:let g:no_html_map_override = 'yes'
:let NERDTreeIgnore=['\.vim$', '\~$', '\.class', '\.bak', '\.class']

nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\\(\\<[aiowuz]\\>\\)\\s*/\\1\\&nbsp;/geic<Bar>:%s%\\<\\([aiouw]&nbsp;\\)\\_$\\n\\s*\\(\\S\\+\\)\\s*%\\1\\2\\r%geic<Bar>:let @/=_s<CR>

" easy switching buffers in normal mode
nmap <A-PageDown> :bn<CR>
nmap <A-PageUp> :bp<CR>
" NERD_Tree toggle
nmap <F12> :NERDTreeToggle<CR>
" Delete current buffer
nmap <C-W><Del> :BD<CR>

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.als set ft=alloy4
au BufNewFile,BufRead *.pro set ft=prolog
" Turn off paren matching for Prolog files
au BufNewFile,BufRead *.pro NoMatchParen

if has("autocmd")
    autocmd FileType javascript set makeprg=jslint\ %
    autocmd FileType javascript set efm=%f:%l:%c:%m
    nnoremap <silent> <F5> :make <CR>:cw<CR>
    " inoremap <silent> <F5> <C-O>:make %<CR><C-O>:cw<CR>
    nnoremap <silent> <C-F5> :cn<CR>
    nnoremap <silent> <S-F5> :cp<CR>
    autocmd FileType javascript set equalprg=jsbeautifier\ -f\ %
    autocmd FileType javascript,scala setlocal list
    autocmd BufNewFile,BufRead *.json setf javascript
    "set tab width for specific file types (default == 4)
    autocmd FileType html,jade,css setlocal ts=2 sts=2 sw=2 list
endif

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Define symbols for TAB stops and EOLs
" set listchars=tab:➾\ ,eol:⏎
" set listchars=tab:▸\ ,eol:∙
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59 
highlight SpecialKey guifg=#4a4a59
highlight NonText ctermfg=240
highlight SpecialKey ctermfg=002

" detect and source the local vimrc
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
