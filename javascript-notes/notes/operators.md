# JS Operators

[TOC]



---

## Arithmetic Operators (算數運算子)

### Overview

| Operator | Description      |
| -------- | ---------------- |
| +        | Addition 加       |
| -        | Subtraction 減    |
| *        | Multiplication 乘 |
| /        | Division 除       |
| %        | Modulus 取餘數      |
| ++       | Increment 遞增     |
| --       | Decrement 遞減     |
| **       | Exponentiation   |




### Numeric Strings 的運算

* 如果對字串型態進行運算，JavaScript 會嘗試轉型成數字去做算術運算
* 但如果是加號 (+)，會被當作是 concat 運算子


Example:

````js
//Numeric Strings
//JavaScript will try to convert strings to numbers in all numeric operations:
console.log( "100" * "10" ); //1000
console.log( "100" / "10" ); //10
console.log( "100" - "10" ); //90
console.log( "100" + "10" ); //"10010" (here "+" is used to concatenate strings, instead of add numbers)

console.log( "Hello" - "Dolly" );   // NaN
````



### Confused case for ++/--

> `cnt++`: 執行該行後才進行++
>
> `++cnt`: 執行該行前先進行++

Example:

```js
var cnt = 0;
function inc(){
	return cnt++;
}

for(i=0 ; i< 5 ; i++){
	console.log(inc());
}
```

result:

```
0
1
2
3
4
```



---

## Assignment Operators (賦值運算子)

Assign values to JavaScript variables. (和一般語言用法一樣)

| Operator           | Description         |
| ------------------ | ------------------- |
| =                  |                     |
| +=                 |                     |
| -=                 |                     |
| *=                 |                     |
| /=                 |                     |
| %=                 | same as "x = x % y" |
| <<=, &=, **=, etc. |                     |


> The **= operator is an experimental part of the ECMAScript 2016 proposal (ES7). It is not stable across browsers. Do not use it.


---

## Comparison Operators (布林運算子)

### Oerview

> * 不同型態的資料進行比較，可能產生不可預期的結果
> * 為了確保比較的結果如預期，**比較前最好先轉型成適當的型態**

| Operator | Description                       |
| -------- | --------------------------------- |
| ==       | equal value                       |
| ===      | equal value and equal type        |
| !=       | not equal                         |
| !==      | not equal value or not equal type |
| >        | greater than                      |
| <        | less than                         |
| >=       | greater than or equal to          |
| <=       | less than or equal to             |


> **Best Practice: Use === Comparison**
> * The `==` comparison operator always converts (to matching types) before comparison.
> * The `===` operator forces comparison of values and type.




### Comparing Different Types

當比較字串和數字：

* JavaScript 會將 string 轉型成數字
* 空字串會轉成 0
* 非數字的字串會轉成 `NaN` (which is always false, even `NaN===NaN`)
* E.g.,
  * `"12"` --> 12
  * `""` --> 0
  * `"John"` --> NaN

````js
console.log( 2 < 12 );      // true
console.log( 2 < "12" );    // true  (2 < 12)
console.log( 2 < "" );      // false (2 < 0)
console.log( 2 < "John" );  // false (2 < NaN)
console.log( 2 > "John" );  // false (2 > NaN)
console.log( 2 == "John" ); // false (2 == NaN)

console.log( Boolean( false == 0 ) );   // true
console.log( Boolean( false === 0 ) );  // false
console.log( Boolean( true == 1 ) );    // true
console.log( Boolean( true === 1 ) );   // false
console.log( Boolean( true == 2) );     // false

console.log( Boolean( null == 0) );            // false
console.log( Boolean( undefined == 0 ) );      // false
console.log( Boolean( null == undefined ) );   // true
console.log( Boolean( null === undefined ) );  // false

console.log( Boolean( 'John' > null ) );       // false
console.log( Boolean( 1 > null ) );            // true
console.log( Boolean( 0 > null ) );            // false
console.log( Boolean( 1 > NaN ) );             // false
````



### Comparing Strings

When comparing two strings, "2" will be greater than "12", because (alphabetically) 1 is less than 2.

```js
console.log( "2" < "12" );	// false ("2" < "1")
console.log( "2" > "12" );	// true  ("2" > "1")
console.log( "2" == "12" );	// false ("2" == "12")
```





----

## Ternary Operator (三元運算子)

| Operator | Description      |
| -------- | ---------------- |
| ?        | ternary operator |

Example:

````js
var x = ( 10 > 9 ) ? 'Good' : 'WTF';
console.log(x);		// 'Good'
````



---

## Logical Operators (邏輯運算子)

### Overview

| Operator | Description |
| -------- | ----------- |
| &&       | and         |
| \|\|     | or          |
| !        | not         |


### Comparison Operators VS. Logical Operators

* Comparison Operators 和 Logical Operators 常搭配使用，但其實有別

* 如果 condition 都是比較性的邏輯判斷(==/~=/>/<)，就和一般認知相同，**得到的結果是 true 或 false**

* 如果 condition 是邏輯運算子，**得到的結果是 Value**，原則如下：(原則和 Lua 一樣)

> * 全 and: 如果全部都是 true 的 condition，則回傳 **最後一個** condition 的 Value
> * 全 and: 如果其中摻有 false 的 condition，則回傳 **第一個** false 的 condition 的 Value
> * 全 or: 如果全部都是 false 的 condition，則回傳 **最後一個** condition 的 Value
> * 全 or: 如果其中摻有 true 的 condition，則回傳 **第一個** true 的 condition 的 Value
> * 混 and + or: **and 執行權重大於 or**，先把 and 的部分都優先處理完，剩下的就是全 or

* condition 的 Value 該被歸類為 true 或 false，依據 `Booelan()` 的結果
  * In JS, `0`, `false`, `NaN`, `undefined`, `null`, `''` 都是 false

* Example:

````js
false && 1 && 'hello'        // false
1 && false && 2 && 'hello'   // false
1 && 2 && 'hello'            // "hello"
1 && 2 && 'hello' && 0       // 0

false || NaN || '' || undefined || null || 0  // 0
false || 1 || 2 || 'hello'                    // 1

false || 1 || 'hello' && undefined || 2 && 0  // 1
// Evaluation Process:
// step 1: false || 1 || 'hello' && undefined || 2 && 0
// step 2: false || 1 || undefined || 0
// step 3: 1
````





---

## Concatenation Operators (串接運算子)

### Overview

* Adding Strings using `+` and `+=`

````js
var name = "John" + " " + "Smith";
var text = "How are you?";
text += "Fine, thanks.";
````



### Concating Numbers and Strings

* 當數字和 string 混在一起進行運算時，從左到右依序運算，只要遇到一個字串，後續的數字都會被當字串處理

EX:

````js
var x = 5 + 2 + 3; //10 (numeric)
var y = 5 + 2 + "3"; //"73"(string data type)
var z = "5" + 2 + 3; //"523"
var x = 16 + "Volvo"; //(equal to) var x = "16" + "Volvo";
var x = 16 + 4 + "Volvo"; // "20Volvo"
var x = "Volvo" + 16 + 4; // Volvo164
var x = "Volvo" + (16 + 4); // Volvo20
````
---

## Type Operators (型別運算子)

### Overview

| Operator   | Description                              |
| ---------- | ---------------------------------------- |
| typeof     | Returns the type of a variable           |
| instanceof | Returns true if an object is an instance of an object type |



### Example for typeof:

````js
typeof "John"                 // "string"
typeof 3.14                   // "number"
typeof false                  // "boolean"
typeof {name:'John', age:34}  // "object"
typeof [1,2,3,4]              // "object" (not "array", The typeof operator returns "object" for arrays because in JavaScript arrays are objects.)
typeof NaN                    // "number"
typeof new Date()             // "object"
typeof new String()           // "object"
typeof new Number()           // "object"
typeof new Boolean()          // "object"
typeof function () {}         // "function"
typeof myCar                  // "undefined" *
typeof null                   // "object"
````



### Example for instanceof:

> NOTE: **原生型別(Primitive)的 string, number 不適合用`instanceof`來判斷**

````js
var s = 'abc';
console.log( typeof s );              // "string"
console.log( s instanceof String );   // false

var s2 = new String('abc');
console.log( typeof s2 );             // "object"
console.log( s2 instanceof String );  // true

var x = 1;
console.log( typeof x );              // "number"
console.log( x instanceof Number );	  // false
console.log( x instanceof Array );    // false

var ary = ['Apple', 'Banana', 'Cake'];
console.log( ary instanceof Array );  // true
````



---

## Bitwise Operators (位元運算子)

* 位元運算時，數字會被轉成 __32 bit__ 數字，位元運算完再轉回普通的 JavaScript Number

| Operator | Description           | Example | Same as         | Result       | Decimal |
| -------- | --------------------- | ------- | --------------- | ------------ | ------- |
| &        | AND (兩方皆1才1)          | 5 & 1   | 0101 & 0001     | 0001         | 1       |
| \|       | OR (兩方有1就1)           | 5 \| 1  | 0101 \| 0001    | 0101         | 5       |
| ~        | NOT (01相反)            | ~ 5     | ~ 0000.....0101 | 1111....1010 |         |
| ^        | XOR (兩方一1一0才1)        | 5 ^ 1   | 0101 ^ 0001     | 0100         | 4       |
| <<       | Zero fill left shift  | 5 << 1  | 0101 << 1       | 01010        | 10      |
| >>       | Signed right shift    | 5 >> 1  | 0101 >> 1       | 0010         | 2       |
| >>>      | Zero fill right shift | 5 >>> 1 | 0101 >>> 1      |              |         |

----

## Other Operators

### new

> Create objects



### delete

Ref: [delete operator - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/delete)

1. `delete` operator 可以用來移除變數，有回傳值，回傳是否移除成功
2. `delete` 根據移除變數對象的型別不同，有不同結果：
    * number: N
    * string: Y (會移除掉整個宣告，變成一個為定義的變數)
    * array: N
    * an element from an array: Y (移除的元素 index 不會被填補，會變成 empty，也就是 undefined)
    * object: N
    * a property from an object: Y (無論該 property 是否存在，都會回傳 true)
    * function: N (無論是 declaration 或 expression)




````js
// number (false)
var x = 10;
console.log( x ); //10
var ret = delete x;
console.log( x ); //10
console.log(ret); //false

// string
var name = 'John';
console.log(name);    //"John"
var ret = delete name;
//console.log(name);  //X(Uncaught ReferenceError: name is not defined)
console.log(ret);     //true

// array (false)
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);  // ["Banana", "Orange", "Apple", "Mango"]
var ret = delete fruits;
console.log(fruits);  //  ["Banana", "Orange", "Apple", "Mango"]
console.log(ret);       //false

// array element
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);  // ["Banana", "Orange", "Apple", "Mango"]
var ret = delete fruits[2];
console.log(fruits);  // ["Banana", "Orange", empty, "Mango"]
console.log(fruits[2]); // undefined
console.log(ret);       //true

// object (false)
var person = {name: 'John', age:18};
console.log(person);                      // {name: "John", age: 18}
var ret = delete person;
console.log(person);                      // {name: "John", age: 18}
console.log(ret);                         // false

// object existent property
var person = {name: 'John', age:18};
console.log(person);                      // {name: "John", age: 18}
var ret = delete person.name;
console.log(person);                      // {age: 18}
console.log(ret);                         // true

// object un-existent property
var person = {name: 'John', age:18};
console.log(person);                      // {name: "John", age: 18}
var ret = delete person.xxx;
console.log(person);                      // {name: "John", age: 18}
console.log(ret);                         // true

// function with declaration
function myFuncx(p1, p2) {};
console.log(myFuncx);                      // ƒ myFuncx(p1, p2) {}
var ret = delete myFuncx;
console.log(myFuncx);                      // ƒ myFuncx(p1, p2) {}
console.log(ret);                         //  false

// function with expression
var myFuncx = function(p1, p2) {};
console.log(myFuncx);                      // ƒ (p1, p2) {}
var ret = delete myFuncx;
console.log(myFuncx);                      // ƒ (p1, p2) {}
console.log(ret);                         //  false
````



---

## Operator Precedence (運算子的優先次序)

* E.g. 按照數學慣例，先乘除後加減

````js
var x = 100 + 50 * 3;    // 250
var x = (100 + 50) * 3;  // 450
````



* JavaScript Operator Precedence Values (JavaScript 裡所有運算子的優先值高低和舉例)
  * E.g., 最高為 `(` `)`，優先值為 19; `*` `/` 是 14，`+` `-` 是 13
  * [完整表參考](http://www.w3schools.com/js/js_arithmetic.asp)
