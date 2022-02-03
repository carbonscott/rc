" Define colorscheme for org...
hi default ORG_POSTPONE ctermfg=yellow cterm=bold,underline
hi default ORG_DONE     ctermfg=green  cterm=bold,underline
hi default ORG_CANCEL   ctermfg=red    cterm=bold,underline


" Define keyword to highlight...
syntax case match
syntax keyword ORG_POSTPONE POSTPONE
syntax keyword ORG_DONE     DONE
syntax keyword ORG_CANCEL   CANCEL


finish
