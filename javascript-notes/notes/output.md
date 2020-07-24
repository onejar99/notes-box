# JS Output

[TOC]



## Intro

* JavaScript does NOT have any built-in print or display functions. -> __??__
* JavaScript can "display" data in different ways:

| Way              | Description                      | Remark                                |
| ---------------- | -------------------------------- | ------------------------------------- |
| window.alert()   | Writing into an alert box        | mynote: alert() 和 window.alert() 似乎沒差 |
| document.write() | Writing into the HTML output     | should only be used for testing       |
| innerHTML        | Writing into an HTML element     |                                       |
| console.log()    | Writing into the browser console |                                       |



## alert()

```html
<script>
window.alert(5 + 6);
alert("hi");
</script>
```



## document.write()

* The document.write() method __should only be used for testing__.
* Using document.write() after an HTML document is fully loaded, will delete all existing HTML:
* EX: (按了button之後，畫面原本的內容都會被取代，"My First Web...."文字都會不見 PS: 但因為是動態改變，檢視原始碼的內容仍不變)

```html
<!DOCTYPE html>
<html>
<body>

<h1>My First Web Page</h1>
<p>My first paragraph.</p>

<button onclick="document.write(5 + 6)">Try it</button>

</body>
</html>
```



## innerHTML

* The `id` attribute defines the __HTML element__.
* The `innerHTML` property defines the __HTML content__:
* EX:

````html
<p id="demo"></p>
<script>
document.getElementById("demo").innerHTML = 5 + 6;
</script>
````



## console.log()

* Activate the browser console with F12, and select "Console" in the menu.
* EX:

````html
<script>
console.log(5 + 6);
</script>
````

-----