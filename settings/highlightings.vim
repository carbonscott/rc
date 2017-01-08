if has("gui_macvim")   " for Mac
	set background=dark
	"colorscheme solarized
	hi Normal guifg=Yellow
else
	source ~/.vim/settings/highlighting_linux.vim
endif

if has("gui_running")  " for Linux
	source ~/.vim/settings/highlighting_gvim.vim
else
	source ~/.vim/settings/highlighting_linux.vim
endif
