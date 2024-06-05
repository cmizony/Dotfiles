"    _____ __  __ _____ __________  _   ___     __                 _
"   / ____|  \/  |_   _|___  / __ \| \ | \ \   / /                (_)
"  | |    | \  / | | |    / / |  | |  \| |\ \_/ /   ______  __   ___ _ __ ___  _ __ ___
"  | |    | |\/| | | |   / /| |  | | . ` | \   /   |______| \ \ / / | '_ ` _ \| '__/ __|
"  | |____| |  | |_| |_ / /_| |__| | |\  |  | |              \ V /| | | | | | | | | (__
"   \_____|_|  |_|_____/_____\____/|_| \_|  |_|               \_/ |_|_| |_| |_|_|  \___|
"
"
" 1. Easy navigation in .vimrc:
"   Use <Leader>ig to view indentation guides
"   Use <Leader>z0 or z1 to navigate between summary folds
"   Use <gx> to open plugin url links
"   Use <F12> to get some help for some commands
"
" 2 Summary list of external dependencies:
"   # Install desired patched font (for devicons and powerline)
"   git config --global github.user <username>
"   git config --global alias.tree "log --oneline --decorate --all --graph" # $git tree
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   vim # :PluginInstall
"   cd ~/.vim/bundle/tern_for_vim && npm install
"   cd ~/.vim/bundle/vimtips-fortune/fortunes && strfile vimtips
"   mkdir -p ~/.vim/colors && cp ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors/
"   sudo apt-get install exuberant-ctags fortune-mod cowsay tidy vim-gtk xdg-utils
"   sudo npm -g install instant-markdown-d eslint vint jsonlint
"   sudo apt-get install ack
"   npm install -g prettier
"
" 3. Other scripts
"   Update the list with following command:
"   grep "DO" ~/.vimrc | grep -v "grep" | sed 's/[[:space:]]\+" TODO//' | sort
"   Find merged local merged branches (you can pipe to remove them):
"   comm -12  <(git branch --merged|awk '{print($1)}') (git branch -r --merged|awk '{print($1)}'|awk -F \/ '{print($2)}')


"  ___    __     ___             ____  _             _
" |_ _|   \ \   / (_)_ __ ___   |  _ \| |_   _  __ _(_)_ __  ___
"  | |     \ \ / /| | '_ ` _ \  | |_) | | | | |/ _` | | '_ \/ __|
"  | | _    \ V / | | | | | | | |  __/| | |_| | (_| | | | | \__ \
" |___(_)    \_/  |_|_| |_| |_| |_|   |_|\__,_|\__, |_|_| |_|___/
"                                              |___/
"
" Vundle Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" --------------------
" Language {
" --------------------
  " https://vimawesome.com/plugin/vim-prettier-who-speaks {
    " Wrapper for prettier, pre-configured
    Plugin 'prettier/vim-prettier'
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
  " } Config Plugin End

  " http://vimawesome.com/plugin/vim-exchange
  " Easy text exchange operator for Vim.
    Plugin 'tommcdo/vim-exchange'

  " http://vimawesome.com/plugin/typescript-vim
  " Syntax file and other settings for TypeScript
    Plugin 'leafgarland/typescript-vim'

  " http://vimawesome.com/plugin/surround-vim
  " Surroundings parentheses, brackets, quotes
    Plugin 'tpope/vim-surround'

  " http://vimawesome.com/plugin/vim-js-pretty-template {
    " Highlight JavaScript's Template Strings contents
    Plugin 'quramy/vim-js-pretty-template'
    " autocmd FileType javascript JsPreTmpl html
    " autocmd FileType typescript JsPreTmpl html
  " } Config Plugin End

  " http://vimawesome.com/plugin/tsuquyomi {
    " Tsuquyomi works as a client for TSServer
      Plugin 'quramy/tsuquyomi'
      let g:tsuquyomi_auto_open = 0
      let g:tsuquyomi_disable_default_mappings = 1
      let g:tsuquyomi_completion_detail = 0
      let g:tsuquyomi_single_quote_import = 1
  " } Config Plugin End

  " https://vimawesome.com/plugin/ale-be-who-we-are {
    " ASYNCHRONOUS LINT ENGINE
    Plugin 'dense-analysis/ale'
    let g:ale_virtualtext_cursor = 0
    let g:ale_virtualtext_prefix = ""
    let g:ale_hover_enabled = 0
    let g:ale_set_highlights = 0
    let b:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint']}
    let g:ale_linter_aliases = {'jsx': ['css', 'javascript'], 'tsx': ['css', 'typscript']}
    let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'tsx': ['stylelint', 'tslint']}
    let g:ale_lint_on_text_changed = "never"
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    " let g:ale_lint_on_save = 0
    let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '!'
    " let g:ale_close_preview_on_insert = 1
    let g:ale_set_loclist = 1
    " let g:ale_set_quickfix = 1
    let g:ale_list_window_size = 5
  " } Config Plugin End

  " http://vimawesome.com/plugin/instant-markdown-vim {
    " Instantly preview markdown files
    Plugin 'suan/vim-instant-markdown'
    " TODO sudo npm -g install instant-markdown-d
    " TODO sudo apt-get install xdg-utils # Ubuntu installed by default
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  " } Config Plugin End
" }

  " --------------------
  " Code Display {
  " --------------------
    " http://vimawesome.com/plugin/vim-jsx
    Plugin 'mxw/vim-jsx'

    " https://vimawesome.com/plugin/vim-jsx-pretty
    " Both plugin for Typescript
    Plugin 'HerringtonDarkholme/yats.vim'
    Plugin 'maxmellon/vim-jsx-pretty'

    " http://vimawesome.com/plugin/vim-css-color-the-story-of-us
    Plugin 'ap/vim-css-color'
    " http://vimawesome.com/plugin/solarized
    Plugin 'altercation/solarized'

    " http://vimawesome.com/plugin/indentline {
      Plugin 'Yggdroot/indentLine'
      let g:indentLine_char = '¦'
      " let g:indentLine_char_list = ['|', '¦', '┆', '┊']
      " let g:indentLine_enabled = 0
    " } Config Plugin End

  " }
  " --------------------
  " Integrations {
  " --------------------
    " http://vimawesome.com/plugin/vim-rhubarb
    " Enables :GBrows for fugitive
    Plugin 'tpope/vim-rhubarb' 

    " http://vimawesome.com/plugin/fugitive-vim {
      Plugin 'tpope/vim-fugitive'
      let g:fugitive_github_domains = ['github.com']
      " let g:fugitive_github_domains = ['github.com', 'git.musta.ch']
      " let g:github_enterprise_urls = ['https://git.musta.ch']
      set diffopt+=iwhite
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-peekaboo {
      " Shows the contents of the registers on the sidebar
      Plugin 'junegunn/vim-peekaboo'
      let g:peekaboo_prefix = '<Leader>'
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-gitgutter
    " Shows a git diff in the sign column
    Plugin 'airblade/vim-gitgutter'

    " http://vimawesome.com/plugin/vim-tmux-navigator {
      " VIM TMUX NAVIGATOR
      Plugin 'christoomey/vim-tmux-navigator'
      " TODO Add tmux navigator config in .tmux.conf
      " is_vim='echo "#{pane_current_command}" | grep -iqE
      " "(^|\/)g?(view|n?vim?)(diff)?$"'
      " bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
      " bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
      " bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
      " bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
      " bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"'
    " } Config Plugin End

  " --------------------
  " Interface {
  " --------------------
    " http://vimawesome.com/plugin/nerdtree-git-plugin
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                    \ 'Modified'  :'✔︎',
                    \ 'Staged'    :'+',
                    \ 'Untracked' :'?',
                    \ 'Renamed'   :'➜',
                    \ 'Unmerged'  :'═',
                    \ 'Deleted'   :'✗',
                    \ 'Dirty'     :'✗',
                    \ 'Ignored'   :'✗',
                    \ 'Clean'     :'✔︎',
                    \ 'Unknown'   :'?',
                    \ }
    " http://vimawesome.com/plugin/unite-vim
    " Search information from files, buffers, registers.
    Plugin 'Shougo/unite.vim'
    " http://vimawesome.com/plugin/neoyank-vim
    " Saves yank history and allows browsing
    Plugin 'shougo/neoyank.vim'
    " http://vimawesome.com/plugin/vim-unite-giti
    " Unite source for using git
    Plugin 'kmnk/vim-unite-giti'
    " http://vimawesome.com/plugin/unite-mark
    Plugin 'tacroe/unite-mark'
    " http://vimawesome.com/plugin/unite-quickfix
    Plugin 'osyo-manga/unite-quickfix'
    " http://vimawesome.com/plugin/unite-colorscheme
    Plugin 'ujihisa/unite-colorscheme'
    " http://vimawesome.com/plugin/unite-outline-love-story
    Plugin 'shougo/unite-outline'
    " http://vimawesome.com/plugin/vim-unite-history
    Plugin 'thinca/vim-unite-history'
    " http://vimawesome.com/plugin/unite-tag
    Plugin 'tsukkee/unite-tag'
    " http://vimawesome.com/plugin/ack-vim
    " Can be used as a replacement for 99% of the uses of grep
    " TODO `sudo apt-get install ack`
    Plugin 'mileszs/ack.vim'
    " http://vimawesome.com/plugin/buffergator
    " Select and switch between buffers
    Plugin 'jeetsukumaran/vim-buffergator'
    let g:buffergator_split_size = 30
    let g:buffergator_vsplit_size = 30
    let g:buffergator_viewport_split_policy = "R"
    let g:buffergator_autoupdate = 1
    let g:buffergator_sort_regime = "mru"

    " http://vimawesome.com/plugin/quickmenu {
      Plugin 'skywind3000/quickmenu.vim'
      let g:quickmenu_options = "HL"
      let g:quickmenu_disable_nofile=0
      function! CreateMenu()
        call g:quickmenu#reset()

        " section 1
        call g:quickmenu#append('# <FN> Shortcuts',  '')
        call g:quickmenu#append('<F1> Quickmenu',    ':tabnew +/"\ <FN> ~/.vimrc',  'Open this menu')

        " section 2
        call g:quickmenu#append('# <Leader> Prefix',      '')
        call g:quickmenu#append('<Leader>a Tabularize',   ':tabnew +/"\ <Leader>a ~/.vimrc',  'Tabularize')
        call g:quickmenu#append('<Leader>b Buffergator',  ':tabnew +/"\ <Leader>b ~/.vimrc',  'Buffergator')
        call g:quickmenu#append('<Leader>c Copy/ChangePath',     ':tabnew +/"\ <Leader>c ~/.vimrc',  'CopyPath')
        call g:quickmenu#append('<Leader>z Folding',      ':tabnew +/"\ <Leader>z ~/.vimrc',  'Code folding')
        call g:quickmenu#append('<Leader>e Edit help',    ':tabnew +/"\ <Leader>e ~/.vimrc',  'Edit Helpers')
        call g:quickmenu#append('<Leader>f FN keys',      ':tabnew +/"\ <Leader>f ~/.vimrc',  'Function Keys')
        call g:quickmenu#append('<Leader>g Git',          ':tabnew +/"\ <Leader>g ~/.vimrc',  'Git')
        call g:quickmenu#append('<Leader>i Indents',      ':tabnew +/"\ <Leader>i ~/.vimrc',  'Indents')
        call g:quickmenu#append('<Leader>b Bookmarks',    ':tabnew +/"\ <Leader>m ~/.vimrc',  'Bookmarks')
        call g:quickmenu#append('<Leader>n Nerd Tree',    ':tabnew +/"\ <Leader>n ~/.vimrc',  'Nerd tree')
        call g:quickmenu#append('<Leader>o Open',       ':tabnew +/"\ <Leader>o ~/.vimrc',  'Open')
        call g:quickmenu#append('<Leader>p Ctrl-P',       ':tabnew +/"\ <Leader>p ~/.vimrc',  'Ctrl-P')
        call g:quickmenu#append('<Leader>r Signature',    ':tabnew +/"\ <Leader>r ~/.vimrc',  'Signature')
        call g:quickmenu#append('<Leader>s Motion',       ':tabnew +/"\ <Leader>s ~/.vimrc',  'Easy motion')
        call g:quickmenu#append('<Leader>u Unite',        ':tabnew +/"\ <Leader>u ~/.vimrc',  'Unite')
        call g:quickmenu#append('<Leader>v VimShell',     ':tabnew +/"\ <Leader>v ~/.vimrc',  'VimShell')
        call g:quickmenu#append('<Leader>t tsuquyomi',    ':tabnew +/"\ <Leader>t ~/.vimrc',  'Typescript')
        call g:quickmenu#append('<Leader>l Last',        ':tabnew +/"\ <Leader>l ~/.vimrc',  'Last')

        " section 3
        call g:quickmenu#append('# How To',          '')
        call g:quickmenu#append('Window Swap',       'tabnew +/Plugin.*windowswap.$ ~/.vimrc',        'Navigate window you want to move then the one you want to swap with')
        call g:quickmenu#append('Tab Rename',        'tabnew +/Plugin.*taboo\.vim.$ ~/.vimrc',        'Renames the current tab with the name provided')
        call g:quickmenu#append('Grep Search',       'tabnew +/Plugin.*ack\.vim.$ ~/.vimrc',          ':Ack [Options] {Pattern} [{Directories}]')
        call g:quickmenu#append('Multiple cursors',  'tabnew +/Plugin.*multiple-cursors.$ ~/.vimrc',  'Use multiple cursors')
        call g:quickmenu#append('Use Sessions',      'tabnew +/Plugin.*obsession.$ ~/.vimrc',         'Remember sessions')
        call g:quickmenu#append('Trim Space',        ':tabnew +/TrimWhiteSpace() ~/.vimrc',           'Function to Trim white space in current file')
        call g:quickmenu#append('Delete Buffers',    ':tabnew +/DeleteHiddenBuffers() ~/.vimrc',      'Function to delete hidden buffers')
        call g:quickmenu#append('Text Objects',      ':help text-objects',                            'Vim text objects doc')
        call g:quickmenu#append('Record',            ':help record',                                  'Vim record doc')

        " Toggle window
        call quickmenu#toggle(0)
      endfunction
    " }

    " http://vimawesome.com/plugin/taboo-vim {
      " Utility for pretty tabs
      Plugin 'gcmt/taboo.vim'
      " Use TabooRename <tabname> && TabooReset
      let g:taboo_tabline=0
      set sessionoptions+=tabpages,globals
    " }

    " http://vimawesome.com/plugin/ctrlp-vim-state-of-grace {
      " Fuzzy file search
      Plugin 'kien/ctrlp.vim'
      " Load sub folder in buffer: `argadd app/sub/directory/**/*.js`
      let g:ctrlp_max_files=0
      let g:ctrlp_lazy_update = 1
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)|(\.(swp|js|js\.map))$'
      let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
    " } Config Plugin End

    " http://vimawesome.com/plugin/the-nerd-tree {
      Plugin 'scrooloose/nerdtree'
      let NERDTreeWinSize=30
      let NERDTreeShowHidden=1
      let NERDTreeKeepTreeInNewTab=1
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-nerdtree-tabs {
      Plugin 'jistr/vim-nerdtree-tabs'
      let g:nerdtree_tabs_open_on_console_startup=1
      " let g:nerdtree_tabs_autofind=1
      let g:nerdtree_tabs_open_on_new_tab=1
      let g:nerdtree_tabs_smart_startup_focus=2
    " } Config Plugin End

    " http://vimawesome.com/plugin/gundo {
      " Visualize your Vim undo tree
      Plugin 'sjl/gundo.vim'
      let g:undotree_SetFocusWhenToggle=1
      let g:gundo_width=40
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-startify {
      " Start screen for Vim 
      Plugin 'mhinz/vim-startify'
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-airline-sad-beautiful-tragic {
      Plugin 'bling/vim-airline'
      Plugin 'vim-airline/vim-airline-themes'
      set laststatus=2
      let g:airline_theme = 'solarized'
      " TODO # Install desired patched font (for powerline)
      " git clone https://github.com/powerline/fonts
      "[A]" mkdir -p ~/.fonts && mv desiredFonts ~/.fonts
      "[A]" fc-cache -vf ~/.fonts/
      "[B]" bash install.sh
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline#extensions#obsession#enabled = 0
    " } Config Plugin End
    
  " }
  " --------------------
  " Commands {
  " --------------------
    " http://vimawesome.com/plugin/copypath-vim
    " Copy file path to clipboard
    Plugin 'copypath.vim'

    " http://vimawesome.com/plugin/repeat-vim
    " Remaps . in a way that plugins can tap into it.
    Plugin 'tpope/vim-repeat'

    " http://vimawesome.com/plugin/matchit-zip
    " % to match more than just " single characters.
    Plugin 'matchit.zip'

    " http://vimawesome.com/plugin/unimpaired-vim
    " Pairs of handy bracket mappings
    Plugin 'tpope/vim-unimpaired'

    " http://vimawesome.com/plugin/tcomment
    " Extend commenting capabilities
    Plugin 'tomtom/tcomment_vim'

    " http://vimawesome.com/plugin/obsession-vim
    " :mksession to write a file with current state of Vim
    " Use :Obsess (with optional file/directory name) to start recording to a
    " session file and :Obsess!
    Plugin 'tpope/vim-obsession'

  " }
  " --------------------
  " Others {
  " --------------------
    " http://vimawesome.com/plugin/vim-windowswap
    " Press <leader>ww to pin and repeat to swap window
    Plugin 'wesq3/vim-windowswap'

    " http://vimawesome.com/plugin/vim-easymotion-state-of-grace
    Plugin 'easymotion/vim-easymotion'

    " http://vimawesome.com/plugin/vim-signature {
      " Place, toggle and display marks
      Plugin 'kshenoy/vim-signature'
      let g:SignatureMarkTextHLDynamic = 1
    " } Config Plugin End

    " http://vimawesome.com/plugin/indentwise {
      " [- : Move to previous line of lesser indent than the current line.
      " [+ : Move to previous line of greater indent than the current line.
      " [= : Move to previous line of same indent as the current line that
      " [% : Move to beginning of indent-block scope
      " ]- : Move to next line of lesser indent than the current line.
      " ]+ : Move to next line of greater indent than the current line.
      " ]= : Move to next line of same indent as the current line that
      " ]% : Move to end of indent-block scope
      Plugin 'jeetsukumaran/vim-indentwise'
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-bookmarks {
      " Allows toggling bookmarks per line
      Plugin 'mattesgroeger/vim-bookmarks'
      let g:bookmark_no_default_key_mappings = 1
    " } Config Plugin End

    " http://vimawesome.com/plugin/editorconfig-vim
    " Parse and configure using https://editorconfig.org
    Plugin 'editorconfig/editorconfig-vim'

    " http://vimawesome.com/plugin/vimtips-fortune {
      Plugin 'hobbestigrou/vimtips-fortune'
      let g:fortune_vimtips_auto_display=0

    " http://vimawesome.com/plugin/largefile {
      Plugin 'LargeFile'
      let g:LargeFile=10
    " } Config Plugin End
  " }

  call vundle#end()            " required
  filetype plugin indent on    " required


"  ___ ___    __     ___             _   _       _   _
" |_ _|_ _|   \ \   / (_)_ __ ___   | \ | | __ _| |_(_)_   _____
"  | | | |     \ \ / /| | '_ ` _ \  |  \| |/ _` | __| \ \ / / _ \
"  | | | | _    \ V / | | | | | | | | |\  | (_| | |_| |\ V /  __/
" |___|___(_)    \_/  |_|_| |_| |_| |_| \_|\__,_|\__|_| \_/ \___|
"
"
" Linux config tips:
"   Remap <esc> to <caps>: `setxkbmap -option caps:swapescape`
"   export TERM=xterm-256color

  let mapleader=";"
  set t_Co=256
  colorscheme solarized
  " ------------
  " BasicConfig {
  " ------------
    " TODO sudo apt-get install vim-gtk
    set autoread                   " When a file is changed from the outside
    set autoindent                 " text indenting
    set backspace=indent,eol,start " allow backspace in insert mode
    set clipboard=unnamedplus,unnamed " Require vim-gtk to paste OS clipboard
    set lazyredraw                 " No redraw while executing macros (good performance config)
    set cursorline                 " Highlight current line
    set colorcolumn=100            " Set gray bar at 100 character
    set encoding=utf8              " Set utf8 as standard encoding and en_US as the standard language
    set fileencodings+=utf-8
    set expandtab
    set ffs=unix,dos,mac           " Use Unix as the standard file type
    set foldlevelstart=20
    set foldmethod=indent
    set hidden                     " Allow buffer switching without saving
    set history=200                " lines of command history
    set hlsearch                   " highlight searched-for phrases
    set ignorecase                 " Ignore case when searching
    set incsearch                  " highlight search as you type
    set nocompatible               " breaks compatibility with original vi
    set nojoinspaces               " Prevents inserting two spaces after punctuation on a join (J)
    set noswapfile
    set number                     " display current line number
    set relativenumber nonu
    set scrolloff=3                " Scroll when cursor gets within 3 characters of top/bottom edge
    set shiftwidth=2               " as above
    set showcmd                    " show incomplete commands
    set showmatch                  " Show matching brackets when text indicator is over them
    set smartcase                  " When searching try to be smart about cases
    set smartindent                " as above
    set softtabstop=2              " as above
    set splitbelow                 " Puts new split windows to the bottom of the current
    set splitright                 " Puts new vsplit windows to the right of the current
    set synmaxcol=900              " Turn off syntax highlighting for long lines
    set tabpagemax=15              " Only show 15 tabs
    set tabstop=2                  " number of spaces in a tab
    set mouse=a                    " Allow mouse usage
    set tags=./tags;/              " Search tags from current to root directory
    set wildmenu                   " Turn on the WiLd menu
    set autowrite                  " Automatically write a file when leaving a modified buffer
    set list                       " show whitespace
    set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:• " Show whitespace
  " }

  " ---------------
  " ShortCut config {
  " ---------------

    " <Leader>p Ctrl-P & paste {
      " http://vimawesome.com/plugin/ctrlp-vim-state-of-grace
      nmap <Leader>pw <C-P><C-\>w
      nmap <Leader>ps <C-P><C-\>s
      nmap <Leader>pf :CtrlP<CR>
      nmap <Leader>pm :CtrlPMRUFiles<CR>
      nmap <Leader>pb :CtrlPBuffer<CR>
      nmap <Leader>px :CtrlPMixed<CR>
      nmap <Leader>pk :CtrlPBookmark<CR>
      nmap <Leader>pq :CtrlPQuickfix<CR>
      nmap <Leader>pc :CtrlPClearCache<CR>
      nmap <Leader>pt :set invpaste paste?<CR>
    " } Config ShortCut End

    " <Leader>i Indents {
      " http://vimawesome.com/plugin/javascript-indent
      nmap <Leader>il :IndentLinesToggle<CR>
      " nmap <Leader>in <Plug>(IndentWiseNextEqualIndent)
      " nmap <Leader>ip <Plug>(IndentWisePreviousEqualIndent)
      " Note: <Leader> ig = Indent guides
      " Use tidy to indent html attribute on selected line (visual mode)
      nmap <silent> <Leader>ic :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
      vmap <silent> <Leader>ic :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
      nmap <silent> <Leader>it :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
      vmap <silent> <Leader>it :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
    " } Config ShortCut End

    " <Leader>g Git {
      " http://vimawesome.com/plugin/fugitive-vim
      " http://vimawesome.com/plugin/vim-gitgutter
      nnoremap <silent> <leader>gs :Git status<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Git commit<CR>
      nnoremap <silent> <leader>gb :Git blame<CR>
      nnoremap <silent> <leader>gl :Gclog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gr :Gread<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>ge :Gedit<CR>
      " Mnemonic _i_nteractive
      nnoremap <silent> <leader>gi :Git add -p %<CR>
      nnoremap <silent> <leader>gg :SignifyToggle<CR>
      " Git gutter signs
      nnoremap <silent> <leader>gg :GitGutterSignsToggle<CR>
      " Find merge conflict markers
      map <leader>gm /\v^[<\|=>]{7}( .*\|$)<CR>
      " Display all lines with keyword under cursor and ask which one to jump to
    " } Config ShortCut End

    " <Leader><Leader> Easy motion search {
      " http://vimawesome.com/plugin/vim-easymotion-state-of-grace
      nmap <leader>s <Plug>(easymotion-bd-W)
      nmap <leader>sa <Plug>(easymotion-bd-w)
      nmap <leader>sA <Plug>(easymotion-bd-W)
      nmap <leader>sl <Plug>(easymotion-bd-jk)
    " } Config ShortCut End

    " <Leader>v VimShell {
      " http://vimawesome.com/plugin/vimshell-vim
      nmap <leader>v :VimShellPop<CR>
      nmap <leader>vs :VimShellPop<CR>
      nmap <leader>vt :VimShellTab<CR>
    " } Config ShortCut End

    " <Leader>c Copy/ChangePath {
      " http://vimawesome.com/plugin/copypath-vim
      nmap <leader>cp :CopyPath<CR>
      nmap <leader>cf :CopyFileName<CR>
      nmap <leader>cd :cd %:p:h<CR>:pwd<CR>
    " }

    " <Leader>b Buffergator {
      " http://vimawesome.com/plugin/buffergator
      nmap <leader>bb :BuffergatorToggle<CR>
      nmap <leader>bft :BuffergatorTabsToggle<CR>
      nmap <leader>bd :call DeleteHiddenBuffers()<CR>
    " }

    " <Leader>a Tabularize ShortCuts {
      " http://vimawesome.com/plugin/tabular
      nmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
      nmap <leader>a: :Tabularize /:<CR>
      nmap <leader>a:: :Tabularize /:\zs<CR>
      nmap <leader>a, :Tabularize /,<CR>
      nmap <leader>a,, :Tabularize /,\zs<CR>
      nmap <leader>a<Bar> :Tabularize /<Bar><CR>
    " } Config ShortCut End

    " <Leader>e Edit Helpers {
      " http://vimcasts.org/e/14
      cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
      map <leader>ew :e %%
      map <leader>es :sp %%
      map <leader>ev :vsp %%
      map <leader>et :tabe %%
    " } Config ShortCut End

    " <Leader>d Code folding options {
      " http://vim.wikia.com/wiki/Folding
      nmap <leader>z0 :set foldlevel=0<CR>
      nmap <leader>z1 :set foldlevel=1<CR>
      nmap <leader>z2 :set foldlevel=2<CR>
      nmap <leader>z3 :set foldlevel=3<CR>
      nmap <leader>z4 :set foldlevel=4<CR>
      nmap <leader>z5 :set foldlevel=5<CR>
      nmap <leader>z6 :set foldlevel=6<CR>
      nmap <leader>z7 :set foldlevel=7<CR>
      nmap <leader>z8 :set foldlevel=8<CR>
      nmap <leader>z9 :set foldlevel=9<CR>
      nmap <leader>za :set foldlevel=100<CR>
    " } Config ShortCut End

    " <Leader>n Nerd tree {
      " http://vimawesome.com/plugin/the-nerd-tree
      nmap <leader>nt :NERDTreeTabsToggle<CR>
      nmap <leader>nf :NERDTreeTabsFind<CR>
    " } Config ShortCut End

    " <Leader>r Signature {
      " http://vimawesome.com/plugin/vim-signature
      nmap <leader>rl :SignatureListMarks<CR>
      nmap <leader>rr :SignatureRefresh<CR>
      nmap <leader>rt :SignatureToggleSigns<CR>
    " }

    " <Leader>b Bookmarks {
      " http://vimawesome.com/plugin/vim-bookmarks
      nmap <Leader>bm <Plug>BookmarkToggle
      nmap <Leader>bi <Plug>BookmarkAnnotate
      nmap <Leader>ba <Plug>BookmarkShowAll
      nmap <Leader>bj <Plug>BookmarkNext
      nmap <Leader>bk <Plug>BookmarkPrev
      nmap <Leader>bc <Plug>BookmarkClear
      nmap <Leader>bx <Plug>BookmarkClearAll
      nmap <Leader>bkk <Plug>BookmarkMoveUp
      nmap <Leader>bjj <Plug>BookmarkMoveDown
      nmap <Leader>bg <Plug>BookmarkMoveToLine
    " } Config Bookmarks End

    " <Leader>u Unite {
      nmap <Leader>ub :Unite -start-insert buffer<CR>
      nmap <Leader>uc :Unite -start-insert colorscheme<CR>
      nmap <Leader>uf :Unite -start-insert file_rec<CR>
      nmap <Leader>ug :Unite -start-insert giti<CR>
      nmap <Leader>uh :Unite -start-insert history/command<CR>
      nmap <Leader>uj :Unite -start-insert jump<CR>
      nmap <Leader>ul :Unite -start-insert line<CR>
      nmap <Leader>um :Unite -start-insert mark<CR>
      nmap <Leader>uo :Unite -start-insert outline<CR>
      nmap <Leader>uq :Unite -start-insert quickfix<CR>
      nmap <Leader>us :Unite -start-insert neosnippet/runtime<CR>
      nmap <Leader>ua :Unite -start-insert tab<CR>
      nmap <Leader>ut :Unite -start-insert tag:%<CR>
      nmap <Leader>uw :Unite -start-insert<CR>
      nmap <Leader>uy :Unite -start-insert history/yank<CR>
    " } Config Unite End

    " <Leader>o Open {
      nmap <Leader>of [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
      " Toggle spell checking on and off with <leader>s
      nmap <silent> <leader>os :set spell!<CR>
      " Dispaly tip
      " Open Set hide line number
      nmap <Leader>on :set relativenumber! nonu<CR>
      " Open Background Toggle
      noremap <leader>ob :call ToggleBackground()<CR>
      " Open zoom view
      nmap <leader>oz :ZoomToggle<CR>
      " Open vim diff view
      nmap <leader>od :VimDiff<CR>
      " Open Nerd Tree
      nmap <leader>on :NERDTreeTabsToggle<CR>
      nmap <leader>ob :BuffergatorToggle<CR>
      nmap <Leader>om <Plug>BookmarkShowAll
      nmap <leader>os :VimShellPop<CR>
      nmap <leader>oh :call CreateMenu()<CR>

    " } Config ShortCut End

    " <Leader>l Last {
      nmap <leader>lp ''<CR>
      nmap <leader>le '.<CR>
      nmap <leader>ld :TsuquyomiGoBack<CR>
      nmap <leader>lb <c-^>
      " Last active tab
      let g:lasttab = 1
      nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
      au TabLeave * let g:lasttab = tabpagenr()
    " } Config ShortCut End

    " <Leader>t Typescript {
      nmap <leader>to :TsuquyomiStartServer<CR>
      nmap <leader>tq :TsuquyomiStopServer<CR>

      nmap <leader>tb :TsuquyomiGoBack<CR>
      nmap <leader>td :TsuquyomiDefinition<CR>
      nmap <leader>te :TsuquyomiGeterr<CR>
      nmap <leader>th :TsuquyomiSignatureHelp<CR>
      nmap <leader>ti :TsuquyomiImplementation<CR>
      nmap <leader>tr :TsuquyomiReferences<CR>
      nmap <leader>ts :TsuquyomiSearch<CR>
      nmap <leader>tt :TsuquyomiTypeDefinition<CR>
    " } Config ShortCut End

    " <Leader>f File checks {
      nmap <leader>fl :ALELint<CR>
      nmap <leader>fp :Prettier<CR>
    " }
    
    " <Leader>f FN keys {
      nmap <Leader>f1 <F1>
      nmap <Leader>f2 <F2>
      nmap <Leader>f3 <F3>
      nmap <Leader>f4 <F4>
      nmap <Leader>f5 <F5>
      nmap <Leader>f6 <F6>
      nmap <Leader>f7 <F7>
      nmap <Leader>f8 <F8>
      nmap <Leader>f9 <F9>
    " }

    " <Leader>w Window {
    " :help CTRL-W
      nmap <Leader>w= <C-W>=
    " }

    " <FN> Map function keys {
      noremap <silent><F1> :call CreateMenu()<cr>
    " } Config Function Keys End
  " }

  " -------------
  " Other config {
  " -------------
    " Commands - shift key fixes {
      command! -bang -nargs=* -complete=file E e<bang> <args>
      command! -bang -nargs=* -complete=file W w<bang> <args>
      command! -bang -nargs=* -complete=file Wq wq<bang> <args>
      command! -bang -nargs=* -complete=file WQ wq<bang> <args>
      command! -bang Wa wa<bang>
      command! -bang WA wa<bang>
      command! -bang Q q<bang>
      command! -bang QA qa<bang>
      command! -bang Qa qa<bang>
    " } Config ShortCut End

    " Allow using the repeat operator with a visual selection (!)
    vnoremap . :normal .<CR>

    syntax on " active the syntaxic coloration
    let mywinfont="Monospace:h8:cANSI"

    " Bar line length in gray color
    highlight ColorColumn ctermbg=16

    " Auto limit text width
    autocmd FileType text setlocal textwidth=100
    autocmd Filetype gitcommit setlocal spell textwidth=72

    set background=dark

    " Vim diff current windo
    function! s:VimDiff() abort
      if exists('t:vimdiff') && t:vimdiff
        :windo diffoff
        let t:vimdiff = 0
      else
        :windo diffthis
        let t:vimdiff = 1
      endif
    endfunction
    command! VimDiff call s:VimDiff()

    " Zoom / Restore window.
    function! s:ZoomToggle() abort
      if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
      else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
      endif
    endfunction
    command! ZoomToggle call s:ZoomToggle()

    " Allow to trigger background
    function! ToggleBackground()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction

    " always jump to last edit position when opening a file
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction
    augroup resCur
      autocmd!
      autocmd BufWinEnter * call ResCur()
    augroup END

    " Removes trailing spaces
    " :call TrimWhiteSpace()
    function! TrimWhiteSpace()
        %s/\s\+$//e
    endfunction

    " Delete hidden buffers
    " :call DeleteHiddenBuffers()
    function! DeleteHiddenBuffers()
      let tpbl=[]
      call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
      for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
      endfor
    endfunction

    " Visual mode pressing * searches for the current selection
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

    " Surround the visual selection in parenthesis/brackets/etc.:
    vnoremap s( <esc>`>a)<esc>`<i(<esc>
    vnoremap s) <esc>`>a)<esc>`<i(<esc>
    vnoremap s[ <esc>`>a]<esc>`<i[<esc>
    vnoremap s] <esc>`>a]<esc>`<i[<esc>
    vnoremap s{ <esc>`>a}<esc>`<i{<esc>
    vnoremap s} <esc>`>a}<esc>`<i{<esc>
    vnoremap s" <esc>`>a"<esc>`<i"<esc>
    vnoremap s' <esc>`>a'<esc>`<i'<esc>
    vnoremap s` <esc>`>a`<esc>`<i`<esc>

    " Use local vimrc if available
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif

    " When using `dd` in the quickfix list, remove the item from the quickfix
    " list.
    function! RemoveQFItem()
      let curqfidx = line('.') - 1
      let qfall = getqflist()
      call remove(qfall, curqfidx)
      call setqflist(qfall, 'r')
      execute curqfidx + 1 . "cfirst"
      :copen
    endfunction
    :command! RemoveQFItem :call RemoveQFItem()
    " Use map <buffer> to only map dd in the quickfix window.
    " Requires +localmap
    autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

    " Allow for easy paste external buffer. See :help fo-table
    autocmd BufNewFile,BufRead * setlocal formatoptions-=r
