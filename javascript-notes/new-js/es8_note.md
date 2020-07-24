# ES8

## Notes

> Async 與 Await 為 ES8 特性，常被誤以為是 ES7

### 1. Async & Await


### 2. padEnd & padStart

#### padEnd

將字串補足位數(補在最後)，可指定要用什麼字元補，若無指定則用空白。

````js
var str = 'abc';
console.log(`[${str.padEnd(10)}]`);         // "[abc       ]"
console.log(`[${str.padEnd(10, "1234")}]`);  // "[abc1234123]"
console.log(`[${str.padEnd(6,"123456")}]`); // "[abc123]"
````

#### padStart

將字串補足位數(補在開頭)，可指定要用什麼字元補，若無指定則用空白。

````js
var str = 'abc';
console.log(`[${str.padStart(10)}]`);         // "[       abc]"
console.log(`[${str.padStart(10, "1234")}]`);  // "[1234123abc]"
console.log(`[${str.padStart(6,"123456")}]`); // "[123abc]"
````


### 3. #Object.values

取得 Object 中所有的**值**，回傳一個 Array。

````js
var obj = { name: "John", age: 18 };
console.log(Object.values(obj)); // ["John", 18]
````

//#Object.entries

把 Object 中的每組 key 和 value 分別組成一個 Array 的形式，再全部以一個 Array 回傳。

````js
var obj = { name: "John", age: 18 };
console.log(Object.entries(obj)); // [ ["name", "John"], ["age", 18] ]
````





## Reference

* [ES6,ES7,ES8 · class - easonwang01 - GitBook](https://easonwang01.gitbooks.io/class/es6es7.html)