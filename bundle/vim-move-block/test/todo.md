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





<!--
----aaaa----
----1111----
----2222----
----3333----  click arrow key to start moving
----aaaa----  what can be got from visual info is 
              * the position of block
			  * the size of block

              ?> move block <down>
			  * get cursor from '< position
			  * modify the line numnber by the lineNumber('>) + 1
			  * delete the line to the right by length 
				s:l_info[1][2] - s:l_info[0][2]
			  * get cursor from '< b
			  * modify the lineNumber('>)
			  * P -- paste it --
			  * 

----aaaa----
----1111----
----2222----
----3333----
----aaaa----


----aaaa----
----1111----
----2222----
----3333----
----aaaa----


----aaaa----
----1111----
----2222----
----3333----
----aaaa----
-->


<!--
?, actually the d does?
  now, it means to delete the lines
?, actually the P does?
  it copies the lines that is selected later
  still, some mechanism changed the register "a
?: the cursor move matters?
?, matters?
  * gv in <down> -> no
  * gv in return -> no

if the func is invoked directly from call instead of mapping, it works
-->



<!--

[0,102,15,0]
[0,100,11,0]

[117,16]
[117,12]

[119,12/16]

-->




