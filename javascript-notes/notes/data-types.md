# JS Data Types

[TOC]





## JS Data Types are Dynamic

This means that the same variable can be used as different types.

mynote: 動態型別不等於弱型別，但JS是動態型別+弱型別

Example:

````js
var x; // Now x is undefined
var x = 5; // Now x is a Number
var x = "John"; // Now x is a String
````

---

## JS Primitive Data & Complex Data

* 一個 __primitive data__ 的 value 是一個單一簡單的值，沒有額外的 properties 或 methods
* `typeof` operator 會回傳的 primitive types 有 :
   * `string`
   * `number`
   * `boolean`
   * `undefined`
   * (note: 應該還要有一個 `null`，可視為目前 JavaScript 的 bug)
* `typeof` operator 會回傳的 complex types 有 :
   * `function`
   * `object`

---

## JS Data Type Overview

JavaScript variables can hold many data types: numbers, strings, arrays, objects and more:

> mynote:
>
> * 看到一個變數的 `typeof` 回傳 `object` 的話，包含很多種可能，例如 Array, String, Number, .....
> * array, object, null 雖然 typeof 都是 `object`，但對 JavaScript 來說都算是不同的 Data Type，有不同的 method 操作
> * 也就是說，**把 typeof 回傳的結果當作是一種父型別，作為初步分類或參考性的資訊，而非精準具體的 data type** (事實上 `typeof null` 確實有 bug)



`*`: 表示 Primitive types

| Data Type                          | Example                                  | Value of Example <br/> (console.log(x))  | Type of Example <br/> (Return of typeof x) |
| ---------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Number 數字 *                        | var length = 16;                         |                                          | "number"                                 |
| String 字串 *                        | var lastName = "Johnson";                |                                          | "string"                                 |
| Boolean 布林 *                       | var bool = true;                         |                                          | "boolean"                                |
| Undefined *                        | var person; <br/>var person = undefined; | undefined                                  | "undefined"                              |
| Null 物件(Object)                    | var person = null;                       | null                                     | "object"                                 |
| Array 陣列                           | var cars = ["Saab", "Volvo", "BMW"];     | (3) ["Saab", "Volvo", "BMW"]             | "object" <br/>(because in JavaScript arrays are objects.) |
| Date 日期                            | var d = Date()                           | "Wed Mar 25 2015 11:13:00 GMT+0800 (台北標準時間)" | "object"                                 |
| Object 物件                          | var x = {firstName:"John", lastName:"Doe"}; |                                          | "object"                                 |
| Function 函數                        | function toCelsius(f) {<br/> return (5/9) * (f-32); <br/>} | "function toCelsius(f) { return (5/9) * (f-32); }" | "function"                               |
| String, Number, Boolean 物件 (應避免使用) | var x = new String();<br/>var y = new Number();<br/>var z = new Boolean(); | typeof x= String {length: 0, [[PrimitiveValue]]: ""}<br/>typeof y= Number {[[PrimitiveValue]]: 0}<br/>typeof z= Boolean {[[PrimitiveValue]]: false} | "object"                                 |

---

## Numbers

### 1. 數字型態只有一個"Number"型態

JavaScript 的數字只存成一種 64 bit 的浮點數，不像其他語言定義很多數字型態(integers, short, long, floating-point, etc.)

> JavaScript has only one type of numbers.
> Numbers can be written with, or without decimals.

````js
var x = 15.00; // Written with decimals
var y = 9; // Written without decimals
console.log( x / y ); //1.6666666666666667
console.log( x % y ); //6
````



### 2. 特殊數值：NaN (Not a Number)

* `NaN` 是 JavaScript reserved word
* 指定一個 `number` 是不合法的數字 (所以 type 還是 `number`)

````js
console.log( NaN ); //NaN
console.log( typeof NaN ); //"number"
console.log( 100 / "Apple" ); //NaN
console.log( 100 + NaN );//NaN
console.log( "100" + NaN );//"100NaN"
console.log( isNaN( 100 / "Apple" ) ); //true
console.log( isNaN( 100 / "10" ) );  //false
````



### 3. 特殊數值：Infinity (無窮值)

> *  如果算術運算超出可能的數字極限，會回傳無窮值 (if you calculate a number outside the largest possible number.)
> *  type 還是 `number`，有正負值分別 (`Infinity` / `-Infinity`)
> *  `Infinity` 仍是合法的數字，和 `NaN` 不同

````js
console.log( Infinity ); //Infinity
console.log( -Infinity ); //-Infinity
console.log( typeof Infinity ); //"number"
console.log( 2 / "Apple" ); //NaN
````

> Division by 0 (zero) also generates `Infinity`:

````js
console.log( 2 / 0 ); //Infinity
console.log( -2 / 0 ); //-Infinity
````



Example:


````js
var num = 2;
while(num != Infinity){
	console.log("now num=" + num);
	num *= num;
}
console.log("final num=" + num);
````

Result:

````
now num=2
now num=4
now num=16
now num=256
now num=65536
now num=4294967296
now num=18446744073709552000
now num=3.402823669209385e+38
now num=1.157920892373162e+77
now num=1.3407807929942597e+154
final num=Infinity
````



### 4. 特殊數字表示形式：指數(e)

> * 極大或極小的數字可以被寫成指數形式 (Extra large or extra small numbers can be written with scientific (exponential) notation.)
>
>
> * mynote: 把e想成小數點的位移，e後面的正負值表示往前移或往後移

EX:

````js
var y = 123e5; // 12300000
var z = 123e-5; // 0.00123
````



### 5. Numeric operations of Numeric Strings

> JavaScript will try to convert strings to numbers in all numeric operations (除了 `+` operator)


````js
console.log( "100" * "10" ); //1000
console.log( "100" / "10" ); //10
console.log( "100" - "10" ); //90
console.log( "100" + "10" ); //"10010" (here "+" is used to concatenate strings, instead of add numbers)
````



### 6. Hexadecimal / octal / binary / decimals (各種進制)

> 1. By default, JavaScript displays numbers as base 10 decimals.
> 2. But you can use the toString() method to output numbers as base 16 (hex), base 8 (octal), or base 2 (binary).
> 3. **Never write a number with a leading zero (like 07)**
>    - 因為某些 JavaScript versions 會把 0 開頭的數字直譯為八進制

````js
var myNumber = 165;
console.log( myNumber.toString(16) );  // "a5"
console.log( myNumber.toString(8) );   // "245"
console.log( myNumber.toString(2) );   // "10100101"
````


> Hex:
> JavaScript interprets numeric constants as hexadecimal if they are preceded by __0x__.

````js
console.log(0xFF); //255
````



### 7. Precision (精度)

> * **整數** ：準確度到15位數

````js
//Integers (numbers without a period or exponent notation) are accurate up to 15 digits.
console.log( "d9_15=", 999999999999999 );    //d9_15= 999999999999999
console.log( "d9_16=", 9999999999999999 );   //d9_16= 10000000000000000
console.log( "d9_17=", 99999999999999999 );  //d9_17= 100000000000000000
console.log( "d9_18=", 999999999999999999 ); //d9_18= 1000000000000000000
````


> * **浮點數** ：運算非 100% 精準
> * 解決法：**用乘除避開浮點數間的運算**

````js
//floating point arithmetic is not always 100% accurate
console.log( 0.2 + 0.1 );                  //0.30000000000000004
console.log( 0.2 + 0.3 );                  //0.5
console.log( (0.2 * 10 + 0.1 * 10) / 10 ); //0.3
````





### 8. More: JavaScript Numbers 64-bit 儲存原理

> * JavaScript numbers are always stored as double precision floating point numbers, following the international IEEE 754 standard.
> * 儲存原理如下：

|              | Value (aka Fraction/Mantissa) | Exponent | Sign  |
| ------------ | ----------------------------- | -------- | ----- |
| bit position | 0~51                          | 52~63    | 63    |
| bit legnth   | 52 bits                       | 11 bits  | 1 bit |




---

## Strings

1. A string (or a text string) is a series of characters like "John Doe".

2. 用單引號或雙引號都可以，只要成對即可

Example:

````js
var carName = "Volvo XC60"; // Using double quotes
var carName = 'Volvo XC60'; // Using single quotes
var answer = "It's alright"; // Single quote inside double quotes
var answer = "He is called 'Johnny'"; // Single quotes inside double quotes
var answer = 'He is called "Johnny"'; // Double quotes inside single quotes
var x = 'It\'s alright'; // Using the escape character
````


3. 雙引號內想包一個雙引號的跳脫字元

````js
console.log("ab\"c");
console.log('ab\'c');
````


4. 過長字串的換行方式 (break up a long string)

Example:

````js
// 1. safer way
var txt = "ABCD EFGH IJK LMN " +
"OPQR STUV WXYZ";

// 2. workable but not preferred
var txt = "ABCD EFGH IJK LMN \
OPQR STUV WXYZ";

// 3. cannot work (not allow spaces behind the \ character.)
var txt = "ABCD EFGH IJK LMN \ 
OPQR STUV WXYZ";

// 4. cannot work
var txt = "ABCD EFGH IJK LMN
OPQR STUV WXYZ";
````



---

## Booleans

* Booleans can only have two values: `true` or `false`.


* 0 和 false、1 和 true 被視為 **同值不同型態**

````js
0==false //true
0===false //false

1==true //true
1===true //false

2==true //false
````





------

## Date

1. A JavaScript date can be written as:
   - string: `Tue Dec 05 2017 17:44:20 GMT+0800 (台北標準時間)`
   - number: `1512467060522` (milliseconds since January 1, 1970, 00:00:00.)



2. Time zone：有 3 種時區表示：
  - Local time (browser's time zone)
  - UTC (Universal Time Coordinated)
  - GMT (Greenwich Mean Time)
  > UTC is the same as GMT



3. 在 getting 或 setting 時，如果沒有指定時區，基本上就是以瀏覽器的時區為準

Example:

```js
var d = new Date();
var d = new Date(86400000); //Fri Jan 02 1970 08:00:00 GMT+0800 (台北標準時間)
var d = new Date("March 25, 2015 11:13:00");  //Wed Mar 25 2015 11:13:00 GMT+0800 (台北標準時間)
var d = new Date("2015-03-25"); //(ISO Date, The International Standard)
```



---

## Arrays

Example:

````js
var cars = ["Saab", "Volvo", "BMW", 46];
document.getElementById("demo").innerHTML = cars[0]; //Saab
document.getElementById("demo").innerHTML = cars; // Saab,Volvo,BMW
document.getElementById("demo").innerHTML = cars[3]; //46
document.getElementById("demo").innerHTML = cars[10]; //undefined
````


1. 用中括號表示，裡面的成員用逗號分隔



2. 同一個陣列可以放不同型別的物件 e.g. object, function, string, number, array, ...



3. In JavaScript, **arrays** always use **numbered indexes**.
  > * Arrays use **numbers** to access its "**elements**"
  > * Objects use **names** to access its "**members**"



4. **Avoid using `new Array()`!! Use `[]` instead.**


There are 2 ways to create arrays:
  * Way 1: using the array literal method (`[]`)
  * Way 2: using the keyword `new` (`new Array()`)

  > Way 1 & 2 do exactly the same.

```js
var cars = ["Saab", "Volvo", "BMW"]; // way1: array literal method.
var cars = new Array("Saab", "Volvo", "BMW"); // way2: using keyword **new**
```


> *Note: Why not using new Array()?*
>
> 1. There is no need to use new Array(). For simplicity, readability and execution speed.
> 2. **It can also produce some unexpected results:**

````js
var ary1 = new Array(10, 100);
console.log(ary1);             // [10, 100]
console.log(ary1.length);      // 2

var ary2 = new Array(10);
console.log(ary2);             // [empty × 10]
console.log(ary2.length);      // 10
````





---

## Objects

### 1. Object 宣告

以 __object literal__ 方式去宣告一個 object (相當於 "new" 的動作)

* 用大括號表示
* 裡面的 __屬性(properties)__ 用 __名值對(name-value pairs)__ 表示
* 多個屬性以逗號 (comma) 分隔
* 宣告完後，還是可以再增加 properties 進去

Example:

````js
// object literal
var person = {
  firstName : "John",
  lastName : "Doe",
  age : 50,
  eyeColor : "blue"
};

console.log( person.firstName + " is " + person.age + " years old." ); // John is 50 years old.
console.log( person.toString() ); //[object Object]
console.log( person ); // {firstName: "John", lastName: "Doe", age: 50, eyeColor: "blue"}

person.address = "Mars Rd. 123";
console.log( person ); //{firstName: "John", lastName: "Doe", age: 50, eyeColor: "blue", address: "Mars Rd. 123"}
````



### 2. Object Properties

存取 property 的語法:

````js
var person = {
  firstName:"John"
};

person.firstName;     //"John"
person["firstName"];  //"John"
// person[firstName];    // X (not work)
````



### 3. Object Methods

- Methods 是物件裡可以被執行的 __動作__ (Methods are actions that can be performed on objects.)
- Method 其實就是一個被存在 property value 裡的  function 定義 (Methods are stored in properties as function definitions. A method is actually a function definition stored as a property value.)

Example of accessing properties and methods:

```js
var person = {
  firstName:"John",
  lastName:"Smith",
  getFullName:function(){
    return this.firstName + " " + this.lastName;
  }
};

console.log( person.firstName ); //"John"
console.log( person["firstName"] ); //"John"
// console.log( person[firstName] ); // X (not work)
console.log( person.getFullName ); // ƒ (){ return this.firstName + " " + this.lastName; }
console.log( person.getFullName() ); //"John Smith"
```



### 4. Objects, Properties, and Methods 間的關係

* 現實世界舉例，一台車子是一個 object，有很多 properties (重量、顏色)，有很多功能動作 (啟動、煞車)
  * 每台車有一樣的 properties 種類，但 properties 值不一樣
  * 每台車有一樣的 methods，但各自執行的時間不一樣
* 物件也是變數，但可以包含很多被命名的值，每一組 name:value 稱為 `property`
* 物件是 `property` 和 `method` 的容器
* 用物件實字來定義物件 (You define (and create) a JavaScript object with an object literal) :

Example:

````js
var car = {type:"Fiat", model:"500", color:"white"}; //property(e.g.type), property value(e.g."Fiat")
````



### 5. Constructor Property

The **constructor property** returns the **constructor function** for all JavaScript variables.    

````js
console.log("John".constructor);                // Returns function String()  {[native code]}
console.log((3.14).constructor);                // Returns function Number()  {[native code]}
console.log(false.constructor);                 // Returns function Boolean() {[native code]}
console.log([1,2,3,4].constructor);             // Returns function Array()   {[native code]}
console.log({name:'John',age:34}.constructor);  // Returns function Object()  {[native code]}
console.log(new Date().constructor);            // Returns function Date()    {[native code]}
console.log(function () {}.constructor);        // Returns function Function(){[native code]}
console.log(NaN.constructor);                   // Returns function Number(){[native code]}
console.log(null.constructor);                  // X (Cannot read property 'constructor' of null)
````


Date/Array 物件的型別無法用原生 `typeof` 運算子判斷，可以用 **constructor property** 去自訂函數做到：

````js
function isArray(myArray) {
    return myArray.constructor.toString().indexOf("Array") > -1;
}

function isArray(myArray) {
    return myArray.constructor === Array;
}

function isDate(myDate) {
    return myDate.constructor.toString().indexOf("Date") > -1;
}

function isDate(myDate) {
    return myDate.constructor === Date;
}
````




---

## Undefined

* 在 JavaScript 中，空字串、Null 和 undefined 不同
* 沒有值的變數，會擁有一個值叫 `undefined`，typeof 也是 `undefined` (In JavaScript, a variable without a value, has the value undefined. The typeof is also undefined.)
* 任何 JS 變數可以藉由賦值 `undefined` 來清空值

Example:

````js
var name = ""; //empty string, value is "", type is string)
var person; // Value is undefined, type is undefined
name = undefined; // Value is undefined, type is undefined
````

---

## Null

JavaScript 的 Null 是個物件，而非 null (可視為 JavaScript 的一個 bug)

> In JavaScript null is "nothing".   
> It is supposed to be something that doesn't exist.    
> Unfortunately, in JavaScript, the data type of null is an object.    
> You can consider it a bug in JavaScript that typeof null is an object.    
> It should be null.    



You can empty an object by setting it to null or undefined.

Example:

````js
var person = null; // Value is null, but type is still an object
var person = undefined; // Value is undefined, type is undefined
````

---

## Arrays vs. Objects


In JavaScript:
* **arrays** use numbered indexes
* **objects** use named indexes

JavaScript does not support arrays with named indexes.
* Arrays with named indexes are called associative arrays (or hashes).
* If you use a named index, when accessing an array, JavaScript will redefine the array to a standard object.


----



## Undefined vs. Null

mynote: 可以把 null 和 undifined 想成同 value 不同型態，就像 0 和 false

Refer to W3Schoole, with JavaScript:
* null is for objects
* undefined is for variables, properties, and methods.
* (mynote: 但除了直接對變數指定 null，目前不知還有什麼原生狀況會得到 null)


````js
typeof undefined // undefined
typeof null // object
null == undefined // true
null === undefined // false
````



---

## Do Not Declare Primitive as Objects

__Avoid String, Number, and Boolean objects.__

* When a JavaScript variable is declared with the keyword __"new"__, the variable is created as an object.

Example:

````js
var x = new String(); // Declares x as a String object
var y = new Number(); // Declares y as a Number object
var z = new Boolean(); // Declares z as a Boolean object
````



__Why Not?__

1. Slow down execution speed
2. Complicate your code. This can produce some unexpected results.

Example:

````js
// EX1: comparing a primitive string and a string object
var x = "John";
var y = new String("John");
console.log(typeof x); // string
console.log(typeof y); //object
console.log(x==y); // ture (because x and y have equal values)
console.log(x===y); // false (because x and y have different types)

// EX2: comparing 2 string objects
var s1 = new String("John");
var s2 = new String("John");
console.log(s1==s2); // false (because s1 and s2 are different objects)
console.log(s1===s2); // false (because s1 and s2 are different objects)
````

> Note:
> __Comparing two JavaScript objects will always return false.__

---

## Methods and Properties Are Available to Primitive

* Primitive values (like "John Doe") __cannot__ have properties or methods (because they are not objects).
* But with JavaScript, __methods and properties are also available to primitive values__
  * Because JavaScript treats primitive values as objects when executing methods and properties.

---

## JS By Value, By Reference, or By Sharing

Ref: [ [筆記] 談談JavaScript中by reference和by value的重要觀念](https://pjchender.blogspot.tw/2016/03/javascriptby-referenceby-value.html)

### mynote

1. JavaScript 和一般語言的 call by value 或 reference 行為不太一樣，文章說有人認為是 by Sharing，只是對 Primitive Data 時表現行為類似 by Value，對 Object 行為類似 by Reference

2. 各種 Data Type 的行為：

   1. null 的行為和 Primitive(string, number, boolean, undefined) 一樣都是 by Value (等於是 copy 一份到新盒子)
   2. Object (包含 Array) 的行為是 by Reference，object literal 例子用盒子方式去想就不會搞錯，literal 部分是另劃出一塊 address，也就是產生新盒子
   3. Function 理論上可能 by Reference，但因為似乎沒辦法像修改 Object 屬性那樣去操縱 Function 的實體，所以展現出來的效果像 by Value
   4. 傳入 Function 的參數，運作上和各 Data Type 原本行為一樣，Object 會有連動關係。但要記得 paramters 等於是新盒子，所以如果有做了相當於 "new" 的動作 (例如 literal 設值)，就跟舊盒子沒關係了 (trial 10)

3. 用 Chrome 的 F12 Console debug 時要小心 ，如果是 console.log()，當下會印出 log，但如果是物件 (有三角形可以點開)，因為是 by reference，展開後會顯示的是"物件現在的值"，也就是跟印出當下的值可能不一樣

Simple Test Code:

````js
var person1 = { name:"111"};
var person2 = person1;
console.log("person1=", person1);  // person1= {name: "111"}
console.log("person2=", person2);  // person2= {name: "111"}
person1.name = "222";
console.log("person1=", person1);  // person1= {name: "222"}
console.log("person2=", person2);  // person2= {name: "222"}
````

   ​

### Trial Code

````html
<p id="demo"></p>
<script>
// purely for code reusable
function printToScreen(wording, val){
    document.getElementById("demo").innerHTML += "<br/>" + wording + "=" + val;
}

//--- trial 1: string (by value)
var str1 = "111";
var str2 = str1;
printToScreen("str1", str1);	//str1="111"
printToScreen("str2", str2);	//str2="111"
str1 = "222";
printToScreen("str1", str1);	//str1="222"
printToScreen("str2", str2);	//str2="111"

//--- trial 2: null (by value)
var n1 = null;
var n2 = n1;
printToScreen("n1", n1);		//n1=null
printToScreen("n2", n2);		//n2=null
n1 = "something";
printToScreen("n1", n1);		//n1="something"
printToScreen("n2", n2);		//n2=null

//--- trial 3: undefined (by value)
var ud1 = undefined;
var ud2 = ud1;
printToScreen("ud1", ud1);		//ud1=undefined
printToScreen("ud2", ud2);		//ud2=undefined
ud1 = "something";
printToScreen("ud1", ud1);		//ud1="something"
printToScreen("ud2", ud2);		//ud2=undefined

//--- trial 4: array (by reference)
var ary1 = ["111"];
var ary2 = ary1;
printToScreen("ary1", ary1[0]);	//ary1[0]="111"
printToScreen("ary2", ary2[0]);	//ary2[0]="111"
ary1[0] = "222";
printToScreen("ary1", ary1[0]);	//ary1[0]="222"
printToScreen("ary2", ary2[0]);	//ary2[0]="222"

//--- trial 5: array literal (re-allocate)
var ary1 = ["111"];
var ary2 = ary1;
printToScreen("ary1", ary1[0]);	//ary1[0]="111"
printToScreen("ary2", ary2[0]);	//ary2[0]="111"
ary1 = ["222"];
printToScreen("ary1", ary1[0]);	//ary1[0]="222"
printToScreen("ary2", ary2[0]);	//ary2[0]="111"

//--- trial 6: object (by reference)
var person1 = { name:"111"};
var person2 = person1;
printToScreen("person1", person1.name);	//person1..name="111"
printToScreen("person2", person2.name);	//person2..name="111"
person1.name = "222";
printToScreen("person1", person1.name);	//person1.name="222"
printToScreen("person2", person2.name);	//person2.name="222"

//--- trial 7: object literal (re-allocate)
var person1 = { name:"111"};
var person2 = person1;
printToScreen("person1", person1.name);	//person1.name="111"
printToScreen("person2", person2.name);	//person2.name="111"
person1 = { name: "222"};
printToScreen("person1", person1.name);	//person1.name="222"
printToScreen("person2", person2.name);	//person2.name="111"

//--- trial 8: function literal 1
function func1(){ return "111"; }
var func2 = func1;
printToScreen("func1", func1);			//func1=function func1(){ return "111"; }
printToScreen("func2", func2);			//func2=function func1(){ return "111"; }
function otherFunc(){ return "222"; }
func1 = otherFunc;
printToScreen("func1", func1);			//func1=function otherFunc(){ return "222"; }
printToScreen("func2", func2);			//func2=function func1(){ return "111"; }

//--- trial 9: function literal 2
function func1(){ return "111"; }
var func2 = func1;
printToScreen("func1", func1);			//func1=function otherFunc(){ return "111"; }
printToScreen("func2", func2);			//func2=function otherFunc(){ return "111"; }
func1 = function(){ return "333"; }
printToScreen("func1", func1);			//func1=function (){ return "333"; }
printToScreen("func2", func2);			//func2=function otherFunc(){ return "111"; }

//--- trial 10: function parameters 1
function changName(person, newName){
	person.name = newName;
}
function setNewPerson(person, newName){
	person = { name: newName };
    printToScreen("p-new", person.name);
}
var p1 = { name:"111" };
var p2 = p1;
printToScreen("p1", p1.name);
printToScreen("p2", p2.name);
changName(p1, "222");
printToScreen("p1", p1.name);
printToScreen("p2", p2.name);
setNewPerson(p1, "333");
printToScreen("p1", p1.name);
printToScreen("p2", p2.name);
// ***** result of trial 10: *****
//p1=111
//p2=111
//p1=222
//p2=222
//p-new=333
//p1=222
//p2=222


//--- trial 11: function parameters 2
var person = { name:"John"};
var newName = "Andrew";
console.log("person=", person);
console.log("newName=", newName);

rename(person, newName);

console.log("person=", person);
console.log("newName=", newName);

function rename(person, newName){
  newName = "Rubio";
  person.name = newName;

  console.log("(inFunc) person=", person);
  console.log("(inFunc) newName=", newName);
}
//******** result of trial 11: **************
// person= {name: "John"}
// newName= Andrew
// (inFunc) person= {name: "Rubio"}
// (inFunc) newName= Rubio
// person= {name: "Rubio"}
// newName= Andrew

</script>
````