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
* `B(:A)` or `B:=$function(A)`:= indicates a single mapping due to `$function` in relational operation;
* `B(:A1,A2)` could mean `A1:-$f1->B`, `A2:-$f2->B` or
  `A1,A2:-$f1,$f2->B`. For instance, `_:-$f1,$f2->_ := _:-$f1+$f2->_`
  .
* `A:-$descriptive_opearator-:B`:= indicates a single mapping due to `$descriptive_opearator` in descriptive operation;
* `A=>B`:= if A is true, then B is true;
* `!A`:= A is **false**;
* `A<<B`: A belongs to **set** B. Make catergorization;

## Set Theory

* Once you can assign a set to something `x`, you can manipulate `x` then. 
* The Set can be context-aware/based.

## Descriptive vs Relational Operation

Operation can be categorized into two:   

* **descriptive**:instance doesn't necessarily have to be changed in a
  descriptive operation.; 
* **relational**: variables or a set of instances are interested in a relational operation.; 

In language, verbs don't necessarily indicate a relational operation.
For example, A kicks B. B and A don't own a relationship if we regards
it as a descriptive operation, in which A and B are just instances and
no more than them are interested in a kicking relation. However, in a
statement like increasing the invest can win more profit, invest is a
variable because it can be increased and profit is a variable because
it can be more. This is not a simple description but a relational
operation, in which those instance means a bunch of things like
different number of invest and different amount of profit.

## Factoring a descriptive operation

Parameterizing/Factoring `$thing` to convert it from something in
descriptive operation to an variable in a relational operation by
`$thing(:@factors)` or `$thing(#:@factors)`, which are extracted from
`@instanecs`.

## Symbolize: make an instance be replaced by a placeholder in the form of a symbol

```
  "my description":-symbolize->$x; 
  $x:-value->"my description";
```

## Declaration, Evaluation

**Automation** is only about **declaration**, **evaluation** and
**context**.

<!--
EXAMPLE

?$x=>$x:-used as-:$"a tag for email from lela";

$s(:$y);

@y:"people in research":={
  lela:@{kral, group, a professor in university, md, 
  },
  henry:@{kral group, researcher in Argone lab},
  han:@{kral group, lab mate},
  sanoj:@{kral group, lab mate},
  petr:@{advisor, professor in university},
};

So, the problem type is the 3rd one. I need to find more instances
about $"a tag for email from lela". 

-->

<!--

### Two typical problems about pattern finding in relational operation

```
$type1:=?$x=>@A:-$x->@B {
  $isOk=0;
  while ?:(scalar @assumptions>0) {
	$assumption:=shift @assumptions;
	$x:=$assumption;
	@A:-$x->@B';
	if @B'==@B {
	  $isOk=1;
	  break;
	}
  }
  return $isOk, $x; 
}
```

```
$type3:=?$x,@B=>@A:-$x->@B {
  push @B, $more_instance;
  call @B:-$type1->@A;
}
```


-->
<!--
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
-->
<!--
interfaces can not be changed during usage.
parameterize vs varize (find more instance about an variable)
-->