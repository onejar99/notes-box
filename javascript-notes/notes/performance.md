# JS Performance

Speed up JS code.


## With JS Syntax

### 1. Reduce Activity in Loops

for-loop 的 condition-statement 每一次 iteration 都會執行一次，需要運算、存取的部分拉出來會更快

Bad:

````js
var i;
for (i = 0; i < arr.length; i++) {
````

Better:

````js
var i;
var l = arr.length;
for (i = 0; i < l; i++) {
````


### 2. Avoid Using `with`

* Avoid using the `with` keyword.
* It has a negative effect on speed. It also clutters up JavaScript scopes.
* The `with` keyword is not allowed in strict mode.


----

## With DOM

### 1. Reduce DOM Access

* 跟普通JS語法相比，Accessing the HTML DOM is very slow
* 如果需要存取多次，最好存到 local variables

````js
var obj = document.getElementById("demo");
obj.innerHTML = "Hello";
````


### 2. Reduce DOM Size

Keep the number of elements in the HTML DOM small.

This will always improve page loading, and speed up rendering (page display), especially on smaller devices.

Every attempt to search the DOM (like getElementsByTagName) will benefit from a smaller DOM.



----

## Delay JS Code Loading

Putting your scripts at the bottom of the page body lets the browser load the page first.

While a script is downloading, the browser will not start any other downloads. In addition all parsing and rendering activity might be blocked.

> The HTTP specification defines that browsers should not download more than two components in parallel.

An alternative is to use **defer="true"** in the script tag. The defer attribute specifies that the script should be executed after the page has finished parsing, but it only works for external scripts.

If possible, you can add your script to the page by code, after the page has loaded:

````js
<script>
window.onload = function() {
    var element = document.createElement("script");
    element.src = "myScript.js";
    document.body.appendChild(element);
};
</script>
````

