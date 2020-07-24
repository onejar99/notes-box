# JS Others

[TOC]

----

## Ending Definitions with a Comma

* Trailing commas in object and array definition are legal in ECMAScript 5. (but IE 8 will crash?)
* JSON does not allow trailing commas.


````js
person = {firstName:"John", lastName:"Doe", age:46,}
points = [40, 100, 1, 5, 25, 10,];
````


----

## Debugging

1. all modern browsers have a built-in JavaScript debugger.
2. Setting Breakpoints - `debugger`:
	* The `debugger` keyword stops the execution of JavaScript, and calls (if available) the debugging function.
	* This has the same function as setting a breakpoint in the debugger.
	* If no debugging is available, the debugger statement has no effect.


````js
var x = 10;
console.log(x);

debugger; // On Chrome, it will automatically launch "Source" in the debugger menu.

x = 55;
console.log(x);
````


----


