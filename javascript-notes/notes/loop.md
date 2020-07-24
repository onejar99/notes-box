# JS Loop (Iterative)

[TOC]

---

## for


Basic Example:

````js
var itemAry = ['item1', 'item2', 'item3', 'item4'];
for (i = 0 ; i < itemAry.length ; i++) {
    console.log(itemAry[i]);
}
````

Syntax:

````
for (`statement-start`; `statement-condition`; `statement-each-time-end`) {
    //code block to be executed
}
````

> mynote:
> * 3 個 statements 都是 optional，但分號[;]不可省略
>   * *statement-condition* 如果省略，視同true
>   * *statement-start* 和 *statement-each-time-end* 可以執行多個語法，以逗號 [,] 分隔
> * 3 個 statements 執行時機：
>   * statement-start*: 整個 for-loop 開始前會執行一次
>   * *statement-condition*: 每一 round (or "one iteration") 要**開始前**都會執行一次
>     * 運作原理基本上同 Boolean(...)，如果是 true 才開始執行該 round
>     * 例外狀況: (1) 省略，視同 true (2) 多個 expression 以逗號分隔，以最後一個結果為準
>   * *statement-each-time-end*: 每一 round **結束後**都會執行一次



Example 1: when statement-condition is a value, Boolean() is false

````js
for(i = 0 ; null ; i++){
  console.log(i);
}
console.log('end');

//***** result: *****
//end
````



Example 2: when statement-condition is a value, Boolean() is true

````js
var exeCnt = 0;
for(i = 0 ; 'john' ; i++){
  console.log(`i=${i}`);
    exeCnt++;
    // fuse
    if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//i=0
//i=1
//i=2
//i=3
//i=4
//i=5
//end
````



Example 3: when statement-condition is an expression, need to avoid **infinite loop**

````js
var startNum = 1;
var limitNum = 5;
var exeCnt = 0;

function getLimitNum(){
  return limitNum++;
}

function getStartNum(){
  return startNum++;
}

for(i = getStartNum() ; i < getLimitNum() ; i++){
  console.log(`i=${i}, exeCnt=${exeCnt}, startNum=${startNum}, limitNum=${limitNum}`);
    exeCnt++;
    // fuse
    if(exeCnt > 10) break;
}
console.log(`Final: exeCnt=${exeCnt}, startNum=${startNum}, limitNum=${limitNum}`);

//***** result: *****
//i=1, exeCnt=0, startNum=2, limitNum=6
//i=2, exeCnt=1, startNum=2, limitNum=7
//i=3, exeCnt=2, startNum=2, limitNum=8
//i=4, exeCnt=3, startNum=2, limitNum=9
//i=5, exeCnt=4, startNum=2, limitNum=10
//i=6, exeCnt=5, startNum=2, limitNum=11
//i=7, exeCnt=6, startNum=2, limitNum=12
//i=8, exeCnt=7, startNum=2, limitNum=13
//i=9, exeCnt=8, startNum=2, limitNum=14
//i=10, exeCnt=9, startNum=2, limitNum=15
//i=11, exeCnt=10, startNum=2, limitNum=16
//Final: exeCnt=11, startNum=2, limitNum=16
````



Example 4: *statement-start* 和 *statement-each-time-end* 可以執行多個語法，以逗號 [,] 分隔

````js
var exeCnt = 0;
for(i=0, j=1  ;  ;  i++, j*=2){
  console.log(`i=${i}, j=${j}`);
    exeCnt++;
    // fuse
    if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//i=0, j=1
//i=1, j=2
//i=2, j=4
//i=3, j=8
//i=4, j=16
//i=5, j=32
//end
````



Example 5: *statement-condition* 也可以多個，但只以最後一個結果為準

````js
// result is true
for(; 1>2, 10>9 ;){...}
for(; false, true ;){...}

// result is false
for(; true, false ;){...}
for(; false, false ;){...}
for(; false && true ;){...}
for(; false || true, true && false ;){...}
````



Example 6:  3個 statement 皆可省略，但分號[;]不可省略，statement-condition若省略視為 true

````js
var exeCnt = 0;
var i = 0, j = 0;
for(;;){
  console.log(`i=${i}, j=${j}`);
    exeCnt++;
    // fuse
    if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//i=0, j=0
//i=0, j=0
//i=0, j=0
//i=0, j=0
//i=0, j=0
//i=0, j=0
//end
````



----


## for-in

The JavaScript for/in statement loops through the properties of an object:


> NOTE:
> * for-in 裡宣告的變數代表 key，而非整個元素
> * 所以用在陣列，r 是 index；用在 Object，r 是 property 名稱

````JS
var people = [
  {name: 'John', age: 18},
  {name: 'Rubio', age: 26},
  {name: 'Lin', age: 28},
];

for(var r in people){
    console.log(people[r]);
}

//******* Result *********
//{name: "John", age: 18}
//{name: "Rubio", age: 26}
//{name: "Lin", age: 28}
````



for-in 後面的 condition 只會執行一次:

````js
var ary = [1, 2, 3, 4];
console.log(ary);

var exeCnt = 0;
for( var i in getAry() ){
    console.log(`i=[${i}] ary[i]=${ary[i]}`);
    // fuse
    if(exeCnt > 10) break;
}
console.log('end');

function getAry(){
  console.log('go getAry()');
  ary.push(99);
  return ary;
}

/******result*********
(4) [1, 2, 3, 4]
go getAry()
i=[0] ary[i]=1
i=[1] ary[i]=2
i=[2] ary[i]=3
i=[3] ary[i]=4
i=[4] ary[i]=99
end
********************/
````


## for-of (ES6)

> NOTE:
> * 和 for-in 類似，差別在於 for-in 取的值是 key，for-of 取的值是 value
> * 後面的 condition 一樣只會執行一次
> * for-of 無法用於 Object，只能用於陣列 (必須是 iterable)

````js
var ary = [1, 2, 3, 4];
console.log(ary);

var exeCnt = 0;
for ( let value of getAry() ) {
    value += 1;
    console.log(value);

    // fuse
    if(exeCnt > 10) break;
}
console.log('end');
console.log(ary);

function getAry(){
  console.log('go getAry()');
  ary.push(99);
  return ary;
}

/******result*********
(4) [1, 2, 3, 4]
go getAry()
2
3
4
5
100
end
(5) [1, 2, 3, 4, 99]
*********************/
````


----

## while



Syntax Template:

````
while (**condition**) {
    // code block to be executed
}
````



mynote:

> condition: 每一 round 要開始前都會執行一次
>
> - 和 for-loop 的 statement-condition 類似，只差在不能省略，可以多個 expression
> - 運作原理基本上同 Boolean(...)，如果是 true 才開始執行該 round
> - 多個 expression 以逗號分隔，以最後一個結果為準



Example 1: condition 每次都會執行

````js
var exeCnt = 0;
var startNum = 1; // PS: 如果初始值是 0，因為 return 0 回去，while-loop 會進不去

function getStartNum(){
  return startNum++;
}

while( getStartNum() ){
  console.log(`exeCnt=${exeCnt} startNum=${startNum}`);
  exeCnt++;
  // fuse
  if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//exeCnt=0 startNum=2
//exeCnt=1 startNum=3
//exeCnt=2 startNum=4
//exeCnt=3 startNum=5
//exeCnt=4 startNum=6
//exeCnt=5 startNum=7
//end
````



Example 2: condition 可以放多個，以最後一個的結果為準

````js
var exeCnt = 0;
while( false, "john" ){
  console.log(`exeCnt=${exeCnt}`);
  exeCnt++;
  // fuse
  if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//exeCnt=0
//exeCnt=1
//exeCnt=2
//exeCnt=3
//exeCnt=4
//exeCnt=5
//end
````

````js
var exeCnt = 0;
while( "john", false ){
  console.log(`exeCnt=${exeCnt}`);
  exeCnt++;
  // fuse
  if(exeCnt > 5) break;
}
console.log('end');

//***** result: *****
//end
````



---

## do-while

As general.



---


## Break/Continue

* The break statement "jumps out" of a loop.
* The continue statement "jumps over" one iteration in the loop.




---

## Labels

* mynote:
  * 幫一段 code-block 標籤，可以用 `break <labelname>` 跳過不要執行的部分，做到 `do-while(false){break;}` 的效果
  * 不知道 `continue labelname;` 的應用場合

> * The `continue` statement (with or without a label reference) can only be used to **skip one loop iteration**.
> * The `break` statement, without a label reference, can only be used to **jump out of a loop or a switch**.
> * With a label reference, the break statement can be used to **jump out of any code block**:


````js
var cars = ["BMW", "Volvo", "Saab", "Ford"];
list: {
  console.log(cars[0]);
  console.log(cars[1]);
  break list;
  console.log(cars[2]);
  console.log(cars[3]);
}

//***** result: *****
//BMW
//Volvo
````
