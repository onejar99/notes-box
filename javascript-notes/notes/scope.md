# JS Scope

[TOC]



## Scope in JS

1. Scope determines the accessibility (visibility) of these variables.

2. In JavaScript, there are two types of scope: **Function(Local)** & **Global**.

3. JavaScript 不會對每個 code block 都產生新的 scope (e.g. if-else. for-loop)
  * 很多其他語言會，但 JavaScript 不會 
  
> ES6 增加了 `let` 和 `const`，是 Block level scope


````js
for (var i = 0; i < 10; i++) {
    // some code ...
}
console.log(i); //10
````





## The Lifetime of JavaScript Variables

- Start: when a variable is declared.
- Deleted:
  - __Local variables__: when the function is completed.
  - __Global variables__: In a web browser, when you close the browser window (or tab), but remains available to new pages loaded into the same window.






## Local Scope / Function Scope

* 每個 function 會建立一個新的 local scope
* local variables 只有 function 內的能用
* function arguments (parameters) 是 local variables





## Global Scope

* __Global Variables in HTML__
  * With JavaScript, the global scope is the complete JavaScript environment.
  * In HTML, __the global scope is the window object__. All global variables belong to the __window__ object.
* __Automatically Global__
  * 如果賦值給未宣告的變數，會自動變成 global 變數 (it will __automatically become a GLOBAL variable__.)
  * 如果是 "Strict Mode" ，就不會自動產生 global 變數


> Warning: **Do NOT create global variables unless you intend to.**
> * Your global variables (or functions) can overwrite window variables (or functions).
> * Any function, including the window object, can overwrite your global variables and functions.






## Example for Variables Scope

````js
console.log('======= Example 1: Function Level Scope ============');
myFunc1();
console.log("Global: typeof n1=", typeof n1); //n1 is not defined
console.log("Global: typeof n2=", typeof n2, " value=", n2);

function myFunc1(){
    var n1 = "John";
    console.log("myFunc1(): typeof n1=", typeof n1);
    n2 = "Annie"; // Automatically Global
}

console.log('======= Example 2: Global Level Scope with `var` ============');
var n3 = "Rubio";
myFunc2();

function myFunc2(){
    console.log("myFunc2(): typeof n3=", typeof n3, " value=", n3);
    console.log("myFunc2(): typeof this.n3=", typeof this.n3, " value=", this.n3);
    console.log("myFunc2(): typeof window.n3=", typeof window.n3, " value=", window.n3); //Global Variables in HTML
}

console.log('======= Example 3: Global Level Scope with `let` ============');
let n4 = "Soar";
myFunc3();

function myFunc3(){
    console.log("myFunc3(): typeof n4=", typeof n4, " value=", n4);
    console.log("myFunc3(): typeof this.n4=", typeof this.n4, " value=", this.n4);
    console.log("myFunc3(): typeof window.n4=", typeof window.n4, " value=", window.n4);
}
````

Result:

````
======= Example 1: Function Level Scope ============
myFunc1(): typeof n1= string
Global: typeof n1= undefined
Global: typeof n2= string  value= Annie

======= Example 2: Global Level Scope with `var` ============
myFunc2(): typeof n3= string  value= Rubio
myFunc2(): typeof this.n3= string  value= Rubio
myFunc2(): typeof window.n3= string  value= Rubio

======= Example 3: Global Level Scope with `let` ============
myFunc3(): typeof n4= string  value= Soar
myFunc3(): typeof this.n4= undefined  value= undefined
myFunc3(): typeof window.n4= undefined  value= undefined
````




