syntax match ThoughRC_Question /?\?[?>_]/
syntax match ThoughRC_Mapping_SuchThat /\(<=\)\|\(=>\)/
syntax match ThoughRC_Mapping_BelongTo /\(<<\)\|\(>>\)/
syntax match ThoughRC_Mapping_Associate /:/ "the sequence matters
syntax match ThoughRC_Mapping_Represent /:=/
syntax match ThoughRC_Mapping_Basic /->/
syntax match ThoughRC_Mapping_Delimiter /,/
syntax match ThoughRC_Mapping_Candidate /[@\$\%]/

highlight ThoughRC_Question          term =bold ctermfg=14  guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Associate term =bold ctermfg=14 guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Represent term =bold ctermfg=14 guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Delimiter term =bold ctermfg=14 guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_BelongTo  term =bold ctermfg=9 guifg=#508ff2 gui=bold
highlight ThoughRC_Mapping_SuchThat  term =bold ctermfg=10 guifg=#798b00 gui=bold
highlight ThoughRC_Mapping_Basic     term =bold ctermfg=2 guifg=#28a264 gui=bold
highlight ThoughRC_Mapping_Candidate term =bold ctermfg=13 guifg=#dd62bd gui=bold
