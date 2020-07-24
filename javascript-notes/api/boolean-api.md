## Boolean API

### Convert to Booleans

`Boolean(value)`

`Boolean(expression)`



> mynote: Boolean() 的參數可以分 2 種類型：
>
> * 如果只放 **一個值** ，表示判斷 **是否有值**
> * 如果放的是 **一個式子** ， 表示 **普通的布林判斷式評算**

Basic Example:

````js
console.log( Boolean(-1) );		//true
console.log( Boolean(10>9) );	//true
console.log( (10>9) );			//true
````



> **When 放一個值：How Boolean() works?**
>
> * Everything With a "Value" is True
> * Everything Without a "Value" is False

````js
// With Value (true)
console.log( Boolean(10) );
console.log( Boolean(-1) );
console.log( Boolean("false") );
console.log( Boolean(true) );
console.log( Boolean(new Date()) );

// Without Value (false)
console.log( Boolean() );
console.log( Boolean(0) );
console.log( Boolean(-0) );
console.log( Boolean('') );
console.log( Boolean(NaN) );
console.log( Boolean(undefined) );
console.log( Boolean(null) );
console.log( Boolean(false) );
````



> **When 放一個式子：How Boolean() works?**
>
> * 根據**布林運算子的規則**進行評算

````js
// Comparision Evaluation
console.log( Boolean( false == 0 ) );	//true
console.log( Boolean( false === 0 ) );	//false
console.log( Boolean( true == 1 ) );	//true
console.log( Boolean( true == 2) );		//false
console.log( Boolean( true === 1 ) );	//false

console.log( Boolean( null == 0) );				//false
console.log( Boolean( null == undefined ) );		//true
console.log( Boolean( null === undefined ) );	//false
console.log( Boolean( undefined == 0 ) );		//false

console.log( Boolean( 'John' > null ) );	//false
console.log( Boolean( 1 > null ) );			//true
console.log( Boolean( 0 > null ) );			//false
console.log( Boolean( 1 > NaN ) );			//false
````

> **When 放多個參數：How Boolean() works?**
>
> * 似乎以第一個參數的 Boolean() 結果為準

````js
console.log( Boolean('John', 1>2) ); //true
console.log( Boolean(10>9, 1>2) ); //true
console.log( Boolean(1>2, 10>9) ); //false
````
