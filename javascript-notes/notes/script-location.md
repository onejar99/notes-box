# JS 語法的放置位置

[TOC]



## Intro

In HTML, JavaScript statements are "instructions" to be "executed" by the web browser.



## In HTML

* Must be inserted between `<script>` and `</script>` tags.
* `<script type="text/javascript">`: This type attribute is not required.
  * (JavaScript is the default scripting language in HTML).
  * EX:

```html
<script>
function myFunc() {
	alert('Hi');
}
</script>
<button type="button" onclick="myFunc()">Try it</button>
```
* JavaScript 放在 HTML 中的 `<body>` 或 `<head>` sections 裡都行，沒有個數限制
	* 即使放在 `<html>` 之外也能 work (on Chrome)

* Keeping all code in one place, is always a good habit.
  * It is a good idea to __place scripts at the bottom of the `<body>` element. This can improve page load__, because script compilation can slow down the display.
  * You can place __an external script reference in `<head>` or `<body>`__ as you like. The script will behave as if it was located exactly where the `<script>` tag is located.


## External JavaScript (外部的 JS 檔)

* 引用語法：

````html
<script src="myScript.js"></script>
````
* External scripts (e.g. "myScript.js") 裡直接就是JS語法，不用也不能再有`<script>`標籤(因為這是HTML標籤)
* 外部JS檔的優點
  1. It separates HTML and code
  2. It makes HTML and JavaScript easier to read and maintain
  3. Cached JavaScript files can speed up page loads

> 簡單來說就是：更易維護+有助於JS快取來加強頁面讀取速度

-----