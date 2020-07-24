# API Intro

## Intro

* Including methods or properties.

> Note:  
> 呼叫 method 時，大多還是物件式的呼叫語法，例如 `str.xxx()`，少數是 global 型的呼叫 (e.g. PHP 的 file_get_contents())  
> (即使是 console.log() 其實也是物件式呼叫)

* Global 型呼叫：
  * `isNaN()`
  * `Number()`: converts to a Number
  * `String()`: converts to a String (the same as x.toString())
  * `Boolean()`: converts to a Boolean


* All JavaScript data types have methods:
  * `toString()`
  * `valueOf()`

----

## Special API

### eval()

````js
eval("var x = 2");
console.log(x);
````

