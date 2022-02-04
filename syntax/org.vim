" " Define colorscheme for org...
" hi default ORG_DONE      ctermfg=green  cterm=bold,underline
" hi default ORG_CANCEL    ctermfg=red    cterm=bold,underline
" hi default ORG_POSTPONE  ctermfg=blue   cterm=bold,underline
" hi default ORG_CONTINUE  ctermfg=yellow cterm=bold,underline
" 
" 
" " Define keyword to highlight...
" syntax case match
" syntax keyword ORG_DONE     DONE
" syntax keyword ORG_CANCEL   CANCEL
" syntax keyword ORG_POSTPONE POSTPONE
" syntax keyword ORG_CONTINUE CONTINUE

" More about org...
highlight ORG_DONE_LINE     ctermfg=green  cterm=bold,strikethrough
highlight ORG_CANCEL_LINE   ctermfg=red    cterm=bold
highlight ORG_POSTPONE_LINE ctermfg=blue   cterm=bold
highlight ORG_CONTINUE_LINE ctermfg=yellow cterm=bold
syntax match ORG_DONE_LINE     "\[DONE\].*$"
syntax match ORG_CANCEL_LINE   "\[CANCEL\].*$"
syntax match ORG_POSTPONE_LINE "\[POSTPONE\].*$"
syntax match ORG_CONTINUE_LINE "\[CONTINUE\].*$"

finish
