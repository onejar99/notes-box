## JavaScript HTML methods

### document.XXXX

#### 取得 HTML 元素 By ID：getElementById()

EX: "find" an HTML element (with id="demo")

````js
document.getElementById('demo')
````



#### 改變 HTML 元素內容：getElementById().innerHTML

The `innerHTML` property defines the HTML content

EX:

````html
<p id="demo">JavaScript can change HTML content.</p>
<button type="button" onclick="document.getElementById('demo').innerHTML = 'Hello JavaScript!'">Click Me!</button>
````



#### 改變 HTML 元素屬性：getElementById().xxx

Change HTML Attributes

EX: changes the src (source) attribute of an image. (達到開關燈泡的視覺效果)

````html
<img id="myImage" src="pic_bulboff.gif" style="width:100px">
<button onclick="document.getElementById('myImage').src='pic_bulbon.gif'">Turn on the light</button>
<button onclick="document.getElementById('myImage').src='pic_bulboff.gif'">Turn off the light</button>
````



#### 改變 HTML 元素 Style (CSS)：getElementById().style.xxx

EX:  改變字型大小：getElementById().style.fontSize

````html
<button type="button" onclick="document.getElementById('demo').style.fontSize='35px'">Click Me!</button>
````

EX: 隱藏/顯示HTML元素：getElementById().style.display

````html
<p id="demo" style="display:none">Hello JavaScript!</p>
<button type="button" onclick="document.getElementById('demo').style.display='none'">Click Me!</button>
<button type="button" onclick="document.getElementById('demo').style.display='block'">Click Me!</button>
````


