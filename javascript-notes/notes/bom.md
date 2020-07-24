# JavaScript Browser BOM

[TOC]

## BOM Intro

> Browser Object Model (BOM)

BOM allows JavaScript to "talk to" the browser.


## Window Object

* represents the browser's window
* All global JavaScript objects, functions, and variables automatically become members of the window object.
  * Global variables: properties of the window object.
  * Global functions: methods of the window object.
  * Even the document object (of the HTML DOM) is a property of the window object:

````js
window.document.getElementById("header");
document.getElementById("header");  // the same as above
````


## Window Properties

### Window Size

視窗大小，會隨視窗大小調整而變化

* size of the browser window
* The browser window (the browser viewport) is **NOT** including toolbars and scrollbars.


* window.innerHeight: the **inner** height of the browser window (in pixels)
* window.innerWidth: the **inner** width of the browser window (in pixels)


A practical JavaScript solution (covering all browsers):

````js
var w = window.innerWidth
|| document.documentElement.clientWidth
|| document.body.clientWidth;

var h = window.innerHeight
|| document.documentElement.clientHeight
|| document.body.clientHeight;

console.log(`Browser inner window width: ${w}, height: ${h}.`);
````



### Window Screen

使用者螢幕解析度大小，和視窗大小無關


The `window.screen` object contains information about the user's screen.

The `window.screen` object can be written without the `window` prefix.

* screen.width
* screen.height
* screen.availWidth
* screen.availHeight



* height vs. availHeight
1080 vs 1040

整個螢幕解析度大小 vs. 可用的區域大小(例如扣掉Windows的工具列)

screen.colorDepth
screen.pixelDepth

colorDepth: 16, 24, 32 bit 色彩

For modern computers, Color Depth and Pixel Depth are equal.





### window.location

切換當前頁網址

````js
<script>
window.location = "demo_json.php";
</script>
````

----

## Window Methods

### window.open()

`window.open([URL, name, specs, replace])`

open a new window

### window.close()

close the current window

### window.moveTo()

### window.moveBy()

move the current window

### window.resizeTo()

resize the current window

````js
<button onclick="openWinAtTab()">Create new window</button>
<button onclick="openWinAsSimpleWindow()">Create new window 2</button>
<button onclick="moveWinTo()">Move new window</button>
<button onclick="moveWinBy()">Move the new window by 75 * 50px</button>
<button onclick="resizeWin()">Resize the new window</button>
<button onclick="closeWin()">Close new window</button>

<script>
var myWindow;

function openWinAsSimpleWindow() {
    myWindow = window.open("", "", "width=250, height=250");
}

function openWinAtTab() {
    myWindow = window.open("");
}

function moveWinTo() {
    myWindow.moveTo(150, 150);
    myWindow.focus();
}

function moveWinBy() {
    myWindow.moveBy(75, 50);
    myWindow.focus();
}

function resizeWin(){
  myWindow.resizeTo(500, 500);
    myWindow.focus();
}

function closeWin(){
  myWindow.close();
}
</script>
````
