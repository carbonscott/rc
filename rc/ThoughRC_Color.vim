syntax match ThoughRC_Question /?\?[?>_]/
syntax match ThoughRC_Mapping_SuchThat /\(<=\)\|\(=>\)/
syntax match ThoughRC_Mapping_BelongTo /\(<<\)\|\(>>\)/
syntax match ThoughRC_Mapping_Associate /:/ "the sequence matters
syntax match ThoughRC_Mapping_Represent /:=/
syntax match ThoughRC_Mapping_Basic /->/
syntax match ThoughRC_Mapping_Delimiter /,/
syntax match ThoughRC_Mapping_Candidate /[@\$\%]/


highlight ThoughRC_Question term=bold guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Associate term=bold guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Represent term=bold guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Delimiter term=bold guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_BelongTo term=bold guifg=#508ff2 gui=bold
highlight ThoughRC_Mapping_SuchThat term=bold guifg=#798b00 gui=bold
highlight ThoughRC_Mapping_Basic term=bold guifg=#28a264 gui=bold
highlight ThoughRC_Mapping_Candidate term=bold guifg=#dd62bd gui=bold
