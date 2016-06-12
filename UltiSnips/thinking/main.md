---
title: Notation for thinking and reading
author: Cong Wang
date: Sun Mar 27 21:24:59 2016
---

## Notation

* `?x`:= what is `x` (looking for associated set for manipulating it)?
	* looking for a defined **associated set** which `x` belongs to;
	* looking for **definition** of set `x`;
	* looking for **description** of entry `x`; 
* `??x`:= why `x` (looking for a reason)? 
* `?>x`:= how `x` (looking for an approach)?
* `?_x`:= where/when is `x` (looking for the state)?
* `?:x`:= if `x` is true? 
* `@(?|??|?>|?_|?:)x`:= what/which candidates (placeholders/collection/set) for
  `x` (while looking for sth as probable solution)? This action can be applied to
  help decompose different types of questions.  
* `(^[a-z]*[0-9]+)x`: mark an question point at `$1` (you have to check out regex to
  understand it) 
* Simplify/Summarize what's stated:

	> * `range + items`; The items are usually sets/collections.

	> * For example, `number + name`

* `:=`:= **represent** notation;
* `:`:= association notation;
* `,`:= list notation;
* `()`:=
	* group operator: group things together;
	* `var(:parameters)`:= parameterize variable `var`; Interchangable with `:`
	  association notation;
	* `expression(#:comments expression inline)`;
	* function/operation call;
* `$`:= indicates single instance/object;
* `%`:= indicates dictionary/mapping;
* `@`:= indicates indexed collection/set;
* `A:-$function->B` or `A:-$function>B`:= indicates a single mapping due to `$function`;
* `B(:A)` or `B:=$function(A)`:= indicates a single mapping due to `$function`;
* `A=>B`:= if A is true, then B is true;
* `!A`:= A is **false**;
* `A<<B`: A belongs to **set** B. Make catergorization;

## Set Theory

* Once you can assign a set to something `x`, you can manipulate `x` then. 
* The Set can be context-awared/based.

## Description vs Relation

Operation can be categorized into two:   

* **descriptive**:instance doesn't necesarily have to be changed in a
  descriptive operation.; 
* **relational**: variables or a set of instances are interested in a relational opeation.; 

For instance, in language, verbs don't necessarily indicate a relational opeartion.
For example, A kicks B. B and A don't own a relationship if we regards it as a
descriptive operation, in which A and B are just instances and no more than them are
interested in a kicking relation. However, in a statement like increasing the invest
can win more profit, invesst is a variable because it can be increasing and profit
is variable because it can be more. This is not a simple description but a
relational opeartion, in which those instance means a bunch of things like different
number of invest and different amount of profit.

### Basic Workflow

Use natural-language to express idea and reduced-language to look into it.
`x:=Natural Language`;
`y:=Reduced Language`;
Use `$x` to express idea;
Use `$y` to do `@things`;
`@things:={filter possibilities, make question more answerable to the $asked}`;
`%asked`:`query processor`;
`$asked{example}:={"Google", "People who can answer it"}`


### Advanced Workflow

* Build new operator from the old ones;
* to define **Primitive** Operator;
* to define a **Primitive** Set;

To do the last two or not depend on its predictable or reusable purpose, like is it
necessary, or is it simplified?

## More about Notation

* `?x` returns info about which **set/sets** it belongs to and a **description** of
  itself.
* `?>x`: returns steps of doing things.
* *What to do* sth can be converted to `?>make/do sth`?