


# case 1: moving left

## visual select text block;

* get the column number [v crn] and [v cln] from **rightmost** column and **leftmost** column;
* get the row number [v rtn] and [v rbn] from **top** row and **bottom** row;
* copy the text from the block by calling function [f
  moveanywhere#copyvisual()]

## paste the text there

* how we insert the blocks? Do I have to use parameter to control it?
* 


## Steps to achieve **moving left**

* [f visual] select and copy the contents by [f moveanywhere#copyvisual()];
* delete stuffs;
* reposition the cursor at the [v cursor_current] **2** left to the [v
  cursor_leftmost_block]
<!--* [f visual] select the column text by the size 1x([v cursor_bot_block]-[v
  cursor_top_block])-->
* [f paste] the text
* if lucky, done
