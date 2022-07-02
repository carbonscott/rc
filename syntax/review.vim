" More about org...
highlight REV_GOOD ctermfg=green  cterm=bold
highlight REV_BAD  ctermfg=243
highlight REV_OKAY ctermfg=blue
syntax match REV_GOOD "\[G\].*\.\s*$"
syntax match REV_BAD  "\[B\].*\.\s*$"
syntax match REV_OKAY "\[O\].*\.\s*$"

finish
