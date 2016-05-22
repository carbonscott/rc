---
title: Notation for thinking and reading
author: Cong Wang
date: Sun Mar 27 21:24:59 2016
---

## Notation

* `?x`:= what is `x` (looking for associated set for manipulating it)?
	* looking for a defined associated set which `x` belongs to;
	* looking for definition of set `x`;
* `??x`:= why `x` (looking for a reason)? 
* `?>x`:= how `x` (looking for an approach)?
* `?,x`:= what's the state of `x` (asking for the specifications/fact)?
* `?_x`:= where/when is `x` (looking for the state)?
* `?:x`:= if `x` is true? 
* `@(?|??|?>|?,|?_|?:)x`:= what/which candidates (placeholders/collection/set) for
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
* `->`:= indicates a single mapping;
* `A=>B`:= if A is true, then B is true;
* `!A`:= A is **false**;
* `/@A`:= for all in A, for everyone in A; 
* `$>A`:= at least (exists) one in A;

## Set Theory

* Once you can assign a set to something `x`, you can manipulate `x` then. 
* The Set can be context-awared/based.

### Basic Workflow

* Identify Object Type `@C` or `%C` for two objects;
* Try defined Operations for either relating object in the same set `@C1` or `%C1`
  or the other set `@C2` or `%C2` to build up a relation between two objects;

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
