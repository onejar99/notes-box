## Function.prototype API



### Function.prototype.apply() & call()

Reference:

- [從陣列計算最大和最小值](http://www.jstips.co/zh_tw/javascript/calculate-the-max-min-value-from-an-array/)
- [Function.prototype.apply() - JavaScript | MDN](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)



#### 主動呼叫函數的三種語法：

* obj.myFunc();
* myFunc.call(obj, [arg]);
* myFunc.apply(obj, [arg1,arg2..]);





#### apply() & call() 的用途

* 呼叫函數，並允許指派特定的物件作為 this 對象 (第一個參數)
* 如果第一個參數是 null，表示 this 是全域物件
  * In "non-strict" mode, 如果第一個參數是 null 或 undefined，會用 global object 當作 `this`
  * In JS strict mode, 第一個參數放什麼，`this` 就是什麼 (如果放 null 又有用到 `this` 就有可能出錯)
* apply() 語法和 call() 幾乎一樣，最大的不同是 call() 接受一連串的參數，而 apply() 接受一組陣列形式的參數





#### Example 1


````js
var person = {
    firstName:"John",
    lastName: "Doe",
    fullName: function() {
        return this.firstName + " " + this.lastName;
    }
}
var myObject = {
    firstName:"Mary",
    lastName: "Doe",
}
var x = person.fullName.call(myObject);
var x = person.fullName.apply(myObject);
console.log(x); // "Mary Doe"
````





#### Example 2: 取陣列最大值最小值

```js
var points = [40, 100, 1, 5, 25, 10];
console.log( Math.max.apply(null, points) ); //100
console.log( Math.min.apply(null, points) ); //1

console.log( Math.max.call(null, 40, 100, 1, 5, 25, 10) ); //100
console.log( Math.min.call(null, 40, 100, 1, 5, 25, 10) ); //1
```






