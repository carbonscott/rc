if has("gui_macvim")   " for Mac
	set background=dark
	"colorscheme solarized
	hi Normal guifg=Yellow
else
	source ~/.vim/settings/highlighting_linux.vim
endif


if has("gui_running")  " for Linux
	set background=light
	hi Normal guifg=Black
	colorscheme default
else
	source ~/.vim/settings/highlighting_linux.vim
endif

