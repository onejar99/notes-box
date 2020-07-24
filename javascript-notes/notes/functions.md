# JS Functions (Code Blocks)

[TOC]







## Function Basic Examples

```js
// Example 1
function myFunction() {
  console.log('Hello!');
}

// Example 2 (with paramters)
function myMath(p1, p2) {
  return p1 * p2; // The function returns the product of p1 and p2
}
console.log( myMath(4, 3) );

// Example 3 (another ways to declare function)
function func1(){ console.log("111"); }
var func2 = function(){ console.log("222"); }
var func4 = function func3(){ console.log("333"); } // invalid syntax
var func5 = func2;
func1(); //111
func2(); //222
func3(); //ReferenceError: func3 is not defined
func4(); //333
func5(); //222
```



----

## Function 定義本身也是一種變數，可被印出

* 有 `()` 運算子才是執行 Function


```js
// declaration function
function toCelsius(f) {
  return (5/9) * (f-32);
}

console.log( toCelsius ); // "ƒ toCelsius(f) { return (5/9) * (f-32); }" (return the function definition)
console.log( toCelsius(77) ); //25
console.log( typeof toCelsius ); //"function"
console.log( typeof toCelsius(77) ); //"number"
```



----

## Function Definition

### 宣告函數在語法上有 4 種方式

> ES6 多了第 5 種 —— Arrow Function

#### 1. **宣告式 (function declarations)**

````js
//syntax 1: Function Declarations (Hoisting)
console.log(myFunc1); // ƒ myFunc1(a, b) {return a * b;}
function myFunc1(a, b) {
    return a * b;
}
````


#### 2. **匿名表達式 (function expressions w/o function name)**

* 此方式定義的 function 實際上是 anonymous function (a function without a name)
* 只是將 function body 存在某個變數裡，該變數名稱不等於 function 名稱

````js
//syntax 2: Function Expressions w/o function name
var myFunc2 = function (a, b) {return a * b};
console.log(myFunc2); // ƒ (a, b) {return a * b}
````


#### 3. **具名表達式 (function expressions w/ function name)** *(沒事別用)*

* 定義的 function 印出來會有 function name (不等於變數名稱)
* 但**無法直接透過該 function name 呼叫** ，所以該 function name 基本上沒用
* (目前理解：因為該 function 仍不算正式宣告於此 scope，對此 scope 來說不存在該 name，所以無法直接透過 function name 呼叫)

````js
//syntax 3: Function Expressions w/ function name
var myFunc2 = function aaa(a, b) {return a * b};
console.log(myFunc2); // ƒ aaa(a, b) {return a * b}
console.log(aaa); // Uncaught ReferenceError: aaa is not defined
````


#### 4. **建構子式 (function constructor)** *(沒事別用)*

* with a built-in JavaScript function constructor called `Function()`
* **it's unnecessary to use this way**

````js
//syntax 4: Function Constructor
var myFunc3 = new Function("a", "b", "return a * b");
console.log(myFunc3); // ƒ anonymous(a,b /*``*/) { return a * b }
````



### 各方式差異

1. 只有宣告式有 Hoisting 效果，expression 和 constructor 都無
  > ES6 的 Arrow Function 也無

2. 印出 Function 定義有些微差異
  * expression w/o name 不會有 function名稱
  * constructor 會多一些符號





----


## Functions 基本規則

> A Function is much the same as a Procedure or a Subroutine, in other programming languages.

* __Function names__ :
  * 和變數命名規則相同
* 函數參數：
  * __Function parameters__ : 函數 **定義時** ，列在函數傳入參數定義裡的名稱 (are the names listed in the function definition.)
  * __Function arguments__ : 當函數 **實際被呼叫時** ，傳入的實際值 (are the real values received by the function when it is invoked.)
  * arguements 和 paramters 對函數來說都是 local 變數 (Inside the function, the arguments (the parameters) behave as local variables.)
* __Function Return__ : When JavaScript reaches a return statement, the function will stop executing.
* **Function Signature**:
  * 只有變數名稱(無視參數)
  * 等於不存在 overloadding
  * 容許重複定義同名稱的 function，等於重複宣告，**依定義順序以最後一個為準**


Example 1:

````js
myFunc();

function myFunc(){
  console.log('111');
}
function myFunc(p1){
  console.log('222');
}

//***** result *****
//222
````

Example 2:

````js
myFunc();

function myFunc(){
  console.log('111');
}
var myFunc = function(p1){
  console.log('222');
}

myFunc();

//***** result *****
//111 (because of Hosting)
//222
````



----

## Function Parameters & Arguments

### Parameters v.s. Arguments

mynote:

1. **arguments** 是實際傳入的參數的陣列
2. **parameters** 是定義時自己命名的參數名稱，但實際呼叫時不一定會被傳入；如果沒被傳入，此時 type 是 `undefined`



Example:

```js
function myFunc(a1, a2, a3){
  console.log("typeof a1=", typeof a1);
  console.log("a1=", a1);

  console.log("typeof arguments=", typeof arguments);
  console.log("arguments=", arguments);

  console.log("typeof arguments[0]=", typeof arguments[0]);
  console.log("arguments[0]=", arguments[0]);
}

console.log("====trial 1");
myFunc();
console.log("====trial 2");
myFunc("apple", "banana", "cookie", "egg");
```

Result:

```
====trial 1
typeof a1= undefined
a1= undefined
typeof arguments= object
arguments= [callee: ƒ, Symbol(Symbol.iterator): ƒ]
typeof arguments[0]= undefined
arguments[0]= undefined

====trial 2
typeof a1= string
a1= apple
typeof arguments= object
arguments= (4) ["apple", "banana", "cookie", "egg", callee: ƒ, Symbol(Symbol.iterator): ƒ]
typeof arguments[0]= string
arguments[0]= apple
```



### Function Parameter Defaults

避免函數呼叫時沒傳到所有參數 (called with a missing argument)，要額外為參數設定預設值：

```js
myFunction(5);
function myFunction(x, y) {
    if (y === undefined) {
        y = 99;
    }
    console.log(y);
}

//**********result*********
//99
```

ES6 有更簡潔的語法：

```js
myFunction(5);
function myFunction(x, y=99) {
    console.log(y);
}

//**********result*********
//99
```



### Function Arguments Object

* JavaScript functions have a built-in object called the **arguments object**.
* 因為 arguments 可以得到所有參數 (不管有沒有定義參數)，因此可以做到以下應用技巧：

```js
x = findMax(1, 123, 500, 115, 44, 88);
x = sumAll(1, 123, 500, 115, 44, 88);

function findMax() {
    var i;
    var max = -Infinity;
    for (i = 0; i < arguments.length; i++) {
        if (arguments[i] > max) {
            max = arguments[i];
        }
    }
    return max;
}
function sumAll() {
    var i;
    var sum = 0;
    for (i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}
```

> Note: ES6 的 Arrow Function 不能使用 arguments，讓 function 使用上更嚴謹。


---

## Function Invocation (函數呼叫)

### 有三種被呼叫的時機

1. When an event occurs (e.g. when an user clicks a button)
2. When it is invoked (called) from JavaScript code (e.g. 直接呼叫)
3. Automatically (self invoked)




### Self-Invoking Functions (立即函數)

#### Intro

* `Function expressions` can be made " **self-invoking** ".
  * A self-invoking expression 會自動執行，不用呼叫
  * 要在 function 前後用括號包起來，來指定這是一個 function expression
  * function expression 語法可以分 **匿名** 和 **具名** ，但此處 **具名** 仍沒什麼意義，無法另外呼叫
  * 在 expression 尾端加上`()`就會自動執行

* You **cannot** self-invoke a function declaration.

* mynote: 一開始不懂這樣寫的用意在哪，覺得很多餘，和不用 function block 包起來效果一樣




#### Examples

````js
// syntax 1: an anonymous self-invoking function
(function () {
    var x = "Hello!!";      // I will invoke myself
    console.log('222');
})();

// syntax 2: a self-invoking function with naming
(function abc () {
    var x = "Hello!!";      // I will invoke myself
    console.log('222');
})();
abc(); // ReferenceError: abc is not defined
````



#### 用途 1 : 封裝一次性 local scope

* 封裝一段想立刻執行的 code，建立一次性的 local scope
* 讓一次性變數的生命週期留在函數內，避免影響到後續全域變數


Before:

````js
var x = "Hello";
console.log(x);
console.log('Do something.....');
console.log(x); // x is still alive

//******** reuslt **********
// "Hello"
// "Do something....."
// "Hello"
````


After:

````js
(function () {
    var x = "Hello";      // I will invoke myself
    console.log(x);
})();

console.log('Do something.....');
console.log(x);

//******** reuslt **********
// "Hello"
// "Do something....."
// ReferenceError: x is not defined
````



#### 用途 2 : 閉包應用

將一次性 local scope 裡的物件或變數回傳出來

````js
var add = (function () {
    var counter = 0;
    return function () {return counter += 1;}
})();
console.log(add);
console.log(add());
console.log(add());

// *****result*****
// ƒ () {return counter += 1;}
// 1
// 2
````

效果和以下不一樣：(以下只是將一個函數物件放入 `add`，並沒有立即執行)

````js
var add = function() {
    var counter = 0;
    return function () {return counter += 1;}
};
console.log(add);
console.log(add());
console.log(add());

// *****result*****
// ƒ () {
//     var counter = 0;
//     return function () {return counter += 1;}
// }
// ƒ () {return counter += 1;}
// ƒ () {return counter += 1;}
````



#### 用途 3 : 為物件的屬性產生動態值

````js
var person = {
	age: (function (){ return 18; })()
};
console.log(person.age); //18
````



#### 用途 4 : 字串轉 function

可以把純字串轉成 function (因應 JSON 不支援儲存 function 型態的資料)

````js
var text = '{ "name":"John", "age":"function () {return 30;}", "city":"New York"}';
var obj = JSON.parse(text);
console.log(typeof obj.age); //"string"
console.log(obj.age); //"function () {return 30;}"
var ageFunc = eval("(" + obj.age + ")");
console.log(ageFunc); //ƒ () {return 30;}
console.log(ageFunc()); //30
````



#### 用途 5 : 瀏覽器書籤小工具

* 可以把語法存成瀏覽器的書籤，點下去就會立即執行
* E.g. 常見的`解除右鍵`工具

````js
javascript:(function() { function R(a){ona = "on"+a; if(window.addEventListener) window.addEventListener(a, function (e) { for(var n=e.originalTarget; n; n=n.parentNode) n[ona]=null; }, true); window[ona]=null; document[ona]=null; if(document.body) document.body[ona]=null; } R("contextmenu"); R("click"); R("mousedown"); R("mouseup"); R("selectstart");})()
````





----

## Functions are Objects

* JavaScript functions 也是 **objects**
  - 雖然 `typeof` 回傳 "function"
  - 因為有 properties 和 methods，所以 objects 共通有的 methods，function 也有 (e.g. `toString()`)


```js
function myFunc(a, b) { return a * b; }
console.log(myFunc.toString()); // "function myFunc(a, b) { return a * b; }"
```

> * 定義一個 function 為某 object 的 property，稱為一個 **method** to the object.
>
>
> * 定義一個 function 用來 new 新 objects，稱為 object **constructor**.



## Function Constructors

* (產生類似物件效果的用法)

* 如果用 `new` 去呼叫一個 function，稱為一個 **constructor invocation**
  * 語法看起來像是 new 一個 function，但因為在 JS 裡 function 是物件，所以實際上等於產生一個物件
  * 這個 function 的定義就如同 constructor
  * 新物件會繼承該 function 內的 properties 和 methods 

> The `this` keyword in the constructor does not have a value.    
> The value of `this` will be the new object created when the function is invoked.



```js
// This is a function constructor:
function Person(arg1, arg2) {
    this.firstName = arg1;
    this.lastName  = arg2;
    this.sayHi = function(){
    	return "Hi, I'm " + this.firstName + " " + this.lastName;
    }
}

// This creates a new object
var x = new Person("John", "Doe");
console.log(x);
console.log(x.firstName);
console.log(x.sayHi());

//====== result:
//Person {firstName: "John", lastName: "Doe", sayHi: ƒ}
//John
//Hi, I'm John Doe
```



----

## Functions are Object Methods

- 所有的 JavaScript functions 都是 object 的 method

````js
var myObject = {
    firstName:"John",
    lastName: "Doe",
    fullName: function () {
        return this.firstName + " " + this.lastName;
    }
}
myObject.fullName();         // Will return "John Doe"
````



- 如果某 function 不是特定 object 的 method，就是 global object 的 method

```js
function myFunction(a, b) {
    return a * b;
}
//myFunction() and window.myFunction() is the same function
myFunction(10, 2);
window.myFunction(10, 2);
```

> Using the window object as a variable can easily crash your program.



----

## Nested Functions (巢狀 Function)

inner function

```js
function add() {
    var counter = 0;
    function plus() {counter += 1;}
    plus();
    return counter;
}

console.log(add);
console.log(add());
console.log(add());
console.log(add());

// *****result*****
// ƒ add() {
//    var counter = 0;
//    function plus() {counter += 1;}
//    plus();
//    return counter;
// }
// 1
// 1
// 1
```



----

## Callback

A callback function is a function passed as a parameter to another function.



----

## References

* [Javascript 開發學習心得 - 函數的多種寫法與應用限制](http://sweeteason.pixnet.net/blog/post/40371736)



