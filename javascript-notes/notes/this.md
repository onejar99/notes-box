# JS This

[TOC]

----


## The `this` Keyword

- JS 裡的 `this` 代表：**在執行當下**誰擁有這段 code (the object that **"owns"** the current code)
- 直白來說，JavaScript 裡的 this 和 Java 不一樣，看的是**誰調用該函式**，而不是看該函式被定義在哪個物件內
- `this` 不是變數，是一個 keyword，所以不能改變 `this` 的值


----

## Tips for `this`

公式：
1. `object.method();`=> 函式內的 `this` 指向該物件
2. `method();`  => 函式內的 `this` 指向全域物件
3. `objA.method.call(objB, arg1, arg2, ...);` => 函式內的 `this` 指向物件B (若物件B為 null，則指向全域物件)



Notes:

* 過程可能很混淆，但大原則就是看**呼叫時**的**物件**是誰
* 如果呼叫函數的前方沒有物件，則函數內 `this` 就指向全域物件
  * 瀏覽器內：全域物件為 window 物件(HTML page 本身)
  * Node.js：全域物件為 GLOBAL 物件
  * 例外：在使用 node.js 時，若使用 node file.js 這樣的方式執行 js 檔，並不會讓宣告的全域變數掛在全域物件上(意指會利用 function 將 code 整個包起來執行)，故 Example 1-B 的輸出應為 undefined
* 利用 `call()` 與 `apply()` 可以指派 this 指向的物件


------

## Examples

### Example 1: Basic

* 1-A: object.method()


````js
var obj = {
	x: 20,
	f: function(){ console.log(this.x); }
};
obj.f();

obj.innerobj = {
	x: 30,
	f: function(){ console.log(this.x); }
}
obj.innerobj.f();

// ==== result:
// 20
// 30
````



* 1-B: method()

````js
var x = 10;
var f = function(){
	console.log(this.x);
};

f();

// ==== result:
// 10
````

----

### Example 2: Inner Function


````js
var x = 10;
var obj = {
	x: 20,
	f: function(){
		console.log('Output 1: ', this.x);
		var foo = function(){ console.log('Output 2: ', this.x); }
		foo(); // "this" be treated as the Global object
	}
};

obj.f();

// ==== result:
// Output 1:  20
// Output 2:  10
````



讓 foo() 可以取到 obj.x 的方法

````js
var x = 10;
var obj = {
	x: 20,
	f: function(){
		console.log('Output 1: ', this.x);
        var me = this; // use a variable to store the "this" object
		var foo = function(){ console.log('Output 2: ', me.x); }
		foo(); // "this" be treated as the Global object
	}
};

obj.f();

// ==== result:
// Output 1:  20
// Output 2:  20
````



----

### Example 3: 借用函數

原則上都一樣看呼叫者是誰為準

````js
var x = 10;
var obj = {
	x: 20,
	f: function(){ console.log(this.x); }
};
obj.f(); //Output#1

var fFunc = obj.f;
fFunc(); //Output#2

var obj2 = {
	x: 30,
	f: obj.f
}
obj2.f(); //Output#3

// ==== result:
// 20
// 10
// 30
````



----

### Example 4: call()、apply() 指派 this 代表的物件

````js
var obj1 = {
	x: 20,
	f: function(){ console.log(this.x); }
};
var obj2 = {
	x: 30
};

obj1.f.call(obj2);

// ==== result:
// 30
````



----

### Example 5: 指向 new 所產生的新物件

````js
var exp = 999;
function Hero(n){
    this.exp = n;
};
Hero(50);
var hero = new Hero(100);
console.log(exp); //output#1
console.log(hero); //output#2

// ==== result:
// 50
// Hero {exp: 100}
````



----

### Example 6: Callback

如果想把物件本身帶入 callback function 裡的 this，要用 `call()`

````js
var x = "Global Hi";

function sayHi(){
	return this.x;
}

var hero = {
	x: "Hero Hi",
	act1: function(cbk){
		return cbk();
	},
	act2: function(cbk){
		return cbk.call(this);
	}
};

console.log( sayHi() );           // Global Hi
console.log( hero.act1(sayHi) );  // Global Hi
console.log( hero.act2(sayHi) );  // Hero Hi
````



----

## References

- [#Javascript：this用法整理 | 英特尔® 软件](https://software.intel.com/zh-cn/blogs/2013/10/09/javascript-this)
- [JavaScript 語言核心（11）this 是什麼？ by caterpillar | CodeData](http://www.codedata.com.tw/javascript/essential-javascript-11-what-is-this/)

