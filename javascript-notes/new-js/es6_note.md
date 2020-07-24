# ES6

## Online Test Tools

* [ES6 Console - try JavaScript compilers](https://es6console.com/)
* [REPL - Babel · The compiler for next generation JavaScript](https://babeljs.io/repl/)


## Notes

### 1. Function parameters' default values

避免沒有傳參數給 function 導致 expection 的方法是設定參數預設值。

ES5:

````js
// primitive paramters
function myFunc1(n) {
  n = n === undefined ? 123 : n;

  console.log(n);
}
myFunc1();

// object paramters
function myFunc2(person) {
  person = person === undefined ? {} : person;
  var name = person.name === undefined ? 'John' : person.name;
  var age = person.age === undefined ? 20 : person.age;
  var weapon = person.weapon === undefined ? {name: 'sword', attack: 99} : person.weapon;

  console.log(name, age, weapon); //Rubio 20 {name: "sword", attack: 99}
}
myFunc2({name: 'Rubio'});
````

ES6:

````js
// primitive paramters
function myFunc1(n = 123){
  console.log(n);
}
myFunc1();

// object paramters
function myFunc2({name='John', age=20, weapon={name: 'sword', attack: 99}}) {
  console.log(name, age, weapon); //Rubio 20 {name: "sword", attack: 99}
}
myFunc2({name: 'Rubio'});
````

> Note:
> ES6 的參數預設值只會判斷是不是 undefined。
> 如果是 null 或其他想檢查的情境，仍需自己判斷。

----

### 2. Template Literals

允許將字串實字模板化，嵌入 JS 變數或語法。

````js
var x = "hello";

// ES5
console.log("x=[" + x + "]");
console.log("x=[" + (123+456) + "]");

// ES6
console.log(`x=[${x}]`);
console.log(`x=[${(123+456)}]`);
````

----

### 3. Multi-line Strings

````js
//ES5
var str = 'line1'
   +'line2';

//ES6
var str = `line1
   line2`;
````

> mynote:
> 偏向還是用 ES5 的寫法，避免預期外的奇怪問題。
> 因為根據多個 online tool 測試轉譯結果，似乎換行會多出 `\n` 符號，而且會被受縮排的空白影響。

````js
// ES6
var str = `line1
   line2`;

// Convet to ES5
var str = 'line1\n   line2';
````
----

### 4. Destructuring Assignment

解構賦值，可以用用簡便的語法，取出陣列或 object 裡**對應位置**的值。

#### Array destructuring

##### 1. Basic assignment and assigning the rest

````js
var [a, b] = [10, 20];
console.log(a); // 10
console.log(b); // 20

var [a, b, ...rest] = [10, 20, 30, 40, 50];
console.log(a); // 10
console.log(b); // 20
console.log(rest); // [30, 40, 50]

var ary = ['apple', 'banana', 'car', 'dog'];
[a, b, ...rest] = ary;
console.log(a); // 'apple'
console.log(b); // 'banana'
console.log(rest); // ['car', 'dog']
````

##### 2. Ignoring some values

可選擇性擷取或跳過

````js
var [a, b] = [1, 2, 3, 4];
console.log(a); // 1
console.log(b); // 2

var [a, , b] = [1, 2, 3, 4];
console.log(a); // 1
console.log(b); // 3

var [a, , , b] = [1, 2, 3, 4];
console.log(a); // 1
console.log(b); // 4

var [, , , , ,] = [1, 2, 3, 4]; // ignore all
````

##### 3. Default values

當對應的元素是 undefined 時會使用預設值

````js
var [a=5, b=7] = [1];
console.log(a); // 1
console.log(b); // 7
````

##### 4. Swapping variables

不用再設額外變數去暫存

````js
var a = 1;
var b = 3;

[a, b] = [b, a];
console.log(a); // 3
console.log(b); // 1
````

##### 5. Parsing an array returned from a function

````js
function f() {
  return [1, 2];
}

var [a, b] = f();
console.log(a); // 1
console.log(b); // 2
````

````js
var url = 'https://developer.mozilla.org/en-US/Web/JavaScript';

var parsedURL = /^(\w+)\:\/\/([^\/]+)\/(.*)$/.exec(url);
console.log(parsedURL); // ["https://developer.mozilla.org/en-US/Web/JavaScript", "https", "developer.mozilla.org", "en-US/Web/JavaScript"]

var [, protocol, fullhost, fullpath] = parsedURL;

console.log(protocol); // "https"
````


#### Object destructuring

##### 1. Basic assignment and Assigning to new variable names

冒號前面是原 key 值，後面是新宣告的變數名

````js
var { name: n, age: a } = { name: 'John', age: 20 };
console.log(n); // 'John'
console.log(a); // 20

var { name: name, age: age } = { name: 'John', age: 20 };
console.log(name); // 'John'
console.log(age); // 20

var { name, age } = { name: 'John', age: 20 };
console.log(name); // 'John'
console.log(age); // 20

({ name, age } = { name: 'Rubio', age: 18 }); // Note: For this syntax `(` and `)` is necessary, or SyntaxError
console.log(name); // 'Rubio'
console.log(age); // 18

let {a, b, ...rest} = {a: 10, b: 20, c: 30, d: 40}
console.log(a); // 10
console.log(b); // 20
console.log(rest); // { c: 30, d: 40 }
````

##### 2. Default values

當對應的元素是 undefined 時會使用預設值

````js
var { name='John', age=20 } = { name: 'Rubio' };
console.log(name); // 'Rubio'
console.log(age); // 20

var { name: n = 'John', age: a = 20 } = { name: 'Rubio' };
console.log(n); // 'Rubio'
console.log(a); // 20
````

##### 3. Nested object and array destructuring

巢狀物件或陣列的解構

````js
var person = {
	name: 'John',
    weapon: {
    	name: 'Sword',
    	attack: 99
    },
    items:[
    	{ name: 'Herb', price: 5},
        { name: 'Ruby', price: 20000},
    ]
};
var {name: hero, weapon: { attack: atk }, items: [, {name: present}]  } = person;
console.log(hero); // 'John'
console.log(atk); // 99
console.log(present); // 'Ruby'
````

##### 4. For of iteration and destructuring

循環解構

````js
var heroes = [
{
	name: 'John',
    weapon: {
    	name: 'Sword',
    	attack: 99
    },
},
{
	name: 'Arthur',
    weapon: {
    	name: 'Bow',
    	attack: 70
    },
}
];

for (var {name: n, weapon: {attack: atk}} of heroes) {
  console.log('Name: ' + n + ', Attack: ' + atk);
}

// =========== Result:
// Name: John, Attack: 99
// Name: Arthur, Attack: 70
````

##### 5. 應用: 從函式參數的物件中快速提出某屬性的值

````js
function atkValue({weapon: {attack: atk}}) {
  return atk;
}

var person = {
	name: 'John',
    weapon: {
    	name: 'Sword',
    	attack: 99
    },
};

console.log('Attack Value:: ' + atkValue(person)); // "Attack Value:: 99"
````

##### 6. Computed object property names and destructuring

以物件演算屬性名稱解構
(**物件演算屬性名稱**指——母物件["子物件名稱"]——的表示方式)

````js
let key = 'name';
var {[key]: n} = { name: 'John' };
console.log(n); // 'John'
````

##### 7. Invalid JavaScript identifier as a property name

利用解構的寫法取得不合格的 JS 識別名稱

````js
const foo = { 'fizz-buzz': true };
const { 'fizz-buzz': fizzBuzz } = foo;
console.log(fizzBuzz); // "true"
````


### 5. Object Literals

提供 Object 定義的縮寫語法

````js
function getHero(name, weapon, career) {
  return {
    // property value shorthand syntax
    name, // same as name: name
  	weapon,

    // computed values now work with object literals
    ['be' + career]: true,

    // Method definition shorthand syntax omits `function` keyword & colon
	// Note: 這樣寫的效果會是 regular function，而非 arrow function
    doAttack() {
      console.log(`Use ${weapon.name}! HP -${weapon.attack}`);
    }
 };
}
let hero = getHero('John', {name: 'Sword', attack: 99}, "Warrior");
console.log(hero);
hero.doAttack(); // "Use Sword! HP -99"
````

### 6. Arrow Functions

#### Intro:

* Arrow function expression，或稱 fat arrow function，最初在 coffeescript 的語法中流行。
* Arrow function 不是單純語法簡化而已，也會對 function 實際運作多了些限制或改變。

Usage Note:
1. Arrow functions must be defined before they are used.
2. Using `const` is safer than using `var`, because a function expression is a constant value.
3. 原則上似乎可以避免使用 `function` 關鍵字去宣告，如果在物件裡需要用到 Regular function 的效果，可用  Object literals 寫法 (但還是要視乎使用情境)

#### Syxtax Examples:

````js
// basic arrow function expression
var myFunc = (n1 ,n2) => {
  return n1 + n2;
};

// if only a return statement, omit return and {}
var myFunc = (n1, n2) => n1 + n2;

// if only one parameter, () can be omitted
var myFunc = x => { console.log(x) };

// if no parameter, () is necessary
var myFunc = () => { console.log(123) };
````


#### About `arguments`

`arguments` object - no longer bound with arrow function
不能使用 arguments，讓 function 使用上更嚴謹。


````js
const getSum = function (n1, n2, n3) {
	console.log(arguments); // [100, 200, 300]
	return n1 + n2 + n3;
};
console.log( getSum(100, 200, 300) ); //600

const getSumArrow = (n1, n2, n3) => {
	//console.log(arguments); // it will occur ReferenceError: arguments is not defined
	return n1 + n2 + n3;
};
console.log( getSumArrow(100, 200, 300) ); //600
````


#### About `this`

`this` keyword - no longer bound
對 `this` 的效果會有影響，根據 `obj.method()` 判斷當前 `this` 是誰的公式在 arrow function 不適用。
如果用的是 arrow function，不會再產生一個 `this` 引用物件，當前 `this` 會是上一個 `this` 物件。


Example 1: With Regular function

````js
const hero = {
	name: 'Soar',
    weapons: ['Sword', 'Bow', 'Axe'],
    printArmedWeapon: function(){
    	const me = this;
    	this.weapons.forEach(function(el){
        	console.log(`Hero ${me.name} got weapon ${el}`); // here, `this` means `hero.weapons`, instead of `hero`
        });
    }
};
hero.printArmedWeapon();

// Result:
// Hero Soar got weapon Sword
// Hero Soar got weapon Bow
// Hero Soar got weapon Axe
````

Example 2: With Arrow function

````js
const hero = {
	name: 'Soar',
    weapons: ['Sword', 'Bow', 'Axe'],
    printArmedWeapon: function(){   // arrow function
    	this.weapons.forEach((el) => {
        	console.log(`Hero ${this.name} got weapon ${el}`); // `this` not bound the `forEach()`
        });
    }
};
hero.printArmedWeapon();

// Result:
// Hero Soar got weapon Sword
// Hero Soar got weapon Bow
// Hero Soar got weapon Axe
````


Example 3: With Arrow function further

````js
const hero = {
	name: 'Soar',
    weapons: ['Sword', 'Bow', 'Axe'],
    printArmedWeapon: () => {  // arrow function
    	this.weapons.forEach((el) => {
        	console.log(`Hero ${this.name} got weapon ${el}`);
        });
    }
};
hero.printArmedWeapon();

// TypeError: Cannot read property 'forEach' of undefined
````


Example 4: With Object literals

是 regaular function 的效果

````js
const hero = {
	name: 'Soar',
    weapons: ['Sword', 'Bow', 'Axe'],
    printArmedWeapon() { // Object literals
    	this.weapons.forEach((el) => {
        	console.log(`Hero ${this.name} got weapon ${el}`);
        });
    }
};
hero.printArmedWeapon();

// Result:
// Hero Soar got weapon Sword
// Hero Soar got weapon Bow
// Hero Soar got weapon Axe
````


Example 5: Another Example


````js
const multyplier = {
	numbers: [2, 3, 4],
    //multiplyBy(){ return 2},
    multiplyBy: () => 2,
    multiply(){
    	return this.numbers.map(x => x * this.multiplyBy());
    }
}
console.log( multyplier.multiply() ); //[4,6,8]
````



### 7. Promises

#### Promise.all

把許多promise的函式組成一個Array放入Promise.all內，當裡面每個都resolve或其中一個被reject時才會執行後面的then方法

````js
Promise.all([promises...])
.then(function (posts) {
  // ...
}).catch(function(reason){
  // ...
});
````

### 8. Let & Const, Block-Scoped

#### Intro

* `let` 只會在目前的 { } 內有效，而且**同一個** block 內不能重覆定義(即使另一個是用`var`)，會 throw Error 提示
	* 但一個 block 內的小 block 允許再定義同名的變數
	
* `const` 同 `let` 一樣 (只會在目前的 { } 內有效 + 不能重複定義)，另外多了:
	1. 定義時必須 initialize
	2. 後續不能更改 
	
	
* 應避免使用 `var`，改用 `const` 和 `let`
	
	
#### let

````js
{
   var x = 10;
   var x = 2;
}
console.log(x); // 2
````

````js
var x = 10;
{
   let x = 2;
}
console.log(x); // 10
````

````js
let x = 10;
{
   let x = 2;
}
console.log(x); // 10
````

````js
{
   let x = 10;
}
console.log(x); // ReferenceError: x is not defined
````

````js
{
   var x = 10;
   let x = 2; // SyntaxError: Identifier 'x' has already been declared
}
console.log(x);
````



#### const

````js
const x; // SyntaxError: Missing initializer in const declaration
````

````js
const x = 10;
const x = 10; // SyntaxError: Identifier 'x' has already been declared
````

````js
const x = 10;
x = 20; // TypeError: Assignment to constant variable.
````

````js
{
	const x = 10;
}
console.log(x); // ReferenceError: x is not defined
````


#### Block Level Scope

* Function scope 也是一種比較大的 Block scope
* 一份檔案算一種更大的 Block scope，但不等於 Global scope (In HTML, the global scope is the window object)
* `var` vs `let` vs `const`
	1. `var` 可以當 function scope/global scope 
	2. `let` & `const` 可以是 block scope/function scope，無法用作 global scope  (無法在 function 內用 `this` 或 `window` 呼叫)
 
````js
let n4 = "Soar";
myFunc3();

function myFunc3(){
    console.log("myFunc3(): typeof n4=", typeof n4, " value=", n4);
    console.log("myFunc3(): typeof this.n4=", typeof this.n4, " value=", this.n4);
    console.log("myFunc3(): typeof window.n4=", typeof window.n4, " value=", window.n4);
}

// Result:
// myFunc3(): typeof n4= string  value= Soar
// myFunc3(): typeof this.n4= undefined  value= undefined
// myFunc3(): typeof window.n4= undefined  value= undefined
````



### 9. Classes

#### Intro

運用 prototype 和 function 實用出類似具有 inheritance 結構的的類別(和傳統 java, python 的類別有差別)


#### Simple Example:

````js
class Drink {
    constructor(name = 'water', price = 1) {
        this.name = name;
        this.price = price;
    }
    generateTag() {
        console.log(this.toString());
    }
    toString(){
    	return `${this.name}, Price is ${this.price}`;
    }
}
class RedTea extends Drink {
	constructor(){
    	super('RedTea', 35);
    }
    generateTag() {
        super.generateTag();
        console.log('Thank you!');
    }
}

let drink1 = new RedTea();
drink1.generateTag();
console.log(drink1); // will print with object format, instead of calling toString()
console.log(drink1.toString());
console.log('' + drink1); // // will call toString()

let drink2 = new Drink();
drink2.generateTag();
console.log(drink2);


// "RedTea, Price is 35"
// "Thank you!"
// RedTea {name: "RedTea", price: 35}
// "RedTea, Price is 35"
// "RedTea, Price is 35"

// "water, Price is 1"
// Drink {name: "water", price: 1}
````

### 10. Module

* 模組化是 Node.js 中最重要的觀念之一，這個觀念讓大規模的 JavaScript 系統成為可能，模組化程設在 JS 流行也是基於此。

* Node.js 使用的 `require()` 是屬於 CommonJS 體系，但在 ES6 不用 `require` ，而使用 `import` (兩者亦可混合使用)。

* 在 ES6 出來前，Node.js 或瀏覽器端有各家套件，遵循各自的 module 實作規範
  * Node 遵循 CommonJS (`require` 只是 Node.js 的一個 private global function；`module.exports` 也只是 Node.js 的一個 private global variable)
  * requirejs 遵循 AMD
  * seajs 遵循 CMD

* Node.js 現階段不支援 `import` & `export`，需要通過 babel 進行轉譯成 Node.js 的模組化語法。
  * Test with Node.js v10.6.0 -> SyntaxError: Unexpected token export

#### Export

> `export` 要放在 function 外不然會出錯

Syntax 1: 基本寫法

````js
export var port = 3000
export var person = 'John';
export function add(n1, n2) {
	return n1+n2;
}
````

Syntax 2: 可最後一次 export (建議)

````js
var port = 3000
var person = 'John';

export {port, person};
````

Syntax 3: 可用 `as 改變 import 時的名稱

````js
export {port as p, person as heor};
````



#### Import

也可一次載入

````js
import {port, person} from './config.js'
console.log(port) // 3000
````

Syntax 2: 可一次 import

````js
import * as config from './config.js'
````

Syntax 3: 可用 `as` 改變 import 後的名稱

````js
import {port as p, person as hero} from './config.js'
````


#### Export Default

前面的 export 寫法在 import 時，需要知道該變數名稱才可引用。

為了解決此問題，可使用 export default

a.js

````js
export default function () {
  console.log('I'm banana');
}
````

b.js
````js
import customName from './a.js';//可自行指定名稱
customName(); // 'I'm banana'
````

在 React 通常會如下運用：

````js
// Component1.js
export default class { ... }

// main.js
import Component1 from './Component1.js'
````



### 11. spread syntax (展開運算子)

````js
var numbers = [1, 2, 3, 4];
Math.max(...numbers) // 4
Math.min(...numbers) // 1

function myFunc(x, y, z) { console.log(y) }
var args = [0, 1, 2];
myFunc(...args); // same as myFunc(0,1,2)

var ary = ["hello", 123, ...args, "go"];
console.log(ary); // ["hello", 123, 0, 1, 2, "go"]
````


### 12. Generator
功能:也是用來處理異步函式，讓他順序執行 不一樣的地方在於function後的星號，和yield

````js
function* Fruit() {
  yield 'apple';
  yield 'banana';
  return 'ending';
}

var a = Fruit();
````

之後輸入a.next();



## Reference

* [[ES6] Javascript 開發者必須知道的 10 個新功能](https://medium.com/@peterchang_82818/es6-10-features-javascript-developer-must-know-98b9782bef44)
	* 翻譯有誤?? 它沒有自己的 this
	* Arrow functions do not have their own this. (https://www.w3schools.com/js/js_es6.asp)
* [解構賦值- JavaScript | MDN](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
* [ECMAScript 6 - JavaScript 6 - W3Schools](https://www.w3schools.com/js/js_es6.asp)
* [ES6,ES7,ES8 · class - easonwang01 - GitBook](https://easonwang01.gitbooks.io/class/es6es7.html)
* [Node中没搞明白require和import，你会被坑的很惨](http://imweb.io/topic/582293894067ce9726778be9)
