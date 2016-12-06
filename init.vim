set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set mouse=a

set tabstop=4
set shiftwidth=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set expandtab

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
language en_US.UTF-8

set ts=4 sw=4 noet
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
colorscheme angr
set background=dark
syntax on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151551')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:cssColorVimDoNotMessMyUpdatetime = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/FuzzyFinder'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
" Plug 'skammer/vim-css-color'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'eparreno/vim-l9'
Plug 'vim-scripts/Greplace.vim'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'StanAngeloff/php.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-syntastic/syntastic'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'alessandroyorba/despacio'
Plug 'JulesWang/css.vim' 
" Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentline'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
call plug#end()

let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_setColors = 0
set number

autocmd FileType scss set iskeyword+=-

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-b><c-o>"

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

function! PhpSyntaxOverride()
      hi! def link phpDocTags  phpDefine
        hi! def link phpDocParam phpType
    endfunction

    augroup phpSyntaxOverride
          autocmd!
            autocmd FileType php call PhpSyntaxOverride()
        augroup END
