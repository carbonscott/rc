syn region WritingFunction start='\[f' end='\]'
syn region ReusableVariable start='\[v' end='\]'
syn region AssignTest start='\[t' end='\]'

"term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
hi WritingFunction guifg=blue gui=bold
hi ReusableVariable guifg=orange gui=bold
hi AssignTest guifg=red gui=bold

