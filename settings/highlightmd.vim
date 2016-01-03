"term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
syn region WritingFunction start='\[fun' end='\]'
hi WritingFunction guifg=blue gui=bold
syn region ReusableVariable start='\[var' end='\]'
hi ReusableVariable guifg=darkorange gui=bold
"syn region AssignTest start='\[t' end='\]'
"hi AssignTest guifg=red gui=bold
syn region AssignTest start='\[eg' end='\]'
hi AssignTest guifg=grey48 gui=bold
