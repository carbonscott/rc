# alias
alias t='touch'
alias v='/opt/local/bin/vim'      # vim aliasing
alias vi='/opt/local/bin/vim'     # vim aliasing 
alias vim='/opt/local/bin/vim'    # vim aliasing  
alias c='cd'
alias f='fg'
alias b='bg'
alias gp='egrep'
alias vv='mvim'
alias o='open'
alias til="cd ~/Dropbox/TIL"
alias book="cd ~/Dropbox/Books"
alias clg="cd ~/Documents/College"
alias dit="cd ~/DIT"
alias today="cd ~/Setting/Today/"
alias utilities="vv26 ~/.vim/rc/utilities"

# Path
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$PATH:/sbin"

# Perl Path
PATH="/Users/Scott/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/Scott/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/Scott/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/Scott/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/Scott/perl5"; export PERL_MM_OPT;

# Extra Source
source ~/Setting/today/bashrc_today
source ~/.vim/rc/utilities
