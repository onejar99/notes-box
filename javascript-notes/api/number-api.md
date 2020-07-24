## Number API

* [Complete JavaScript Number Reference](https://www.w3schools.com/jsref/jsref_obj_number.asp)

### Number Properties

> * Number 的內建常數
> * 少數可以直接呼叫 (E.g. NaN)，大部分都需要由 Number 物件呼叫

````js
console.log( Number.MAX_VALUE );			// 1.7976931348623157e+308
console.log( Number.MIN_VALUE );			// 5e-324
console.log( Number.NEGATIVE_INFINITY );	// -Infinity
console.log( Number.NaN );					// NaN
console.log( Number.POSITIVE_INFINITY );	// Infinity

// ES6 new
console.log(Number.EPSILON);				// 2.220446049250313e-16
console.log(Number.MIN_SAFE_INTEGER);		// -9007199254740991
console.log(Number.MAX_SAFE_INTEGER);		// 9007199254740991
````





### To String With Special Format

#### toString()

> 可以指定幾進制，預設是十進制

````js
var n = 128;

// to string
console.log( n );				//128
console.log( n.toString() );	//"128"
console.log( (456).toString() );//"456"
console.log( (4+5).toString() );//"9"

// to string with specific Positional Notation
console.log( n.toString(2) );	//"10000000"
console.log( n.toString(3) );	//"11202"
console.log( n.toString(8) );	//"200"
console.log( n.toString(10) );	//"128"
console.log( n.toString(16) );	//"80"
````



#### toExponential()

> * 轉換成 e 的格式 (exponential notation)，可以指定小數點後要留下幾位數
> * 如果指定留下的位數比原本數字的小數點後位數少，會自動四捨五入

````js
var x = 9.656;
console.log( x.toExponential() );      // "9.656e+0"
console.log( x.toExponential(2) );     // "9.66e+0"
console.log( x.toExponential(4) );     // "9.6560e+0"
console.log( x.toExponential(6) );     // "9.656000e+0"
````



#### toPrecision()

> * 指定數字保留位數，包含小數點前與小數點後，四捨五入，不足的位數補零
> * argument 不指定等於保留原值
> * argument 若有值，需 between 1 and 100

````js
var x = 9.656;
console.log( x.toPrecision() );      // "9.656"
//console.log( x.toPrecision(0) );     // X(toPrecision() argument must be between 1 and 100)
console.log( x.toPrecision(1) );     // "1e+1"
console.log( x.toPrecision(2) );     // "9.7"
console.log( x.toPrecision(4) );     // "9.656"
console.log( x.toPrecision(6) );     // "9.65600"
````


#### toFixed()

> * 指定小數保留位數，四捨五入，不足的位數補零
> * argument 不指定等於 default=0
> * toFixed(2) is perfect for working with money.

````js
var x = 9.656;
console.log(x.toFixed());            // "10"
console.log(x.toFixed(0));           // "10"
console.log(x.toFixed(2));           // "9.66"
console.log(x.toFixed(4));           // "9.6560"
console.log(x.toFixed(6));           // "9.656000"
````

----

### Get Value

#### valueOf() (Do not use)

> The valueOf() method is used internally in JavaScript to convert Number objects to primitive values.
> There is no reason to use it in your code.

````js
var x = 123;
console.log( x.valueOf() );		// 123
console.log( (123).valueOf() );	// 123
````



----

### Is Number

#### isNaN() (Global)

```js
console.log( isNaN( 100 / "Apple") ); //true
console.log( isNaN( 100 / "10") );  //false
console.log( isNaN( NaN ) ); //true
console.log( isNaN( Infinity ) ); //false
```

----

### Is Number Finite

#### isFinite() (Global)

returns false if the argument is `Infinity` or `NaN`.

````js
console.log(isFinite(10/2)); // true
console.log(isFinite(10/0)); // false
console.log(isFinite("abc")); // false
````


----

### Is Number an Interger

#### isInteger()

````js
console.log(Number.isInteger(10)); // true
console.log(Number.isInteger(10.5)); // false
console.log(Number.isInteger(12345678901234567890)); // true
````

#### isSafeInteger()

A **safe integer** is an integer that can be exactly represented as a double precision number.

> Safe integers are all integers from -(2^53 - 1) to +(2^53 - 1).
> This is safe: 9007199254740991. This is not safe: 9007199254740992.

````js
console.log(Number.isSafeInteger(10)); // true
console.log(Number.isSafeInteger(10.5)); // false
console.log(Number.isSafeInteger(12345678901234567890)); // false
````


----

### Convert to Numbers

There are 3 JavaScript methods that can be used to convert variables to numbers:

#### Number() (Global)

#### parseInt() (Global)

#### parseFloat() (Global)


* Note:
  * Number():
    * can: boolean, null, Date, 空string, 純數字內容的string, 空陣列, 只有一個元素的陣列
    * cant(NaN): 非純數字string, 多元素陣列, undefined
  * parseInt(): 只能針對數字開頭的string, 或一個以上元素的陣列去轉，
    * 但只要是數字開頭是數字，即使string後面有一些非數字的內容，仍會開頭有多少轉多少
    * 無條件捨去
  * parseFloat(): 同 parseInt()，差別在轉的是浮點數


````js
//Number()
console.log( Number(true) );			// 1
console.log( Number(false) );			// 0
console.log( Number(null) );			// 0
console.log( Number(undefined) );		// NaN
console.log( Number(NaN) );				// NaN
console.log( Number(Infinity) );      // Infinity
console.log( Number(new Date()) );		// 1512463300500 (milliseconds since 1.1.1970)
console.log( Number("") );        // 0
console.log( Number("10") );			// 10
console.log( Number("10.33") );			// 10.33
console.log( Number("10 20 years ") );	// NaN
console.log( Number("10.33old") );		// NaN
console.log( Number("years 10") );		// NaN
console.log( Number([]) );        // 0
console.log( Number([20.5]) );      // 20.5
console.log( Number([20.5,10]) );   // NaN

// parseInt()
console.log( parseInt(true) );			// NaN
console.log( parseInt(false) );			// NaN
console.log( parseInt(null) );			// NaN
console.log( parseInt(undefined) );		// NaN
console.log( parseInt(NaN) );			// NaN
console.log( parseInt(Infinity) );  //NaN
console.log( parseInt(new Date()) );	// NaN
console.log( parseInt("") );        // NaN
console.log( parseInt("10") );      // 10
console.log( parseInt("10.88") );   // 10
console.log( parseInt("10 20 years") ); // 10
console.log( parseInt("10.88old") );  // 10
console.log( parseInt("years 10") );	// NaN
console.log( parseInt([]) );      // NaN
console.log( parseInt([20.5]) );    // 20
console.log( parseInt([20.5,10]) );   // 20

// parseFloat()
console.log( parseFloat(true) );		// NaN
console.log( parseFloat(false) );		// NaN
console.log( parseFloat(null) );		// NaN
console.log( parseFloat(undefined) );	// NaN
console.log( parseFloat(NaN) );			// NaN
console.log( parseFloat(Infinity) );  //Infinity
console.log( parseFloat(new Date()) );  // NaN
console.log( parseFloat("") );        // NaN
console.log( parseFloat("10") );		// 10
console.log( parseFloat("10.88") );		// 10.88
console.log( parseFloat("10 20 years") );	// 10
console.log( parseFloat("10.88old") );		// 10.88
console.log( parseFloat("years 10") );	// NaN
console.log( parseFloat([]) );      // NaN
console.log( parseFloat([20.5]) );    // 20.5
console.log( parseFloat([20.5,10]) ); // 20.5
````



----

#### Unary + Operator

* The unary + operator can be used to convert a variable to a number
* If the variable cannot be converted, it will still become a number, but with the value NaN (Not a number):
* mynote: convert效果跟 Number()一樣


````js
//numberic string
var s = "5";
var x = + s;
console.log(x);     // 5
console.log(typeof x);  // "number"

//non-numberic string 1
var s = "John";
var x = + s;
console.log(x);     // NaN
console.log(typeof x);  // "number"

//non-numberic string 2
var s = "10year";
var x = + s;
console.log(x);     // NaN
console.log(typeof x);  // "number"

//Date
var s = new Date();
var x = + s;
console.log(x);     // 1515487721743
console.log(typeof x);  // "number"
````
