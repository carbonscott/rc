---
title: ToDo
author: Cong Wang
date: Fri Mar  4 23:19:49 2016
---

a      b

c      d
e      f 


pos of a = getpos(''<')
pos of d = getpos(''>')

/*  */


setpos(f + [0,1]) /* one char down block of d*/
normal! v      /* enter visual */
setpos([a_x,f_y] + [0,1]) /* one char down block of c */

27,6
29,5


What do I really need to move blocks?

* visual block itself matters? no

* 
  go to head of the movable line ;
  d [length] line below block ;

  
swapline()

two lines;
* lnum1, col1_a, col1_b
  lnum1+1, col2_a, col2_b

setpos('.', [0,lnum1,col1_a,0]
d.(col1_b - col1_a).l
j
P
setpos('.',[0,lnum1+1,col1_b+1])
d.(col2_b-col2_a).l
setpos('.',[0,lnum1,col1_a,0])
P

[ ] swapline is done, next is swap block based on swap line



## Bugs

line1: -------------
line2: ------------------

when move line2 to line1's position, the original algorithm copied the line1
according to the length of line2, which is an error.       
