
# vim-smartinsert

[x] Demostration

This plugin provides a simple solution to insert boilerplate code or
any text snippets for your everyday Vim editing. 

## Scenarios

### Select template



### Show selected templates

[x] Demo

### Unselect templates

[x] Demo

### Create your template

[x] Demo

### more feature

Sort all keywords by the length


## To Do

regex match string

string

Idea

```
      let match_left = searchpos(g:SmartInsertPlaceholder, 'n')
      let match_rght = searchpos(g:SmartInsertPlaceholder, 'en')
      let match_len  = match_rght[1] - match_left[1]

      let if_match = search(g:SmartInsertPlaceholder,'c')
      if if_match != 0
        execute "normal! "."v".(match_len)."lo\<c-g>"
      endif
```

Pattern `\%($\S\{-\}\)\{-,1\}____`


```





$sdfsa____

asdfds____  ---- searchpos function is doning something else
                 the cursor is not on the last _, it only finds the last 2 position

sadf$ssf____sadfsdf


```

searchpos with `n` gives me trouble.  I have to let cursor move first with
the following function.


```
let if_match = search(g:SmartInsertPlaceholder,
\                         ''.next_rules[a:next_type])
```

The pattern is added.  

A new function is written for finding the next/prev string matched by regex for
placeholder.  
