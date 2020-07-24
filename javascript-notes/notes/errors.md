# JS Errors - Throw and Try to Catch

## Statement Overview

| statement | description |
| ----------| ------------|
| `try`     | lets you test a block of code for errors. |
| `catch`   | lets you handle the error. |
| `throw`   | lets you create custom errors. |
| `finally` | lets you execute code, after try and catch, regardless of the result. |


## try/catch/finally

> * `finally` must be executed
> * if returned in `catch` and `finally` block in the same time, **returned by finally comes first**.

````js
var myFunc = function(){
    try{
        console.log('myFunc: exec try');
        throw new Error();
    } catch(e) {
        console.log('myFunc: exec catch');
        return "Catch";
    } finally {
        console.log('myFunc: exec finally');
        return "Finally";
    }
    console.log('myFunc: to be ended.');
    return "Done";
};

var x = myFunc();
console.log('x=', x);


//********* result ***********
//myFunc: exec try
//myFunc: exec catch
//myFunc: exec finally
//x= Finally
````

````js
var myFunc = function(){
    try{
        console.log('myFunc: exec try');
        throw new Error();
    } catch(e) {
        console.log('myFunc: exec catch');
        return "Catch";
    } finally {
        console.log('myFunc: exec finally');
        //return "Finally";
    }
    console.log('myFunc: to be ended.');
    return "Done";
};

var x = myFunc();
console.log('x=', x);

//********* result ***********
//myFunc: exec try
//myFunc: exec catch
//myFunc: exec finally
//x= Catch
````


----

## Throws

mynote: 只要是 `throw`，無論 throw 的是 Error 物件或普通變數，都會觸發 `catch`
(The exception can be a JavaScript String, a Number, a Boolean or an Object:)

````js
// trail code template
try{
  throw "Too big";          // throw a text
  //throw 500;              // throw a number
  //throw new Error();      // throw an Error Object
  //throw new Error('my error msg');
  //throw new Exception();  // Not an defined object
}catch(e){
  console.log(e);
  console.log(e.toString());
  console.log(typeof e);
  console.log(e.constructor);
  console.log(e.name);
  console.log(e.message);
}

// case 1: throw "Too big"
console.log(e);             // "Too big"
console.log(e.toString());  // "Too big"
console.log(typeof e);      // "string"
console.log(e.constructor); // ƒ String() { [native code] }
console.log(e.name);        // undefined
console.log(e.message);     // undefined

// case 2: throw 500
console.log(e);             // 500
console.log(e.toString());  // "500"
console.log(typeof e);      // "number"
console.log(e.constructor); // ƒ Number() { [native code] }
console.log(e.name);        // undefined
console.log(e.message);     // undefined

// case 3: throw new Error()
console.log(e);             // Error
                            //    at <anonymous>:4:8
                            //    at run_code (default-source2.js?v=a1:467)
                            //    at HTMLAnchorElement.onclick ((index):219)
console.log(e.toString());  // "Error"
console.log(typeof e);      // "object"
console.log(e.constructor); // ƒ Error() { [native code] }
console.log(e.name);        // "Error"
console.log(e.message);     // ""

// case 4: throw new Error('my error msg')
console.log(e);             // Error: my error msg
                            //    at <anonymous>:4:8
                            //    at run_code (default-source2.js?v=a1:467)
                            //    at HTMLAnchorElement.onclick ((index):219)
console.log(e.toString());  // "Error: my error msg"
console.log(typeof e);      // "object"
console.log(e.constructor); // ƒ Error() { [native code] }
console.log(e.name);        // "Error"
console.log(e.message);     // "my error msg"

// case 5: throw new Exception()
console.log(e);             // ReferenceError: Exception is not defined
                            //    at <anonymous>:4:2
                            //    at run_code (default-source2.js?v=a1:467)
                            //    at HTMLAnchorElement.onclick ((index):219)
console.log(e.toString());  // "ReferenceError: Exception is not defined"
console.log(typeof e);      // "object"
console.log(e.constructor); // ƒ ReferenceError() { [native code] }
console.log(e.name);        // "ReferenceError"
console.log(e.message);     // "Exception is not defined"
````


----

## Error Objects

JavaScript will actually create an **Error object** with two properties: *name* and *message*.

Six different values can be returned by the error name property:

| Error Name     | Description                                  |
| -------------- | ---------------------------------------------|
| EvalError      | An error has occurred in the eval() function |
| RangeError     | A number "out of range" has occurred         |
| ReferenceError | An illegal reference has occurred            |
| SyntaxError    | A syntax error has occurred                  |
| TypeError      | A type error has occurred                    |
| URIError       | An error in encodeURI() has occurred         |


### 1. EvalError

> Newer versions of JavaScript does **not** throw any `EvalError`. Use `SyntaxError` instead.


### 2. RangeError

e.g. `num.toPrecision(500);`


### 3. Reference Error

e.g. A variable that has not been declared:


### 4. Syntax Error

e.g. `eval("alert('Hello)");`


### 5. Type Error

> If you use a value that is outside the range of expected types:

e.g. `num.toUpperCase();`


### 6. URI Error

> Use illegal characters in a URI function

e.g. `decodeURI("%%%");`



----

## Non-Standard Error Object Properties

Mozilla and Microsoft defines some non-standard error object properties.

**Do not use** these properties in public web sites. They will not work in all browsers.

