syntax match ThoughRC_Question_1 "?"
syntax match ThoughRC_Question_2 "?[?>_]"
syntax match ThoughRC_Mapping_SuchThat "\(<=\)\|\(=>\)"
syntax match ThoughRC_Mapping_BelongTo "\(<<\)\|\(>>\)"
syntax match ThoughRC_Mapping_Associate ":" "the sequence matters
syntax match ThoughRC_Mapping_Represent ":="
"let relation_notation_0 = "\(->\)"
"let relation_notation_1 = "\(>\)"
"let descriptive_notation_0 = "\(-:\)"
syntax region ThoughRC_Mapping_Basic start=":-" end="\(->\)\|\(-:\)\|\(>\)"
"syntax region ThoughRC_Relational_Basic_Short start=":-" end=">"
"syntax region ThoughRC_Descriptive_Basic start=":-" end="-:"
syntax match ThoughRC_Mapping_Delimiter "[,;]"
syntax match ThoughRC_Mapping_Candidate "[@\$\%]"
syntax keyword ThoughRC_Return return
syntax match ThoughRC_Mapping_Comments "#:"
syntax region ThoughRC_Mapping_Comments_Block start="(#:" end=")"

highlight ThoughRC_Question_1          term =bold ctermfg=14  guifg=#fda428 gui=bold
highlight ThoughRC_Question_2          term =bold ctermfg=14  guifg=#fda428 gui=bold
highlight ThoughRC_Return              term =bold ctermfg=14  guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Associate term =bold ctermfg=14 guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_Represent term =bold ctermfg=14 guifg=#ffd855 gui=bold
highlight ThoughRC_Mapping_Delimiter term =bold ctermfg=14 guifg=#ffd855  gui=bold
highlight ThoughRC_Mapping_Comments  term =bold ctermfg=14 guifg=#ffd855  gui=bold
highlight ThoughRC_Mapping_Comments_Block  term =bold ctermfg=14 guifg=#ffd855  gui=bold
"highlight ThoughRC_Mapping_Delimiter term =bold ctermfg=14 guifg=#fda428 gui=bold
highlight ThoughRC_Mapping_BelongTo  term =bold ctermfg=9 guifg=#508ff2 gui=bold
highlight ThoughRC_Mapping_SuchThat  term =bold ctermfg=10 guifg=#798b00 gui=bold
highlight ThoughRC_Mapping_Basic     term =bold ctermfg=2 guifg=#7CEF00 gui=bold
"highlight ThoughRC_Relational_Basic_Short     term =bold ctermfg=2 guifg=#7CEF00 gui=bold
"highlight ThoughRC_Descriptive_Basic     term =bold ctermfg=2 guifg=#7CEF00 gui=bold
highlight ThoughRC_Mapping_Candidate term =bold ctermfg=13 guifg=#dd62bd gui=bold
