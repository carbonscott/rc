# Python env
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8


# Phenix env
alias init_phenix='source /Applications/phenix-1.15-3459/phenix_env.sh'


# CCP4 env
alias init_ccp4='source /Applications/ccp4-7.0/bin/ccp4.setup-sh'


## # Set dark theme for xterm-256color at X11 Window environment...
## if [ "$TERM" == "xterm" ] ; then
##     xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id `xprop -root | awk '/^_NET_ACTIVE_WINDOW/ {print $5}'`
## fi
