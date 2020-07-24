# Closures (閉包)

[TOC]



----

## Intro

* JS 變數可以屬於 local 或 global scope

* Global variables 也可以利用閉包效果做成 local (private) 形式

* 閉包是一個 function，其能夠存取 parent scope 的變數，即使 parent function 已經結束

  * (A closure is a function having access to the parent scope, even after the parent function has closed.)


> 沒有用 `var` 關鍵字所創造出來的變數，都會被當作 global 變數，即使是在 function 創造的。



**Key points from references:**

* closure 是讓函數能「記得」被建立時的環境的一種機制
* 每一個 closure 中保存的都是一個獨立的環境
* Closures 實際上儲存的是對那些外層變數的參考(references)




**mynote:**

1. 閉包是一個 function，能夠存取 parent scope 的變數，即使該 parent function 已經結束
2. 定義時，會定義一個將立刻執行的 function，該 funtion 即為 parent function
3. 在該 parent function 內，會定義一個 inner function，該 inner function 會存取 parent function 內的變數
4. 外界會立刻執行 parent function，parent function 會回傳該 inner function
5. 外界會用一個變數去承接所回傳的 inner function，該變數所存的就是一個閉包
6. 因為閉包 function 儲存的是 parent function 變數的 reference，所以外界就能透過該閉包 function 繼續去操作原本 parent function 內的變數，但又無法直接接觸 parent function 內的變數
7. 實現類似 OO 封裝的 private 效果




----

## Before Using Closure: 想解決的 Scenarios

````js
// Scenario 1: Global var 大家都能存取，無法限制必須透過 setAge()
var age = 18;
function setAge(a){
  age = a;
}

// Scenario 2: 必須透過 setAge() 存取 -> 但 age 無法持續保留
function setAge(a){
  var age = 18;
  age = a;
}
````



----

## Example 1: Basic Closure

**Example Explained:**

1. 變數 `add` 被賦值的值是一個 *self-invoking function* 的回傳值
2. 那個 *self-invoking function* 只執行一次，將 `counter` 設為 0，並回傳一個 `function expression`
3. 因此 `add` 變成一個 function，而且可以存取 *父 scope(the parent scope)* 裡的 `counter` 變數
4. 變數 `counter` 被一個**匿名函數的 scope** 所保護，只能透過 `add` function 來存取改變，達到 private 效果
5. 這就稱為 JavaScript **closure**



````js
var add = (function () {
    var counter = 0;
    return function () {return counter += 1;}
})();

console.log(add);
console.log(add());
console.log(add());
console.log(add());

// *****result*****
// ƒ () {return counter += 1;}
// 1
// 2
// 3
````



----

## Example 2: Basic Closure II

**Example Explained:**

1. parent function 是 `foo()`，被呼叫執行後，用 `myFunc` 去承接回傳的 inner function，就成了閉包


````js
function foo(){
  var temp = 'azole';
  function bar(){
    console.log(temp);
  }
  return bar;
}
var myFunc = foo();
myFunc(); // azole
````



----

## Example 3: 利用閉包模擬 OO 效果



````js
function newPersonObj(){
	var name = "John";
	var methods = {
	  getName: function() { return name; },
	  setName: function(n) { name = n; },
	  toString: function() { return "name is " + name; }
	}
	return methods;
}

var p1 = newPersonObj();
console.log(p1.getName());            // "John"
console.log(p1.setName('Andrew'));    // undefined (because of no return)
console.log(p1.getName());            // "Andrew"
console.log(p1.toString());           // "name is Andrew"
console.log(p1);                      // "{getName: ƒ, setName: ƒ, toString: ƒ}"

var p2 = newPersonObj();
console.log(p1.getName());            // "Andrew"
console.log(p2.getName());            // "John"
````





----

## References

* [JavaScript Function Closure (閉包)](https://www.fooish.com/javascript/function-closure.html)
* [Javascript中的傳遞參考與closure (2)](https://ithelp.ithome.com.tw/articles/10130860)

