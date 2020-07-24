## String API

[TOC]



----

[Complete JavaScript String Reference](https://www.w3schools.com/jsref/jsref_obj_string.asp)

> Note:
> 基本上 method 的回傳結果都是一個新的字串，不會影響到原字串 (即使是 `replace()` )
>
> All string methods return a new string. They don't modify the original string.
> Formally said: Strings are immutable: Strings cannot be changed, only replaced.

---

### Basic

#### length

````
var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
console.log(txt.length); //26
````

----

#### String() (Global)

convert to string


#### trim()

````js
var str = "   Hello  World ";
console.log(`str=[${str}]`);  // "str=[   Hello  World ]"
console.log(`str=[${str.trim()}]`); // "str=[Hello  World]"
````


---

### Search string position

#### indexOf()

#### lastIndexOf()

​````js
var str = "Please locate where 'locate' occurs!";
console.log( str.indexOf("locate") ); //7
console.log( str.lastIndexOf("locate") ); //21

//return -1 if the text is not found.
console.log( str.indexOf("abc") ); //-1
console.log( str.lastIndexOf("abc") ); //-1

//Both methods accept a second parameter as the starting position for the search:
console.log( str.indexOf("locate", 10) ); //21 (start at [10] and forward)
console.log( str.lastIndexOf("locate", 10) ); //7 (start at [10] and backward)
````



#### search()

> search() 和 indexOf() 很像，差別在於 search() 不能設起始位置的參數，但可以支援正規表示式

​````js
console.log( str.search("locate") ); //7
````

---

### Extract string

#### slice()

`slice(startIndex, endIndex)`

> 1. The character at `endIndex` is __NOT__ included.
> 2. No matter positive or negative, `endIndex` must be greater then `startIndex`
> 3. Positive and negative cannot be used in the same time

````js
var str = "Apple,Banana,Kiwi";

console.log( str.slice(0) ); //"Apple,Banana,Kiwi"
console.log( str.slice(7) ); //"anana,Kiwi"
console.log( str.slice(6, 12) ); //"Banana"
console.log( str.slice(6, 6) ); //""

console.log( str.slice(-10) ); //"anana,Kiwi"
console.log( str.slice(-2, -1) ); //"w"
console.log( str.slice(-12, -6) ); //",Banan"
console.log( str.slice(-2, -1) ); //"w"

console.log( str.slice(12, 1) ); //""
console.log( str.slice(-1, -10) ); //""
console.log( str.slice(-1, 1) ); //""
````



#### substring()

`substring(startIndex, endIndex)`

endIndex 不含

> substring() 和 slice() 很像，差別在：
>
> 1. substring() 不接受負數的參數 (不會 exception，但擷取字串的功能不會正常運作)
> 2. substring() 能處理 `endIndex` 小於 `startIndex` 的情況

````js
var str = "Apple,Banana,Kiwi";

console.log( str.substring(0) ); //"Apple,Banana,Kiwi"
console.log( str.substring(7) ); //"anana,Kiwi"
console.log( str.substring(6, 12) ); //"Banana"
console.log( str.substring(6, 6) ); //""

console.log( str.substring(-10) ); //"Apple,Banana,Kiwi" (extracting not work)
console.log( str.substring(-12, -6) ); //"" (extracting not work)

console.log( str.substring(12, 1) ); //"pple,Banana"
````



#### substr()

`substr(startIndex, length)`

> length 不能處理負數

````js
//substr(startIndex, length)

var str = "Apple,Banana,Kiwi";

console.log( str.substr(0) ); //"Apple,Banana,Kiwi"
console.log( str.substr(7) ); //"anana,Kiwi"
console.log( str.substr(6, 1) ); //"B"
console.log( str.substr(6, 12) ); //"Banana,Kiwi"

console.log( str.substr(-10) ); //"anana,Kiwi"
console.log( str.substring(6, -3) ); //"Apple,"
console.log( str.substring(7, -3) ); //"Apple,B"
````

---

### Extract characters

* __Safe__ methods for extracting string characters: `charAt()`, `charCodeAt()`
* Accessing a String as an Array is __Unsafe__ and __Unpredictable__
  * 1. It does not work in all browsers (not in IE5, IE6, IE7)
  * 2. It makes strings look like arrays (but they are not)
  * 3. str[0] = "H" does not give an error (but does not work)
* If you want to read a string as an array, convert it to an array first.

````js
var str = "HELLO WORLD";
console.log( str[0] );  //"H"
str[0] = "C"; // not work
console.log( str ); //"HELLO WORLD"
````



#### charAt()

#### charCodeAt()

````js
var str = "HELLO WORLD";
console.log( str.charAt(0) ); // "H"
console.log( str.charAt(-1) );  // ""
console.log( str.charAt(100) );  // ""

console.log( str.charCodeAt(0) );  //72
console.log( str.charCodeAt(-1) );  //NaN
console.log( str.charCodeAt(100) );  //NaN
````







---

### Replace string

#### replace()

`replace(searchStr, newStr)`

> By default:
>
> 1. Replaces only the first match
> 2. Case sensitive

````js
//By default
var str = "I'm Bond. James Bond.";
var n = str.replace("Bond", "Hunt");
console.log( str ); //"I'm Bond. James Bond."
console.log( n ); //"I'm Hunt. James Bond."
console.log( str.replace("bOnD", "Hunt") ); //"I'm Bond. James Bond."

//To replace all matches, use a regular expression with a /g flag (global match):
console.log( str.replace(/Bond/g, "Hunt") ); //"I'm Hunt. James Hunt."

//To replace case insensitive, use a regular expression with an /i flag (insensitive):
console.log( str.replace(/bOnD/i, "Hunt") ); //"I'm Hunt. James Bond."
console.log( str.replace(/bOnD/ig, "Hunt") ); //"I'm Hunt. James Hunt."
````

---

### Upper and Lower Case

#### toUpperCase()

#### toLowerCase()

````js
var txt = "Hello World!";
console.log( txt.toUpperCase() ); //"HELLO WORLD!"
console.log( txt.toLowerCase() ); //"hello world!"
````

---

### Concat string

#### concat()

> The same function as plus the operator(+).

````js
console.log( "Hello" + " " + "World!" ); //"Hello World!"
console.log( "Hello".concat(" ", "World!") ); //"Hello World!"
````

---

### String to Array

#### split()

````js
var txt = "a,b,c,d,e";
console.log( txt.split(",") ); // => ["a", "b", "c", "d", "e"] (Array, length=5)
console.log( txt.split(" ") ); // => ["a,b,c,d,e"] (Array, length=1)
console.log( txt.split("") );  // => ["a", ",", "b", ",", "c", ",", "d", ",", "e"] (Array, length=9)
````



----

### Format String

Ref: [ [JavaScript] 替數字、文字在特定長度中補0 ](https://dotblogs.com.tw/aquarius6913/2011/05/10/24655)

````js
function paddingLeft(str,lenght){
  str = '' + str; //改良，以防丟進來的是數字不是字串 (如果是數字: str.length= undefined)
  if(str.length >= lenght)
  return str;
  else
  return paddingLeft("0" +str,lenght);
}

function paddingRight(str,lenght){
  str = '' + str; //改良，以防丟進來的是數字不是字串 (如果是數字: str.length= undefined)
  if(str.length >= lenght)
  return str;
  else
  return paddingRight(str+"0",lenght);
}
````


