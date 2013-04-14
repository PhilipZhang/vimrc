" General {
		set nocp   " not compatible with vi
		" determin file type based on name and content
		" and allow aoto-identation and plugins for
		" each filetype
		filetype on
		filetype indent plugin on 
		syntax on  			" Enable syntax highlighting
		" use case insensitive search, except when using capital letters
		set ignorecase
		set smartcase  
		" allow backspacing over autoindent,line break 
		set backspace=indent,eol,start
		" autoindent, when opening a new lien and no filetype specific
		" indenting is enabled, keep the same indent as the current line
		set ai 
		set nostartofline
		set mouse=a			" enable mouse for all modes
		set clipboard=autoselect,exclude:cons\|linux
		set clipboard+=y
		set shiftwidth=4
		set tabstop=4
		set background=dark
		set virtualedit=onemore		" allow for cursor beyond last character

		" Persistent Settings {
				set undofile		" persistent undo
				set undolevels=1000 " maximum number of changes that can be undone
				silent exec '!mkdir -p ~/.vimviews'
				au BufWinLeave * silent! mkview	  " make vim save view(state) (folds, cursor, etc)
				au BufWinEnter * silent! loadview " make vim load view
		" }
" }

" Vim UI {
		set t_Co=256 		" this should be before the color scheme
		colorscheme desert256 		" load a colorscheme
		set wildmenu 		" give a possible lists when 'tab'
		set wildmode=list:longest,full
		set showcmd 		" show partial commands in the last line of screen
		set hlsearch 		" highlight the searches(use<C-L> to run off highlights
		set incsearch
		set showmatch		" show matching brackets/parenthesis
		set ruler			" display the cursor pos in the status line
		set laststatus=2	" always display the status line
		set confirm			" pop up a dialog to ask you whether to save changes
		set cmdheight=2		" cmd line height
		set number 			" display the line numbers
		set tabpagemax=15 	" only show 15 tabs
		set showmode        " display the current mode
		"set cursorline		" set the underline
		set foldenable		" auto fold code
		set cpoptions+=n    " use wrap line number
		hi Normal guibg=#121212 ctermbg=233
		hi LineNr term=bold cterm=NONE ctermfg=239 ctermbg=234 gui=NONE guifg=#4e4e4e guibg=#1c1c1c
		hi cursorline  guibg=#303030 ctermbg=236 " set the color of current line
		hi CursorColumn guibg=#303030 ctermbg=236 " highlight cursor
		hi Comment guifg=#008700 ctermfg=28   " set the color of comment
		if has('cmdline_info')
			set ruler                  	" show the ruler
			set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
			set showcmd                	" show partial commands in status line and
										" selected characters/lines in visual mode
		endif
		" Statusline {
				hi User1 guifg=white guibg=#5f87ff ctermfg=white ctermbg=69
				hi User2 guifg=white guibg=#f24e32 ctermfg=white ctermbg=174
				hi User3 guifg=white guibg=#cc9e15 ctermfg=white ctermbg=172
				hi User4 guifg=white guibg=#a6e22e ctermfg=DarkGrey ctermbg=113
				hi User5 guifg=white guibg=#272822 ctermfg=white ctermbg=black
				set statusline+=%1*%-52f%=\ 	" file name				
				set statusline+=%1*\ %p
				set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\   " file type
				set statusline+=%4*\ %l/%c\ " encoding
				set statusline+=%2*%0.10y\ " BOM
				set statusline+=%5*\ %-0.10m
		" }
" }

" Formatting {
		set formatoptions=1
		set lbr
" }


set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Key Mappings {
		" Tab Operations {
		nmap <C-l>    :tabnext<CR>
		nmap <C-h>  :tabprevious<CR>
		nmap <C-w>		:tabc<CR>
		nmap <C-t>		:tab new<CR>
		" }
		"The default leader is '\', but many people prefer ',' as it's in a standard
		"location
		let mapleader = ','
		nmap ; :
		" Wrapped lines goes down/up to next row, rather than next line in file.
		nnoremap j gj
		nnoremap k gk
		" clear highlighted search
		nmap <silent> <leader>/ :nohlsearch<CR>  
		" visual shifting (does not exit Visual mode)
		vnoremap < <gv
		vnoremap > >gv 
		" Change Working Directory to that of the current file
		cmap cwd lcd %:p:h
		cmap cd. lcd %:p:h
		map <ScrollWheelUp> <C-Y>
		map <ScrollWheelDown> <C-E>
" }

" GUI Settings {
		" GVIM- (here instead of .gvimrc)
		if has('gui_running')
			set guioptions-=T          	" remove the toolbar
			set lines=40               	" 40 lines of text instead of 24,
		else
		"	set term=builtin_ansi       " Make arrow and other keys work
		endif
" }

