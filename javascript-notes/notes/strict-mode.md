# JS Strict Mode

`use strict` defines that the JavaScript code should be executed in **strict mode**.

## What's Strict Mode

1. purpose
    * to indicate that the code should be executed in *strict mode*.
    * With *strict mode*, you can not, for example, use undeclared variables.

2. supported env
    * is new in JavaScript 1.8.5 (ECMAScript version 5).
    * not a statement, but a literal expression, ignored by earlier versions of JavaScript.
    * All modern browsers support running JavaScript in "Strict Mode".

3. Why need
    * makes it easier to write "secure" JavaScript.
    * Strict mode changes previously accepted "bad syntax" into real errors.
    * Example 1:
      * mistyping a variable name creates a new global variable.
      * In strict mode, this will throw an error.
    * Example 2:
      * In normal JavaScript, a developer will not receive any error feedback assigning values to non-writable properties.
      * In strict mode, any assignment to a non-writable property, a getter-only property, a non-existing property, a non-existing variable, or a non-existing object, will throw an error.


----

## Allowed/Not-Allowed with Strict Mode

With strict mode, you can **NOT** :
  * cannot use undeclared variables.
  * cannot delete a variable (`delete x;`) or a function(both expression and declararion)
    * will cause `Uncaught SyntaxError: Delete of an unqualified identifier in strict mode.`
    * mynote: but delete objects' property or arrays' element is still ok
  * cannot duplicate parameter names for function
    * will cause `Uncaught SyntaxError: Duplicate parameter name not allowed in this context`
  * cannot use Octal numeric literals(八進位) (`var x = 010;`)
  * cannot use Octal escape characters (`var x = "\010";`)
  * cannot write to a read-only property of objects
  * cannot write to a get-only property
  * cannot delete an undeletable property (`delete Object.prototype;`)
  * cannot use the string `eval` / `arguments` as a variable (`var eval = 3.14;`)
  * cannot use future reserved keywords as variables (e.g. public, static, interface, implements)
  * cannot use the `with` statement (`with (Math){x = cos(2)};`)
  * cannot use `eval()` create variables in the scope from which it was called (for security reasons)
  * In function calls like f(), the `this` value was the global object. In strict mode, it is now undefined.

With strict mode, still allowed:
  * re-declare variables



----

## Declaring Strict Mode

To declare that JavaScript code should be executed in "strict mode", add below directive to the beginning of a script or a function:
* Declared at the beginning of a script, it has **global scope** (all code in the script will execute in strict mode):
* The "use strict" directive is **only** recognized at the **beginning** of a script or a function.


````js
"use strict";
````


----

## Example

Case 1: Without strict mode

````js
x = 3.14;
console.log(x);

//********result**********
//3.14
````


Case 2: With strict mode

````js
"use strict";
x = 3.14;
console.log(x);

//********result**********
//Uncaught ReferenceError: x is not defined
````


case 3: strict mode with function scope

````js
x = 3.14;       // This will not cause an error.
myFunction();

function myFunction() {
   "use strict";
    y = 3.14;   // This will cause an error
}
````


case 4: strict mode with global scope

````js
"use strict";
myFunction();

function myFunction() {
    y = 3.14;   // This will also cause an error because y is not declared
}
````


case 5: duplicate parameter function

````js
console.log( myFunc("Hi", "Hello") );   // hello

function myFunc(p1, p1) {
  return p1;
}
````

````js
"use strict";
console.log( myFunc("Hi", "Hello") );   // Uncaught SyntaxError: Duplicate parameter name not allowed in this context

function myFunc(p1, p1) {
  return p1;
}
````

case 6: For security reasons, eval() is not allowed to create variables in the scope from which it was called:

````js
"use strict";

eval("var x = 2");
console.log(x);     //Uncaught ReferenceError: x is not defined
````

