" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on

"added by me
"2 spaces for identation
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=4 " makes the spaces feel like real tabs. Very useful when deleting
"not for makefiles
autocmd FileType make setlocal noexpandtab

"scons are python files
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python

"spellchecking
set nospell 

"numbering for code reading
"set number

" Ignoring case is a fun trick
set ignorecase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Do smart case matching
set smartcase

" Show matching brackets.
set showmatch

" no error bells
set noerrorbells

"Highlight when exceding 80 columns
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/

"set autoindenting off if F2 is pressed. Very useful for pasting cod
set pastetoggle=<F2>


" set listchars=tab:>-,eol:$,trail:*,extends:>,precedes:<
" show wrong tabs
" set list!
colorscheme desert


" for vim-pathogen - to install vim plugins
" execute pathogen#infect()

" au FileWritePre,FileAppendPre,FilterWritePre,BufWritePre * :%s/\s\+$//ge
" save with :noa wq if whitespaces matter

" Hopefully I can remove this some day when 80 characters is no longer the
" standard.
set colorcolumn=80
" ~/.vimrc ends here
