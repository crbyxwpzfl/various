"COLOR THEME
	"source path\to\file
	"put theme.vim file in \nvim\share\nvim\runtime\colors
	:set termguicolors
	:colorscheme github
	:set background=light

"SET DIR
	set dir=$VIM\tmp

"SET UNDO DIR
	set undodir=$VIM\tmp

"SET BACKUP DIR
	set backupdir=$VIM\tmp

"ZEILEN UMBRÜCHE
	set sidescrolloff=10
	set sidescroll=1
	set nowrap

"SET FOLDS
	set foldmethod=indent
	set foldlevel=0
	hi folded ctermbg=grey ctermfg=black guibg=grey guifg=black

"SET TAB VERTICAL LINES there is a space after \
	:set listchars=tab:\|\  
	:set list
	"":hi Specialkey ctermfg=white (uncomment for vim)
	:hi NonText ctermfg=grey guifg=grey

"SET HIGHLIGHTS
	set cursorline
	hi CursorLine gui=bold guibg=black cterm=bold ctermbg=blue
	hi EndOfBuffer ctermfg=grey guifg=grey
	
	set nonumber "relativenumber
	hi CursorLineNr ctermbg=blue guibg=blue 
	hi LineNr ctermfg=white guifg=bold

"STATUS BAR
	set laststatus=2
	set statusline=
	set statusline+=%#PmenuSel#
	set statusline+=%#LineNr#
	set statusline+=\ %f
	set statusline+=%m\
	set statusline+=%=
	set statusline+=%#CursorColumn#
	set statusline+=\ %y
	set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
	set statusline+=\[%{&fileformat}\]
	set statusline+=\ %p%%
	set statusline+=\ %l:%c
	set statusline+=\ 

"KEYMAPPNiGS
	"to map e.g. Esc: press Strg+V then press Esc or any other special keycombo
	map <C-C> "*y
	
	imap jk <ESC>
	imap kj <ESC>
	imap <C-S> <ESC>gg:call writefile([1], expand("$DESKTOP\\nvim\\alt.txt"), "b")<CR>:w<CR>
	
	"for auto strg+f path completion strg+n word completion strg+p keyword completion
	imap <C-F> c:\<C-X><C-F>
	imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
	imap <expr><SPACE> pumvisible() ? "\<C-X><C-F>" : "\<SPACE>"
	
	"insert sys clipboard in normal mode with strg+v
	nmap <C-V> a*
	nmap s gg:call Reset_Sync()<CR>:w<CR>
	nmap e :Explore
	nmap q :q!
	nmap # :set invnumber :let &mouse=(empty(&mouse) ? 'a' : '')<CR>
	nmap t :tabnew:term
	noremap <M-h> :vertical resize -4<CR>
	noremap <M-l> :vertical resize +4<CR>
	
	"usee :exe to expand $ENV-VAR to string and then join strings by . operator
	nmap 1 <C-W><C-S><C-W><C-W>:terminal<CR>ipython -c "import os; import sys; sys.path.append(os.environ.get('privates')); import privates; sys.path.append(privates.gitpypath); import git"<CR>
	tmap <ESC> <C-\><C-n>
	
	"Better tabbing
	vnoremap < <gv
	vnoremap > >gv

"MAUS SUPPORT
	set mouse=a "mouse = a use mouse as in every other editor mouse = 0 use cmd mouse commands

"SET DEFAULT SHELL
	:set shell=cmd "powershell

"NETRW MAPPINGS
	augroup Call_Netrw_Mapping
		autocmd!
		autocmd filetype netrw call NetrwMapping()
	augroup END
	
	function! NetrwMapping()
		noremap <buffer> f :!ffplay-smal.bat %:p
		nmap <buffer> h u
		nmap <buffer> l 
		nmap <buffer> <S-p> 
		nmap <buffer> q :q!
		nmap <buffer> <C-V> <C-V>
		nmap <buffer> <leftmouse> <C-V>
		nmap <buffer> t :tabnew:term
		nmap <buffer> m %
	endfunction
	
	let g:netrw_preview = 1 "set preview to be vertical
	let g:netrw_liststyle = 0 "set tree view mode to 0 cicle with i
	let g:netrw_banner = 0 "remove the banner

"LOOP AUTORELOAD FILE AND SYNC CURSOR
	:set autoread
	if ! exists("g:CheckUpdateStarted")
		let g:CheckUpdateStarted=1
		call timer_start(1,'CheckUpdate')
	endif
	function! CheckUpdate(timer)
		silent! checktime
		:call BitteGeh()
		call timer_start(1000,'CheckUpdate')
	endfunction

	augroup Execute_On_VimEnter "initialisiert sync des cursurs
		autocmd!
		"autocmd VimEnter * call writefile([1], expand("$DESKTOP\\nvim\\alt.txt"), "b") "alt = 1 
		autocmd VimEnter * call Reset_Sync()
	augroup END

	function Reset_Sync()
		call writefile([1], expand("$DESKTOP\\nvim\\alt.txt"), "b") "alt = 1 
		let master = readfile(expand("$DESKTOP\\nvim\\master.txt"))[0]
		if master > line('$')
			call writefile([1], expand("$DESKTOP\\nvim\\master.txt"), "b") "master = 1 
		endif
	endfunction
	
	function! BitteGeh()
		"hot fix map s reinitialisiert sync da alt = 1 gesetzt wird ACHTUNG!! zeiger wird dabei auf master gesetzt
		
		let master = readfile(expand("$DESKTOP\\nvim\\master.txt"))[0]
		let alt = readfile(expand("$DESKTOP\\nvim\\alt.txt"))[0]
		
		if master == alt
			"entweder ich hab geändert oder keine ändereung
			let pos = getpos(".")[1] "pos lesen/abfragen
			if master <= line('$') "also erste zeile >= master >= lezte zeile
				if master != pos
					call writefile([pos], expand("$DESKTOP\\nvim\\master.txt"), "b") "master = pos 
				endif
			endif
		endif
		
		if master != alt
			let pos = getpos(".")[1] "pos lesen/abfragen für dreier split test "macht kein sinn weil pos verschieden für fenster
			if alt != pos
				"hier bin ich wenn master != alt != pos
				if master != pos
					if alt > line('$') && master <= line('$') "alt tiefer als lezte zeile und erste zeile >= master >= lezte zeile
						"ich komme von tiefer in sync baren bereich
						call cursor(master,".") "pos auf master setzen
						call writefile([master], expand("$DESKTOP\\nvim\\alt.txt"), "b") "alt = master
					elseif master <= line('$') "also erste zeile >= master >= lezte zeile
						call writefile([pos], expand("$DESKTOP\\nvim\\master.txt"), "b") "master = pos
					endif	
				endif
				
				if master == pos
					call writefile([master], expand("$DESKTOP\\nvim\\alt.txt"), "b") "alt = master
				endif
			endif

			if alt == pos
				"ich muss syncronisieren
				if master <= line('$') "damit ich in eim fenster tiefer gehn kann als im anderen
					call cursor(master,".") "pos auf master setzen
				endif
				call writefile([master], expand("$DESKTOP\\nvim\\alt.txt"), "b") "alt = master
			endif
		endif
	endfunction

"GENREAL SETTINGS
	set conceallevel=0
	set smarttab
	set smartindent
	set autoindent
	set formatoptions-=cro "Stop newline continution of comment
	:set autochdir
	:pwd
