"" make tabs work in a helpful way
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.  set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

"" Use 2 space indent for sql files
autocmd Filetype sql setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

"" Remove trailing whitespaces for desired filetypes 
"" Want to specify filetypes so thios does not happen in things like markdown
"" where the trailing whitespaces matter

autocmd FileType python,sql autocmd BufWritePre <buffer> %s/\s\+$//e

"" If vim doesnt recognize a FileType define it by extension
autocmd BufWritePre *.ddl %s/\s\+$//e

" Set vim to use regualar clipboard need vim --version to show +clipboard
set clipboard=unnamed

"" Highlight column at breakpoint 80
set colorcolumn=80
highlight ColorColumn ctermbg=6

"" Plugs
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" helper to let youcompleteme and utilisnips play nice
Plug 'ervandew/supertab'

" Plugin for code completion
Plug 'valloric/youcompleteme'

" Plugin for better commenting
Plug 'tpope/vim-commentary'

" Plugin for multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Plugin that matches my Rstudio theme
Plug 'crusoexia/vim-monokai'

" Plugin that changes cursor for insert mode
Plug 'jszakmeister/vim-togglecursor'

" Plugin to send imput to tmux
" Plug 'matschaffer/vim-islime2'
" Plug 'jpalardy/vim-slime'
" Plug 'epeli/slimux'
" Plug 'jgdavey/tslime.vim'

" Plugin to navigate source tree
Plug 'scrooloose/nerdtree'

" Add git flags to NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plugin that easyclip is dependent on
Plug 'tpope/vim-repeat'

" Plugin to make vim work with clipboard better
" I have created .vim/after/plugin/vim-easyclip.vim to contain:
" :au VimEnter * :nunmap m 
" This makes m set marks again and for easyclip you need to hightlight in 
" visual mode first
Plug 'svermeulen/vim-easyclip'

" Plugin to check syntax  
Plug 'scrooloose/syntastic'

" make REPL work from vim
Plug 'sillybun/vim-repl'

" show vertical lines for indents
Plug 'yggdroot/indentline'

" make snippets work
Plug 'sirver/ultisnips'

" a bunch of default snippets
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()

" Set tmux instead of screen for vim-slime
" let g:slime_target = "tmux"

"" turn syntax highlighting on by default and set to monokai
syntax on
colorscheme monokai

" Enable the gui color as recomended in monokai readme
set termguicolors

"" Line Numbers
set nu!                       " set line numbers
set rnu!                      " set relative numbers
" au BufWinEnter * setl nu!
" au BufWinEnter * setl rnu!

"" trying to make insert cursor bahave differently than other modes
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
" set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver25-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait5
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Multi cursor mappins
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" " ISLIME2 settings
" let g:islime2_29_mode=1

" " Send current line
" nnoremap <silent> <Leader>i<CR> :ISlime2CurrentLine<CR>

" " Move to next line then send it
" " nnoremap <silent> <Leader>ij :ISlime2NextLine<CR>

" " Move to previous line then send it
" " nnoremap <silent> <Leader>ik :ISlime2PreviousLine<CR>

" " Send in/around text object - operation pending
" nnoremap <silent> <Leader>i :set opfunc=islime2#iTermSendOperator<CR>g@

" " Send visual selection
" vnoremap <silent> <Leader>i :<C-u>call islime2#iTermSendOperator(visualmode(), 1)<CR>

" " Send the whole file
" nnoremap <leader>f :%y r<cr>:call islime2#iTermSendNext(@r)<CR>

" Keymapping for SLIMUX
" map <Leader>s :SlimuxREPLSendLine<CR>
" vmap <Leader>s :SlimuxREPLSendSelection<CR>
" map <Leader>b :SlimuxREPLSendBuffer<CR>
" map <Leader>a :SlimuxShellLast<CR>
" map <Leader>k :SlimuxSendKeysLast<CR>

" Key mapping for vim-repl
let g:repl_program = {
            \   'python': 'ptpython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'vim': 'vim -e',
            \   }

nnoremap <leader>r :REPLToggle<Cr>
let g:repl_position = 3

" helpers
command Jpretty execute "%!python -m json.tool"
command NT execute ":NERDTreeToggle"

" auto use nerdtree if vim directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd w | endif

" close vim if NerdTree is the only thing still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make copy/paste from clipbaord work in the usual manner
" vnoremap <Leader>c :w !pbcopy<CR><CR> 
" noremap <Leader>v :r !pbpaste<CR><CR>

" " copy whole file to clipboard
" vnoremap <Leader>C :%w !pbcopy


" indentline settings
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"Utilisnip commands
" Check out this video for more info: http://vimcasts.org/episodes/meet-ultisnips/

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"" below is the old recomended version, delete once the above is working
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" keep marks
set viminfo='100,f1

" Settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {"regex": 'syntax error at or near "ignore"',
                                 \ "file": '/private/var/folders/qc'}
let g:syntastic_ignore_files = ['dev.env']
