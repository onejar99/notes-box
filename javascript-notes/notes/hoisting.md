# JS Hoisting (宣告置頂效果)

[TOC]



## JS JavaScript Declarations are Hoisted

1. 為什麼 JS 變數可以在宣告(指有宣告動作，如`var`)之前就使用，而不會拋錯？ => **Hoisting**
   - 但如果始終沒有宣告過，仍會拋錯，如 Variable Case 2 例子
2. **Hoisting** is JavaScript's default behavior
   - 把所有宣告提到當前 scope 的頂端
   - (Move all declarations to the top of the current scope (to the top of the current script or the current function).)
3. Hoisting 效果包含(applies to):
   - 變數宣告 (variable declarations)
   - 函數宣告 (function declarations)
4. Hoisting 效果不包含:
   - JavaScript Initializations
   - e.g. `var y=7`，會置頂 declaration 部分 (var y)，但不會置頂 initialization 部分 (=7)
   - 使用 `function expression` 方式定義的 function (因為置頂的只是宣告變數本身，不含賦予的 Initializations)




----

## Variable Examples

Variable Case 1:

````js
x = 10;
y = 7;
console.log(x + ' ' + y);

//******result*******
// "10 7"
````

Variable Case 2:
````js
x = 10;
console.log(x + ' ' + y);
y = 7;

//******result*******
//Uncaught ReferenceError: y is not defined .....
````

Variable Case 3:

(Because of hoisting, y has been declared before it is used, but because initializations are not hoisted, the value of y is undefined.)

````js
x = 10;
console.log(x + ' ' + y);
var y = 7;

//******result*******
// "10 undefined"
````



----

## Function Examples

Function Case 1:

````js
console.log( myFun1() );

function myFun1() {
    return "Hi";
}

//******result*******
//"Hi"
````


Function Case 2:

````js
console.log( myFun2 );
console.log( myFun2() );

var myFun2 = function(){
  return "Hi";
};

//******result*******
//undefined
//Uncaught TypeError: myFun2 is not a function
````

Function Case 3:

````js
var myFun2 = function(){
  return "Hi";
};

console.log( myFun2() );

//******result*******
//"Hi"
````



## Declare Your Variables At the Top of Every Scope !

> JavaScript in strict mode does not allow variables to be used if they are not declared.