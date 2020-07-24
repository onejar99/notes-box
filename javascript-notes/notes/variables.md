# JS  Variables

[TOC]



## Intro

* All JavaScript variables must be identified with unique names. These unique names are called __identifiers__.
* In JavaScript, __objects and functions are also variables__.




## Identifiers 變數命名規則

* The first character must be:
    * a letter
    * an underscore (_)
    * a dollar sign ($)

* Subsequent characters may be:
    * letters
    * digits
    * underscores (_)
    * dollar signs ($)
    * PS: __Hyphens are not allowed__ in JavaScript. It is reserved for subtractions.

> **Do not start names with a $ sign.**    
> It will put you in conflict with many JavaScript library names.


* JavaScript and Camel Case(駝峰式)
    * Historically, programmers have used different ways of joining multiple words into one variable name:

    | Way                            | Example    |
    | ------------------------------ | ---------- |
    | Hyphens                        | first-name |
    | Underscore                     | first_name |
    | Upper Camel Case (Pascal Case) | FirstName  |
    | Lower Camel Case               | firstName  |

    * __JavaScript programmers tend to use camel case that starts with a lowercase letter__:
      > EX: firstName



## Declaring JavaScript Variables

* You declare a JavaScript variable with the `var` keyword:
* It's a good programming practice to declare all variables at the beginning of a script.


````js
var carName1; //A variable declared without a value will have the value **undefined**.
var carName2 = "Volvo";
var person = "John Doe", carName3 = "Volvo", price = 200;
````



## Re-Declaring JavaScript Variables

If you re-declare a JavaScript variable, __it will not lose its value__.

Example:

````js
var x;
console.log(x);
x = "123";
console.log(x);
var x;
console.log(x);
````

Result:

````
undefined
123
123
````

