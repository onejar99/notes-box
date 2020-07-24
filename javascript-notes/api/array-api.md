## Array API

### Array Properties

#### length

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.length); //4
````



----

### Is Array

> There are 3 solutions:

#### Built-in isArray()

> NOTE: Supported with ECMAScript 5 or newer

````js
var x = 1;
var ary = ['Apple', 'Banana', 'Cake'];
console.log( Array.isArray(x) );  // false
console.log( Array.isArray(ary) );  // true
````




#### Self-Defined isArray() via constructor

````js
var x = 1;
console.log( x.constructor ); // ƒ Number() { [native code] }
console.log( isArray(x) );    // false

var ary = ['Apple', 'Banana', 'Cake'];
console.log( ary.constructor ); // ƒ Array() { [native code] }
console.log( isArray(ary) );  // true

function isArray(x) {
    return x.constructor.toString().indexOf("Array") > -1;
}
````

Anthor simpler solution:

````js
function isArray(myArray) {
    return myArray.constructor === Array;
}
````



#### instanceof Array

````js
var ary = ['Apple', 'Banana', 'Cake'];
console.log( ary instanceof Array );  // true
````



----

### To String

#### toString()

````js
var ary = ['Apple', 'Banana', 'Cake'];
console.log( ary );         // ["Apple", "Banana", "Cake"]
console.log( ary.toString() );    // "Apple,Banana,Cake"
````



#### join()

`join(sign)`

> 類似 toString() ，可指定串聯符號

````js
var ary = ['Apple', 'Banana', 'Cake'];
console.log( ary.join('-*-') );   // "Apple-*-Banana-*-Cake"
````



----

### Add Elements

#### push()

`push(item)`

> Add an element into an array **at the end**, and return the new array length.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);	//["Banana", "Orange", "Apple", "Mango"]
var x = fruits.push("Lemon");
console.log(fruits);	//["Banana", "Orange", "Apple", "Mango", "Lemon"]
console.log(x);			//5
````



#### unshift()

`unshift(item)`

> Add an element into an array **at the beginning**, and return the new array length.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);	//["Banana", "Orange", "Apple", "Mango"]
var x = fruits.unshift("Lemon");
console.log(fruits);	//["Lemon", "Banana", "Orange", "Apple", "Mango"]
console.log(x);			//5
````



#### directly assign/append via index

> WARNING: 如果指定的 index 有跳號，會造成中間出現 undefined
> (Adding elements with high indexes can create undefined "holes" in an array)

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);		//["Banana", "Orange", "Apple", "Mango"]
console.log(fruits.length); //4

fruits[4] ="Lemon";
console.log(fruits);		//["Banana", "Orange", "Apple", "Mango", "Lemon"]
console.log(fruits.length);	//5

fruits[10] ="Lemon";
console.log(fruits);		//["Banana", "Orange", "Apple", "Mango", empty × 5, "Lemon"]
console.log(fruits.length);	//11
console.log(fruits[8]);		//undefined
````

----

### Remove Elements

#### pop()

> Remove **the last** element, and return the removed element.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);	// ["Banana", "Orange", "Apple", "Mango"]
var item = fruits.pop();
console.log(fruits);	// ["Banana", "Orange", "Apple"]
console.log(item);		// "Mango"
````



#### shift()

> Remove **the first** element, and return the removed element.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);	// ["Banana", "Orange", "Apple", "Mango"]
var item = fruits.shift();
console.log(fruits);	// ["Orange", "Apple", "Mango"]
console.log(item);		// "Banana"
````



#### using delete

> Using delete may leave undefined holes in the array.
> Use pop() or shift() instead.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);	// ["Banana", "Orange", "Apple", "Mango"]
delete fruits[2];
console.log(fruits);	// ["Banana", "Orange", empty, "Mango"]
console.log(fruits[2]);	// undefined
````

----

### Splice (Add & Remove Elements Once)

#### splice()

`splice(insertPosition, removedCount, [addedItem1, addedItem2, ...])`

````js
// demo 1: add
var fruits = ["Item0", "Item1", "Item2", "Item3"];
var x = fruits.splice(2, 0, "New1", "New2");
console.log(fruits);  // ["Item0", "Item1", "New1", "New2", "Item2", "Item3"]
console.log(x);     // []

// demo 2: remove
var fruits = ["Item0", "Item1", "Item2", "Item3"];
var x = fruits.splice(1, 5);
console.log(fruits);  // ["Item0"]
console.log(x);     // ["Item1", "Item2", "Item3"]

// demo 3: add + remove
var fruits = ["Item0", "Item1", "Item2", "Item3"];
var x = fruits.splice(1, 2, "New1");
console.log(fruits);  // ["Item0", "New1", "Item3"]
console.log(x);     // ["Item1", "Item2"]

// demo 4: negative-position example
var fruits = ["Item0", "Item1", "Item2", "Item3"];
var x = fruits.splice(-1, 5);
console.log(fruits);  // ["Item0", "Item1", "Item2"]
console.log(x);     // ["Item3"]
````

----

### Merge Arrays

#### concat()

> `concat()` **does not change the existing arrays**. It always **returns a new array**.

````js
var ary1 = ["Cecilie", "Lone"];
var ary2 = ["Emil", "Tobias", "Linus"];
var ary3 = ["Robin", "Morgan"];
var aryFinal = ary1.concat(ary2, ary3);
console.log(aryFinal);  //["Cecilie", "Lone", "Emil", "Tobias", "Linus", "Robin", "Morgan"]
console.log(ary1);    //["Cecilie", "Lone"]
console.log(ary2);    //["Emil", "Tobias", "Linus"]
console.log(ary3);    //["Robin", "Morgan"]
````

----

### Fetch Sub-Array

#### slice()

`slice(startIndex, [endIndexExcluded])`

> * `slice()` creates a **new array**. It does not remove any elements from the source array.
> * The element of `endIndex` **not included**.

````js
var fruits = ["Item0", "Item1", "Item2", "Item3", "Item4"];
console.log( fruits.slice(2) );   //["Item2", "Item3", "Item4"]
console.log( fruits.slice(1, 3) );  //["Item1", "Item2"]
console.log( fruits );        //["Item0", "Item1", "Item2", "Item3", "Item4"]
````



----

### Find Max and Min
> *  There are **no built-in functions** for finding the highest or lowest value in a JavaScript array.
> *  但可以用其他技巧做到



#### 1. using sort()
> * Cons: inefficient
>   * Sorting a whole array is a very inefficient method if you only want to find the highest (or lowest) value.

````js
var points = [40, 100, 1, 5, 25, 10];
points.sort(function(a, b){return a - b});
console.log(points[0]); // 1 (the lowest value)
console.log(points[points.length-1]); //100 (the highest value)
````



#### 2. using Math.max().apply()

````js
var points = [40, 100, 1, 5, 25, 10];
console.log( Math.max.apply(null, points) ); //100
console.log( Math.min.apply(null, points) ); //1
````



#### 3. using Array.prototype.reduce()

````js
var maxCbk = ( max, cur ) => Math.max( max, cur );
var minCbk = ( max, cur ) => Math.min( max, cur );

var points = [40, 100, 1, 5, 25, 10];
console.log( points.reduce(maxCbk) ); //100
console.log( points.reduce(minCbk) ); //1
````



#### 4. using "home made" method

> The fastest solution?

````js
function myArrayMax(arr) {
    var len = arr.length
    var max = -Infinity;
    while (len--) {
        if (arr[len] > max) {
            max = arr[len];
        }
    }
    return max;
}

function myArrayMin(arr) {
    var len = arr.length
    var min = Infinity;
    while (len--) {
        if (arr[len] < min) {
            min = arr[len];
        }
    }
    return min;
}
````



----

### Search

#### indexOf()

````js
var fruits = ["Banana", "Orange", "Apple", "Mango", "Apple"];
console.log( fruits.indexOf("Apple") ); //2
console.log( fruits.indexOf("Car") ); //-1
````

#### lastIndexOf()

````js
var fruits = ["Banana", "Orange", "Apple", "Mango", "Apple"];
console.log( fruits.lastIndexOf("Apple") ); //4
console.log( fruits.lastIndexOf("Car") ); //-1
````

#### includes()

````js
var a = [1, 2, 3];
console.log(a.includes(2)); // true
console.log(a.includes(4)) // false
````


----

### Sort

#### reverse()

> * 純反轉，不針對內容排序

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.reverse();
console.log( fruits );  // ["Mango", "Apple", "Orange", "Banana"]
````



#### sort() for strings (ascent)

> * 針對內容排序
> * numerically vs. alphabetically sorting: sort() sorts values as **strings**. (alphabetically)
> * sort() will **change the array**, and **return sorted result** too.

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var x = fruits.sort();
console.log( fruits );  // ["Apple", "Banana", "Mango", "Orange"]
console.log( x );       // ["Apple", "Banana", "Mango", "Orange"]
````





#### sorting strings (descend)

> `sort()` + `reverse()`

````js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.sort();
fruits.reverse();
console.log( fruits );  // ["Orange", "Mango", "Banana", "Apple"]
````





#### sorting numbers

> sort numbers using default sort() will get incorrect result

````js
var numAry = [3, 5, 11, 4, 9];
numAry.sort();
console.log(numAry); //  [11, 3, 4, 5, 9]
````

> Numeric Sort Solution: providing a **compare function**

````js
// ascend
var numAry = [3, 5, 11, 4, 9];
numAry.sort(function(a, b){return a - b});
console.log(numAry); //  [3, 4, 5, 9, 11]

//descend
var numAry = [3, 5, 11, 4, 9];
numAry.sort(function(a, b){return b - a});
console.log(numAry); //   [11, 9, 5, 4, 3]

// random
var numAry = [3, 5, 11, 4, 9];
numAry.sort(function(a, b){return 0.5 - Math.random()});
````






#### sorting Object Arrays

>  using **compare function**

````js
var cars = [
{type:"Volvo", year:2016},
{type:"Saab", year:2001},
{type:"BMW", year:2010}];

// sort by number property
cars.sort(function(a, b){return a.year - b.year});
console.log(cars);  //[0]Saab 2001, [1]BMW 2010, [2]Volvo 2016

// sort by string property
cars.sort(function(a, b){
    var x = a.type.toLowerCase();
    var y = b.type.toLowerCase();
    if (x < y) {return -1;}
    if (x > y) {return 1;}
    return 0;
});
console.log(cars);  //[0]BMW 2010, [1] Saab 2001, [2]Volvo 2016
````





#### Compare Function

> - **Purpose**: define an alternative sort order
> - **Return**: should return a **negative**, **zero**, or **positive** value, depending on the arguments

Example:

```js
// ascend
var numAry = [3, 5, 11, 4, 9];
numAry.sort(function(a, b){return a - b}); // The Compare Function
console.log(numAry); //  [3, 4, 5, 9, 11]
```

>  When comparing 40 and 100
>
>  1. the sort() method calls the compare function(40,100).
>  2. The function calculates 40-100, and returns -60 (a negative value).
>  3. The sort function will sort 40 as a value lower than 100.



----

### Each Process



#### Array.prototype.forEach()


ref: https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach

`var newArray = oldAry.forEach(callback[, thisArg])`

* callback: 有3個參數:
  * currentValue: 目前處理的元素值
  * index: 目前處理元素的陣列索引
  * array: 呼叫此方法的陣列
* thisArg (optional): 執行 callback 的 this 值


````js
var array1 = ['a', 'b', 'c'];
array1.forEach(function(el) {
  console.log(el);
});
````



#### Array.prototype.map()

ref: https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/map

> 巡訪每個元素，逐一加工後回傳


`var newArray = oldAry.map(callback[, thisArg])`

* callback: 有3個參數:
  * currentValue: 目前處理的元素值
  * index: 目前處理元素的陣列索引
  * array: 呼叫此方法的陣列
* thisArg (optional): 執行 callback 的 this 值



Example:

````js
var origAry = [1, 5, 10, 15];
var newAry = origAry.map(function(currentValue, index, array) {
  console.log(`currentValue=[${currentValue}] index=[${index}], array=[${array}]`);
    return currentValue * 2;
});

console.log(origAry); // [1, 5, 10, 15]
console.log(newAry);  // [2, 10, 20, 30]

// ***** result *****
// currentValue=[1] index=[0], array=[1,5,10,15]
// currentValue=[5] index=[1], array=[1,5,10,15]
// currentValue=[10] index=[2], array=[1,5,10,15]
// currentValue=[15] index=[3], array=[1,5,10,15]
// (4) [1, 5, 10, 15]
// (4) [2, 10, 20, 30]
````

Using ES6 Arrow Function Syntax, it'll be more concise:

````js
var origAry = [1, 5, 10, 15];
var newAry = origAry.map((x) => x * 2);

console.log(origAry); // [1, 5, 10, 15]
console.log(newAry);  // [2, 10, 20, 30]
````



#### Array.prototype.filter()

ref: https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/filter

> 過濾，巡訪每個元素，逐一判斷是否保留，回傳布林

`var newArray = oldAry.filter(callback[, thisArg])`

* callback: 有3個參數:
  * currentValue: 目前處理的元素值
  * index: 目前處理元素的陣列索引
  * array: 呼叫此方法的陣列
* thisArg (optional): 執行 callback 的 this 值


````js
var origAry = ['12345', '1', '1234', '123', '12'];
var newAry = origAry.filter(x => x.length > 3);

console.log(origAry); // ["12345", "1", "1234", "123", "12"]
console.log(newAry);  //["12345", "1234"]
````



#### Array.prototype.reduce()

ref: https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce

> 利用一個累加器及陣列中每項元素，將陣列化為單一值

`var newArray = oldAry.reduce(callback[accumlator, currentValue, currentIndex, array], initialValue)`

* callback: 有4個參數:
  * accumulator: 用來累積回呼函式回傳值的累加器或 initialValue（若有的話）。累加器是上一次呼叫後，所回傳的累加數值。
  * currentValue: 目前處理的元素值
  * index: 目前處理元素的陣列索引
  * array: 呼叫此方法的陣列
* initialValue (optional): 累加器初始值。建議提供比較保險
  * 若沒有提供初始值，則會用原陣列的第一個元素當作初始值，**並且跳過第一個元素(index=0)的處理**
  * 假如於一個空陣列呼叫 reduce() 方法，且沒有提供累加器初始值，將會發生錯誤


Example 1: 陣列值加總

無 initialValue:

````js
var rlt = [1, 2, 3, 4, 5].reduce(
  (accumulator, currentValue, currentIndex, array) => {
    return accumulator + currentValue;
  }
);
console.log(rlt); //15
````

有 initialValue:

````js
var rlt = [1, 2, 3, 4, 5].reduce(
  (accumulator, currentValue, currentIndex, array) => {
    return accumulator + currentValue;
  },10
);
console.log(rlt); //25
````

也可以如下寫法：

````js
var cbk = (accumulator, currentValue, currentIndex, array) => {
    return accumulator + currentValue;
};
console.log( [1, 2, 3, 4, 5].reduce(cbk) );     // 15
console.log( [1, 2, 3, 4, 5].reduce(cbk, 10) ); // 25
````

ES6 語法簡寫:

````js
var cbk = (accumulator, currentValue) => accumulator + currentValue;
console.log( [1, 2, 3, 4, 5].reduce(cbk) );
console.log( [1, 2, 3, 4, 5].reduce(cbk, 10) );
````


Example 2: 比較物件屬性大小

````js
var maxCallback = ( acc, curEl, curIdx, ary ) => {
    console.log(`curIdx=[${curIdx}]`);
    return (acc.x > curEl.x) ? acc : curEl;
};

console.log( [ { x: 22 }, { x: 42 } ].reduce( maxCallback) ); // { x: 42 }
console.log( [ { x: 22 }, { x: 42 } ].reduce( maxCallback, { x: 50 } ) ); // { x: 50 }
console.log( [ { x: 22 }            ].reduce( maxCallback) ); // { x: 22 }
console.log( [                      ].reduce( maxCallback) ); // TypeError
````

如果純粹比較大小想取最終值，以下寫法比較好:

````js
// map/reduce; better solution, also works for empty or larger arrays
var maxCallback2 = ( max, cur ) => Math.max( max, cur );
var rlt = [ { x: 22 }, { x: 42 } ].map( el => el.x )
                        .reduce( maxCallback2, -Infinity );
console.log(rlt); //42
````



#### Array.prototype.every()

ref: https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/every

> 巡訪每個元素，測試是否每一個元素都通過條件(只要遇到不合格的就會停下來並回傳 false)


`var bool = arr.every(callback[, thisArg])`

* callback: 有3個參數:
  * currentValue: 目前處理的元素值
  * index: 目前處理元素的陣列索引
  * array: 呼叫此方法的陣列
* thisArg (optional): 執行 callback 的 this 值



Example:

````js
var numbers = [24, 19, 16, 25, 29];
var allPass = numbers.every(myFunction);
function myFunction(value, index, array) {
    console.log(`index=[${index}] value=[${value}]`);
    return value > 18;
}
console.log(`allPass=[${allPass}]`);

// ======== result:
// index=[0] value=[24]
// index=[1] value=[19]
// index=[2] value=[16]
// allPass=[false]
````

ES6 syntax:

````js
var allPass = [24, 19, 16, 25, 29].every(val => val > 18);
````






