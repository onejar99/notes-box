# JS Syntax & Statements

[TOC]



## JavaScript is a programming language

* A __computer program__ is a list of "instructions" to be "executed" by the computer.
    * In a programming language, these program instructions are called __statements__.
    * In HTML, JavaScript programs can be executed by the web browser.


* JS statements 用 semicolons(分號) 或換行區隔
    * Ending statements with semicolon is not required, but highly recommended.
    * It is a default JavaScript behavior to close a statement automatically at the end of a line.
      * 有些語法支援拆成兩行以上 (e.g., `var`)，有些不行 (e.g., `return`)，會有預期外的結果
      * 原理：如果語法是不完整的，JS會嘗試繼續去讀下一行語法來完整它。但 `return` 本身可以自成完整語法，JS只會自動幫忙加上分號
    * function 宣告的結尾通常不加分號
      * Since a function declaration is not an executable statement, it is not common to end it with a semicolon.

````js
// it's fine
var
x = 10;
````

````js
// it does not work as expected. return `undefined`
function myFunction(a) {
    return
    a * 10;
}

// because it will be considered as below:
function myFunction(a) {
    return;
    a * 10;
}
````




## JavaScript Statements are composed of

### Values

The JavaScript syntax defines two types of values:

* __Fixed values__:
    * are called __literals__(實字).
    * Numbers are written with or without decimals. EX: 10.50, 1001
    * Strings are text, written within double or single quotes. EX: "Hi", 'Hi'
* __Variable values__:
    * are called __variables__.
    * In a programming language, variables are used to store data values.
    * JavaScript uses the `var` keyword to declare variables.

      > EX: var x;


### Operators

* assignment operator ( `=`, a.k.a. equal sign ) to assign values to variables.
  > EX: var x = 5;
* arithmetic operators ( `+` `-` `*` `/` ) to compute values.
  > EX: 5 + 6 * 10


### Expressions

* An expression is a combination of values, variables, and operators, which computes to a value.
* The computation is called an __evaluation__.

  > EX1: 5 * 10 (evaluates to 50)

  > EX2: x * 10

  > EX3: "John" + " " + "Doe"

  > EX4: ( 10 > 9 ) (evaluates to true)


### Keywords

* E.g., `var`, `return`, `continue`, `break`, `if...else...`
* JavaScript keywords are used to identify actions to be performed.
* JavaScript keywords are __reserved words__. Reserved words cannot be used as names for variables.
* [JavaScript keyword list](http://www.w3schools.com/js/js_statements.asp)



### Comments

* 註解，單行用 `//`，多行用 `/*` and `*/`

```js
//it's a comment
/*it's a comment block*/
```

> * It is most common to use single line comments.
> * Block comments are often used for formal documentation.



## JavaScript is Case Sensitive

* All JavaScript identifiers are case sensitive.
  * E.g., `VAR` or `Var` does not be interpreted as the keyword `var`.
  * E.g., `lastName` and `lastname`, are two different variables.



## JavaScript White Space

* JavaScript __ignores__ multiple spaces. You can add white space to your script to make it more readable.


  ````js
  // The following lines are equivalent:
  var person = "Hege";
  var person="Hege";

  // A good practice is to put spaces around operators ( = + - * / ):
  var x = y + z;
  ````



## JavaScript Character Set

* JavaScript uses the __Unicode__ character set.
* Unicode covers (almost) all the characters, punctuations, and symbols in the world.
* For a closer look, please study our [Complete Unicode Reference](http://www.w3schools.com/charsets/ref_html_utf8.asp).



## JavaScript Line Length and Line Breaks

* For best readability, programmers often like to __avoid code lines longer than 80 characters__.
* If a JavaScript statement does not fit on one line, the best place to break it, is after an operator:

```js
document.getElementById("demo").innerHTML =
  "Hello Dolly.";
```
