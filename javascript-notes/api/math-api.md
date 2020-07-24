## Math API

* Math Constructor
  * Unlike other global objects, the Math object has no constructor. Methods and properties are __static__.





### Math Properties

````js
console.log(Math.PI);	// 3.141592653589793

Math.E        // returns Euler's number
Math.PI       // returns PI
Math.SQRT2    // returns the square root of 2
Math.SQRT1_2  // returns the square root of 1/2
Math.LN2      // returns the natural logarithm of 2
Math.LN10     // returns the natural logarithm of 10
Math.LOG2E    // returns base 2 logarithm of E
Math.LOG10E   // returns base 10 logarithm of E
````



----

### Round

#### round()

#### ceil()

#### floor()

> 四捨五入、無條件進位、無條件捨去

````js
Math.round(4.7);    // returns 5
Math.round(4.4);    // returns 4

Math.ceil(4.4);     // returns 5

Math.floor(4.7);    // returns 4
````



----

### Mix & Max

#### min()

#### max()

````js
console.log( Math.min(0, 150, 30, 20, -8, -200) );	// -200
console.log( Math.max(0, 150, 30, 20, -8, -200) );	// 150
````



----

### Other Basis



#### pow()

> 次方

````js
Math.pow(8, 2);		// returns 64
````



#### sqrt()

> 平方

````js
Math.sqrt(64);      // returns 8
````



#### abs()

> 絕對值

````js
Math.abs(-4.7);     // returns 4.7
````



----

### Random

#### random()

> returns a random __float__ number between 0 (inclusive),  and 1 (exclusive):
>
> (0~1的浮點數，不包含1)

````js
for (i = 0; i < 10; i++) {
    console.log( Math.random() ); // e.g. 0.041695426644897005
}
````



#### Random Integers

> `Math.random()` used with `Math.floor()` can be used to return random integers.

````js
console.log( Math.floor(Math.random() * 11) ); // 0~10
console.log( Math.floor(Math.random() * 10) ); // 0~9
console.log( Math.floor(Math.random() * 100) ); // 0~99
console.log( Math.floor(Math.random() * 101) ); // 0~100
console.log( Math.floor(Math.random() * 10) +1 ); // 1~10
console.log( Math.floor(Math.random() * 100) +1 ); // 1~100
````



#### Random in Range

````js
// between min (included) and max (excluded):
function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
}

// between min and max (both included):
function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1) ) + min;
}
````



----

### 三角函數

#### sin()

#### cos()

````js
Math.sin(90 * Math.PI / 180);     // returns 1 (the sine of 90 degrees)
Math.cos(0 * Math.PI / 180);     // returns 1 (the cos of 0 degrees)
````

