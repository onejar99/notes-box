# JS Regular Expressions


## Regular Expression Intro

* What is: A regular expression is a sequence of characters that forms a *search pattern*.
* For what: The search pattern can be used for *text search* and *text replace* operations.



Syntax:
````
/pattern/modifiers;
````

Example:
````js
var patt = /w3schools/i;
````

> * `/w3schools/i` is a regular expression.
> * `w3schools` is a pattern
> * `i` is a *modifier* (modifies the search to be case-insensitive).



* In JavaScript, regular expressions are often used with the two string methods: `search()` and `replace()`.
	* search(): uses an expression to search for a match, and returns the **position** of the match.
	* replace(): returns a **modified string** where the pattern is replaced.


----

## search()

### 1. Using String search() With a Regular Expression

Example:

Use a regular expression to do a case-insensitive search for "w3schools" in a string:

````js
var str = "Visit W3Schools w3Schools";
var n = str.search(/w3schools/i);
console.log( n ); //6
````


### 2. Using String search() With String

The search method will also accept a string as search argument.
The string argument will be converted to a regular expression:

````js
var str = "Visit W3Schools w3Schools";
var n = str.search('w3Schools');
console.log( n ); //16
````


----

## replace()

````js
var str = "Visit Orig Orig!";

// Use String replace() With a Regular Expression
console.log( str.replace(/orig/i, "New") );   //"Visit New Orig!"
console.log( str.replace(/orig/gi, "New") );  //"Visit New New!"
console.log( str.search(/orig/i) );           //6

// Using String replace() With a String
console.log( str.replace("Orig", "New") );    //"Visit New Orig!"
console.log( str.search("Orig") );            //6
console.log( str.replace("orig", "New") );    //"Visit Orig Orig!"
console.log( str.search("orig") );            //-1
````


----

## Regular Expression Modifiers

Modifiers can be used to perform case-insensitive more global searches:


| Modifier | Description                              |
| -------- | ---------------------------------------- |
| i        | Perform case-insensitive matching        |
| g        | Perform a global match (find all matches rather than stopping after the first match) |
| m        | Perform multiline matching               |



----

## Regular Expression Patterns

### Brackets `[]`

> are used to find a range of characters:

| Expression | Description                                     |
| ---------- | ----------------------------------------------- |
| [abc]      | Find any of the characters between the brackets |
| [0-9]      | Find any of the digits between the brackets     |
| (x|y)      | Find any of the alternatives separated with `|` |



### Metacharacters `\d`, `\s`, `\uxxx`

> are characters with a special meaning:

| Metacharacter   | Description                                                         |
| --------------- | ------------------------------------------------------------------- |
| \d              | Find a digit                                                        |
| \s              | Find a whitespace character                                         |
| \b              | Find a match at the beginning or at the end of a word               |
| \uxxxx          | Find the Unicode character specified by the hexadecimal number xxxx |



### Quantifiers

> define quantities:

| Quantifier   | Description                                                    |
| ------------ | -------------------------------------------------------------- |
| n+           | Matches any string that contains at least one n                |
| n*           | Matches any string that contains zero or more occurrences of n |
| n?           | Matches any string that contains zero or one occurrences of n  |



----

## RegExp Object

In JavaScript, the **RegExp object** is a regular expression object with predefined properties and methods.

````js
var patt = /orig/i;
console.log( typeof patt );       // "object"
console.log( patt );              // /orig/i
console.log( patt.toString() );   // "/orig/i"
console.log( patt.constructor );  // ƒ RegExp() { [native code] }
````


----

## test()

* The `test()` method is a RegExp expression method.
* It searches a string for a pattern, and returns `true` or `false`, depending on the result.

````js
console.log( /best/.test("The best things in life are free!") ); // true

var patt = /orig/i;
console.log( patt.test('Orig') );   // true
console.log( patt.test('orig') );   // true
console.log( patt.test('new') );    // false
````


----

## exec()

* The `exec()` method is a RegExp expression method.
* It searches a string for a specified pattern, and returns the found text.
* If no match is found, it returns `null`.

````js
console.log( /cde/.exec("abcdefghcde") );              // ["cde", index: 2, input: "abcdefghcde", groups: undefined]
console.log( typeof /cde/.exec("abcdefghcde") );       // "object"
console.log( /cde/.exec("abcdefghcde").toString() );   // "cde"

console.log( /best/.exec("The best things in life are free!") ); //["best", index: 4, input: "The best things in life are free!"]

var patt = /orig/i;
console.log( patt.exec('Hi Orig Orig') );   // ["Orig", index: 3, input: "Hi Orig Orig"]
console.log( patt.exec('Hi orig orig') );   // ["orig", index: 3, input: "Hi orig orig"]
console.log( patt.exec('Hi new') );         // null
````
