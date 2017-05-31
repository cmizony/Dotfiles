"    _____ __  __ _____ __________  _   ___     __                 _
"   / ____|  \/  |_   _|___  / __ \| \ | \ \   / /                (_)
"  | |    | \  / | | |    / / |  | |  \| |\ \_/ /   ______  __   ___ _ __ ___  _ __ ___
"  | |    | |\/| | | |   / /| |  | | . ` | \   /   |______| \ \ / / | '_ ` _ \| '__/ __|
"  | |____| |  | |_| |_ / /_| |__| | |\  |  | |              \ V /| | | | | | | | | (__
"   \_____|_|  |_|_____/_____\____/|_| \_|  |_|               \_/ |_|_| |_| |_|_|  \___|
"
"
" Easy navigation in .vimrc:
"   Use <Leader>ig to view indentation guides
"   Use <Leader>f0 or f1 to navigate between summary folds
"   Use <gx> to open plugin url links
"
"
" Summary list of external dependencies:
"   # Install desired patched font (for devicons and powerline)
"   git config --global github.user <username>
"   cd ~/.vim/bundle/tern_for_vim && npm install
"   cd ~/.vim/bundle/vimproc.vim && make
"   cd ~/.vim/bundle/vimtips-fortune/fortunes && strfile vimtips
"   mkdir -p ~/.vim/colors && cp ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors/
"   sudo apt-get install exuberant-ctags fortune-mod cowsay tidy vim-gtk xdg-utils
"   sudo npm -g install instant-markdown-d eslint
"
" Update the list with following command:
"   grep "DO" ~/.vimrc | grep -v "grep" | sed 's/[[:space:]]\+" TODO//' | sort


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
    " http://vimawesome.com/plugin/vim-exchange
    Plugin 'tommcdo/vim-exchange'
    " http://vimawesome.com/plugin/emmet-vim
    Plugin 'mattn/emmet-vim'
    " http://vimawesome.com/plugin/vim-less-safe-and-sound
    Plugin 'groenewege/vim-less'
    " http://vimawesome.com/plugin/javascript-indent
    Plugin 'JavaScript-Indent'
    " http://vimawesome.com/plugin/surround-vim
    Plugin 'tpope/vim-surround'

    " http://vimawesome.com/plugin/javascript-libraries-syntax {
      Plugin 'othree/javascript-libraries-syntax.vim'
      let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,jasmine,jquery'
    " } Config Plugin End

    " http://vimawesome.com/plugin/syntastic {
      Plugin 'scrooloose/syntastic'
      scriptencoding utf-8
      let g:syntastic_always_populate_loc_list = 1 " Always add any detected errors into the location list
      " Don’t auto-open it when errors/warnings are detected, but auto-close when no
      " more errors/warnings are detected.
      let g:syntastic_auto_loc_list = 2
      " Highlight syntax errors where possible
      let g:syntastic_enable_highlighting = 1
      " Show this many errors/warnings at a time in the location list
      let g:syntastic_loc_list_height = 5
      " Don’t run checkers when saving and quitting--only on saving
      let g:syntastic_check_on_wq = 0

      let g:syntastic_error_symbol = '✗'
      let g:syntastic_warning_symbol       = '⚠'
      let g:syntastic_style_error_symbol   = '⚠'
      let g:syntastic_style_warning_symbol = '⚠'

      let g:syntastic_javascript_checkers    = ['eslint']
      let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
      let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
      let g:syntastic_json_checkers          = ['jsonlint']
      let g:syntastic_ruby_checkers          = ['rubocop']
      let g:syntastic_ruby_rubocop_args      = "--config .rubocop.yml"
      let g:syntastic_scss_checkers          = ['scss_lint']
      let g:syntastic_vim_checkers           = ['vint']
    " } Config Plugin End

    " http://vimawesome.com/plugin/instant-markdown-vim {
      Plugin 'suan/vim-instant-markdown'
      " TODO sudo npm -g install instant-markdown-d
      " TODO sudo apt-get install xdg-utils # Ubuntu installed by default
      autocmd BufNewFile,BufReadPost *.md set filetype=markdown

    " } Config Plugin End
  " }
  " --------------------
  " Completion {
  " --------------------
    " http://vimawesome.com/plugin/vim-autoclose-sparks-fly
    Plugin 'Townk/vim-autoclose'
    " http://vimawesome.com/plugin/neosnippet-snippets
    Plugin 'Shougo/neosnippet-snippets'

    " http://vimawesome.com/plugin/neosnippet-vim {
      Plugin 'Shougo/neosnippet.vim'
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)
      xmap <C-k>     <Plug>(neosnippet_expand_target)

      " SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
      " For conceal markers.
      if has('conceal')
        set conceallevel=2 concealcursor=niv
      endif
    " } Config Plugin End

    " http://vimawesome.com/plugin/neocomplete-vim {
      Plugin 'Shougo/neocomplete.vim'
      let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
      let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
      let g:neocomplete#enable_smart_case = 1 " Use smartcase.
      let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
      let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

      " Define dictionary.
      let g:neocomplete#sources#dictionary#dictionaries = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions'
              \ }

      " Define keyword.
      if !exists('g:neocomplete#keyword_patterns')
          let g:neocomplete#keyword_patterns = {}
      endif
      let g:neocomplete#keyword_patterns['default'] = '\h\w*'

      " Plugin key-mappings.
      inoremap <expr><C-g>     neocomplete#undo_completion()
      inoremap <expr><C-l>     neocomplete#complete_common_string()

      " Recommended key-mappings.
      inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
      function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
      endfunction
      " <TAB>: completion.
      inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
      " <C-h>, <BS>: close popup and delete backword char.
      inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><C-y>  neocomplete#close_popup()
      inoremap <expr><C-e>  neocomplete#cancel_popup()

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

      " Enable heavy omni completion.
      if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
      endif
      "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
      "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
      "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " } Config Plugin End
  " }
  " --------------------
  " Code Display {
  " --------------------
    " http://vimawesome.com/plugin/vim-jsx
    Plugin 'mxw/vim-jsx'
    " http://vimawesome.com/plugin/indent-guides
    Plugin 'nathanaelkane/vim-indent-guides'
    " http://vimawesome.com/plugin/vim-css-color-the-story-of-us
    Plugin 'ap/vim-css-color'
    " http://vimawesome.com/plugin/solarized
    Plugin 'altercation/solarized'

    " http://vimawesome.com/plugin/indentline {
      Plugin 'Yggdroot/indentLine'
      let g:indentLine_char = '¦'
      let g:indentLine_enabled = 0
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-colorschemes-sweeter-than-fiction {
      Plugin 'flazz/vim-colorschemes'
      " TODO mkdir -p ~/.vim/colors && cp ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors/
      " colorscheme ir_black " black
      " colorscheme mango " black
      " colorscheme xoria256 " grey
      " colorscheme mustang " grey
      " colorscheme molokai " grey
      " autocmd ColorScheme * highlight DiffAdd ctermbg=242
      " autocmd ColorScheme * highlight DiffDelete ctermbg=242
      " autocmd ColorScheme * highlight DiffChange ctermbg=242
      " autocmd ColorScheme * highlight DiffText cterm=italic ctermbg=darkgray
    " } Config Plugin End
  " }
  " --------------------
  " Integrations {
  " --------------------
    " http://vimawesome.com/plugin/vim-rhubarb
    Plugin 'tpope/vim-rhubarb' " Needed for Fugitive Gbrowse
    " http://vimawesome.com/plugin/fugitive-vim
    Plugin 'tpope/vim-fugitive'
    let g:fugitive_github_domains = ['github.com', 'git.musta.ch']
    let g:github_enterprise_urls = ['https://git.musta.ch']
    set diffopt+=iwhite
    " http://vimawesome.com/plugin/vim-gitgutter
    Plugin 'airblade/vim-gitgutter'
    " http://vimawesome.com/plugin/gitv
    let g:Gitv_OpenHorizontal = 1
    Plugin 'gregsexton/gitv'
    " http://vimawesome.com/plugin/vimshell-vim {
      Plugin 'Shougo/vimshell.vim'
      let g:vimshell_user_prompt=''
      let g:vimshell_prompt_expr =
      \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
      let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
    " } Config Plugin End

    " http://vimawesome.com/plugin/tagbar {
      Plugin 'majutsushi/tagbar'
      " TODO sudo apt-get install exuberant-ctags
      " http://ctags.sourceforge.net/
      let g:tagbar_width=30
      " let g:tagbar_autofocus=1
      " autocmd Filetype * nested :call tagbar#autoopen(0)
      " Angular html
      let g:tagbar_type_html = {
          \ 'csagstype' : 'html',
          \ 'kinds'     : [
              \ 'd:directive'
          \ ]
      \ }
      " Angular javascript
      let g:tagbar_type_javascript = {
          \ 'csagstype' : 'JavaScript',
          \ 'kinds'     : [
              \ 'M:module',
              \ 'C:controller',
              \ 'D:directive',
              \ 'E:decorator',
              \ 'I:filter',
              \ 'S:service',
              \ 'r:ngRoute',
              \ 'F:factory',
              \ 'd:delegate',
              \ 'c:class',
              \ 'm:method',
              \ 'v:scopeVariables',
              \ 't:this',
              \ 'o:model'
          \ ]
      \ }
    " } Config Plugin End

    " http://vimawesome.com/plugin/gist-vim {
      Plugin 'mattn/webapi-vim'
      Plugin 'mattn/gist-vim'
      " TODO git config --global github.user <username>
      let g:gist_post_private = 1
      let g:gist_show_privates = 1
      let g:gist_open_browser_after_post = 1
    " } Config Plugin End

    " http://vimawesome.com/plugin/tern-for-vim {
      Plugin 'marijnh/tern_for_vim'
      " TODO cd ~/.vim/bundle/tern_for_vim && npm install
      " http://ternjs.net/doc/manual.html
      let tern_show_signature_in_pum=1
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-tmux-navigator {
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
  " }
  " --------------------
  " Interface {
  " --------------------
    " http://vimawesome.com/plugin/numbers-vim
    Plugin 'myusuf3/numbers.vim'
    " http://vimawesome.com/plugin/nerdtree-git-plugin
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    " http://vimawesome.com/plugin/unite-vim-back-to-december
    Plugin 'Shougo/unite.vim'

    " http://vimawesome.com/plugin/ctrlp-vim-state-of-grace {
      Plugin 'kien/ctrlp.vim'
      let g:ctrlp_max_files=0
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_custom_ignore = {'dir': '\v[\/](dist|bower|bower_components|node_modules|coverage)'}
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
      let g:nerdtree_tabs_open_on_new_tab=0
      let g:nerdtree_tabs_smart_startup_focus=2
    " } Config Plugin End

    " http://vimawesome.com/plugin/gundo {
      Plugin 'sjl/gundo.vim'
      let g:undotree_SetFocusWhenToggle=1
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-startify {
      Plugin 'mhinz/vim-startify'
      " TODO sudo apt-get install fortune-mod cowsay
      " TODO cd ~/.vim/bundle/vimtips-fortune/fortunes && strfile vimtips
      let g:startify_custom_header =
        \ map(split(system('fortune ~/.vim/bundle/vimtips-fortune/fortunes/vimtips | cowsay'), '\n'), '"   ". v:val') + ['','']
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-airline-sad-beautiful-tragic {
      Plugin 'bling/vim-airline'
      set laststatus=2
      " TODO # Install desired patched font (for powerline)
      " git clone https://github.com/powerline/fonts
      " mkdir -p ~/.fonts && mv desiredFonts ~/.fonts
      " fc-cache -vf ~/.fonts/
      " let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
    " } Config Plugin End

    " http://vimawesome.com/plugin/vim-devicons-holy-gound {
      " Plugin 'ryanoasis/vim-devicons'
      " let g:webdevicons_conceal_nerdtree_brackets = 1
      " let g:webdevicons_enable_nerdtree = 1
      " TODO # Install desired patched font (for devicons)
      " git clone https://github.com/ryanoasis/nerd-fonts.git
      " mkdir -p ~/.fonts && mv desiredFonts ~/.fonts
      " Update font cache: fc-cache -fv
    " } Config Plugin End
  " }
  " --------------------
  " Commands {
  " --------------------
    " http://vimawesome.com/plugin/tabular
    Plugin 'godlygeek/tabular'
    " http://vimawesome.com/plugin/repeat-vim
    Plugin 'tpope/vim-repeat'
    " http://vimawesome.com/plugin/matchit-zip
    Plugin 'matchit.zip'
    " http://vimawesome.com/plugin/unimpaired-vim
    Plugin 'tpope/vim-unimpaired'
    " http://vimawesome.com/plugin/tcomment
    Plugin 'tomtom/tcomment_vim'
    " http://vimawesome.com/plugin/obsession-vim
    " Use :Obsess (with optional file/directory name) to start recording to a
    " session file and :Obsess!
    Plugin 'tpope/vim-obsession'

    " http://vimawesome.com/plugin/vim-multiple-cursors {
      Plugin 'terryma/vim-multiple-cursors'
      " Prevent Neocomplete conflicts
      " Called once right before you start selecting multiple cursors
      function! Multiple_cursors_before()
        if exists(':NeoCompleteLock')==2
          exe 'NeoCompleteLock'
        endif
      endfunction
      " Called once only when the multiple selection is canceled (default <Esc>)
      function! Multiple_cursors_after()
        if exists(':NeoCompleteUnlock')==2
          exe 'NeoCompleteUnlock'
        endif
      endfunction
    " } Config Plugin End

    " http://vimawesome.com/plugin/vimproc-vim {
      Plugin 'Shougo/vimproc.vim'
      " TODO cd ~/.vim/bundle/vimproc.vim && make
    " } Config Plugin End
  " }
  " --------------------
  " Others {
  " --------------------
    " http://vimawesome.com/plugin/indentwise
    Plugin 'jeetsukumaran/vim-indentwise'
    " http://vimawesome.com/plugin/vim-easymotion-state-of-grace
    Plugin 'easymotion/vim-easymotion'
    " http://vimawesome.com/plugin/searchcomplete
    Plugin 'SearchComplete'
    " http://vimawesome.com/plugin/vim-signature
    Plugin 'kshenoy/vim-signature'
    " http://vimawesome.com/plugin/editorconfig-vim
    Plugin 'editorconfig/editorconfig-vim'

    " http://vimawesome.com/plugin/vimtips-fortune {
      Plugin 'hobbestigrou/vimtips-fortune'
      let g:fortune_vimtips_auto_display=0
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
    set autoindent                 " text indenting
    set backspace=indent,eol,start " allow backspace in insert mode
    set clipboard=unnamed         " Require vim-gtk to paste OS clipboard
    set cursorline                 " Highlight current line
    set colorcolumn=100            " Set gray bar at 100 character
    set encoding=utf8              " Set utf8 as standard encoding and en_US as the standard language
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
    set scrolloff=3                " Scroll when cursor gets within 3 characters of top/bottom edge
    set shiftwidth=2               " as above
    set showcmd                    " show incomplete commands
    set showmatch                  " Show matching brackets when text indicator is over them
    set smartcase                  " When searching try to be smart about cases
    set smartindent                " as above
    set softtabstop=2              " as above
    set splitbelow                 " Puts new split windows to the bottom of the current
    set splitright                 " Puts new vsplit windows to the right of the current
    set tabpagemax=15              " Only show 15 tabs
    set tabstop=2                  " number of spaces in a tab
    set mouse=a                    " Allow mouse usage
    "set autowrite                  Automatically write a file when leaving a modified buffer
    set list " show whitespace
    set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:• " Show whitespace
  " }

  " ---------------
  " ShortCut config {
  " ---------------

    " <Leader>p Ctrl-P & paste {
      nmap <Leader>pw <C-P><C-\>w
      nmap <Leader>ps <C-P><C-\>s
      nmap <Leader>pf :CtrlP<CR>
      nmap <Leader>pm :CtrlPMRUFiles<CR>
      nmap <Leader>pb :CtrlPBuffer<CR>
      nmap <Leader>pt :set invpaste paste?<CR>
    " } Config ShortCut End

    " <Leader>i Indent lines {
      nmap <Leader>il :IndentLinesToggle<CR>
      " Use tidy to indent html attribute on selected line (visual mode)
      nmap <silent> <Leader>ic :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
      vmap <silent> <Leader>ic :!tidy -q -i -xml --indent-attributes 1 --show-errors 0<CR>
    " } Config ShortCut End

    " <Leader>t Tern Javascript {
      nmap <Leader>td :TernDoc<CR>
      nmap <Leader>tb :TernDocBrowse<CR>
      nmap <Leader>tt :TernType<CR>
      nmap <Leader>td :TernDef<CR>
      nmap <Leader>tpd :TernDefPreview<CR>
      nmap <Leader>tsd :TernDefSplit<CR>
      nmap <Leader>ttd :TernDefTab<CR>
      nmap <Leader>tr :TernRefs<CR>
      nmap <Leader>tR :TernRename<CR>
    " } Config ShortCut End

    " <Leader>g Git shorcuts {
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gr :Gread<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>ge :Gedit<CR>
      " Mnemonic _i_nteractive
      nnoremap <silent> <leader>gi :Git add -p %<CR>
      nnoremap <silent> <leader>gg :SignifyToggle<CR>
      " File git history
      nnoremap <silent> <leader>gh :Gitv!<CR>
      " Git gutter signs
      nnoremap <silent> <leader>gg :GitGutterSignsToggle<CR>
    " } Config ShortCut End

    " <Leader><Leader> Easy motion search {
      nmap <leader><leader>a <Plug>(easymotion-bd-w)
      nmap <leader><leader>A <Plug>(easymotion-bd-W)
      nmap <leader><leader>l <Plug>(easymotion-bd-jk)
    " } Config ShortCut End

    " <Leader>v VimShell {
      nmap <leader>vs :VimShell<CR>
      nmap <leader>vt :VimShellTab<CR>
      nmap <leader>vp :VimShellPop<CR>
    " } Config ShortCut End

    " <Leader>a Tabularize ShortCuts {
      nmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
      nmap <leader>a: :Tabularize /:<CR>
      nmap <leader>a:: :Tabularize /:\zs<CR>
      nmap <leader>a, :Tabularize /,<CR>
      nmap <leader>a,, :Tabularize /,\zs<CR>
      nmap <leader>a<Bar> :Tabularize /<Bar><CR>
    " } Config ShortCut End

    " <Leader>e Helpers to edit mode {
      " http://vimcasts.org/e/14
      cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
      map <leader>ew :e %%
      map <leader>es :sp %%
      map <leader>ev :vsp %%
      map <leader>et :tabe %%
    " } Config ShortCut End

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

    " <Leader>f Code folding options {
      nmap <leader>f0 :set foldlevel=0<CR>
      nmap <leader>f1 :set foldlevel=1<CR>
      nmap <leader>f2 :set foldlevel=2<CR>
      nmap <leader>f3 :set foldlevel=3<CR>
      nmap <leader>f4 :set foldlevel=4<CR>
      nmap <leader>f5 :set foldlevel=5<CR>
      nmap <leader>f6 :set foldlevel=6<CR>
      nmap <leader>f7 :set foldlevel=7<CR>
      nmap <leader>f8 :set foldlevel=8<CR>
      nmap <leader>f9 :set foldlevel=9<CR>
      nmap <leader>fa :set foldlevel=100<CR>
    " } Config ShortCut End

    " <Leader>n Nerd tree {
      nmap <leader>nt :NERDTreeTabsToggle<CR>
      nmap <leader>nf :NERDTreeTabsFind<CR>
    " } Config ShortCut End

    " <F> Map F5 to F9 keys {
      nnoremap <F5> :GundoToggle<CR>
      nmap <F6> :TagbarToggle<CR>
      nnoremap <F7> :Gitv<CR>
      nnoremap <F8> :NumbersToggle<CR>
      nmap <silent> <F9> :set number!<CR>
    " } Config ShortCut End

    " <Leader> - Others {
      " Allow using the repeat operator with a visual selection (!)
      vnoremap . :normal .<CR>
      " Find merge conflict markers
      map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
      " Display all lines with keyword under cursor and ask which one to jump to
      nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
      " Togggle spell checking on and off with <leader>s
      nmap <silent> <leader>sp :set spell!<CR>
      " Dispaly tip
      nmap <leader>fo :Fortune<CR>
    " } Config ShortCut End
  " }

  " -------------
  " Other config {
  " -------------
    syntax on " active the syntaxic coloration
    let mywinfont="Monospace:h8:cANSI"

    " Bar line length in gray color
    highlight ColorColumn ctermbg=16

    " Auto limit text width
    autocmd FileType text setlocal textwidth=80
    autocmd Filetype gitcommit setlocal spell textwidth=72

    set background=dark         " Assume a dark background

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

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
    function! TrimWhiteSpace()
        %s/\s\+$//e
    endfunction

    " Delete hidden buffers `:call DeleteHiddenBuffers()`
    function! DeleteHiddenBuffers()
      let tpbl=[]
      call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
      for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
      endfor
    endfunction

    " Use local vimrc if available
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
  " }
