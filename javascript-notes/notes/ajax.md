# Ajax

[TOC]



## What is Ajax

> AJAX stands for **A**synchronous **J**avaScript **A**nd **X**ML.

**mynote:**

* Ajax 不是一種程式語言，而是一種技術或技巧：在背景端和 web server 交換資料
* 因此可以做到和頁面 loading 非同步的更新：更新頁面資料時不需要 reload 整個頁面，也可以等頁面 load 完才進行，等 server response 的過程也可以繼續其他動作 (non-blocking)
* Ajax 利用瀏覽器內建的 `XMLHttpRequest` object 去和 server 交換資料，利用 JS 和 DOM 去處理資料


> The keystone of AJAX is the XMLHttpRequest object.



**Official Intro:**

* AJAX is **not** a programming language.
* AJAX is a technique for accessing web servers from a web page.
* Using AJAX, You can:
  * Read data from a web server - after the page has loaded
  * Update a web page without reloading the page
  * Send data to a web server - in the background
* AJAX just uses a combination of:
  1. A browser built-in `XMLHttpRequest` object (to exchange data with a web server)
  2. JavaScript and HTML DOM (to display or use the data)



> AJAX is a misleading name.    
> 除了 XML，也很常用 JSON 或純文字(plain text)傳遞資料

> AJAX 還是可以用 Synchronous 運作，但不建議，而且 Synchronous 正從 standard 中被廢除，一些開發工具也會警告 Synchronous 用法    
> (Synchronous XMLHttpRequest is in the process of being removed from the web standard, but this process can take many years.)



----


## How AJAX Works

![](../figures/w3schools_ajax.gif)

Figure source: [w3schools](https://www.w3schools.com/js/js_ajax_intro.asp)



**Process Explained:**

1. web page 發生一個 event (e.g. the page is loaded, a button is clicked)
2. JavaScript 建立一個 `XMLHttpRequest` object
3. 該 `XMLHttpRequest` object 發送一個 request 給 web server
4. server 處理 request，發送一個 response 回來給 web page
5. JavaScript 讀取 response 的回傳內容，在 JavaScript 或 DOM 執行對應的動作 (e.g. page update)




----

## Ajax Baic Example


Ajax for requesting data:

````html
<div id="demo">
<h2>The XMLHttpRequest Object</h2>
<button type="button" onclick="loadDoc()">Change Content</button>
</div>

<script>
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "ajax_info.txt", true); //open(method, url, async)
  xhttp.send();
}
</script>
````



----

## XMLHttpRequest.readyState

Ref: [XMLHttpRequest.readyState - Web APIs - MDN - Mozilla](https://developer.mozilla.org/zh-TW/docs/Web/API/XMLHttpRequest/readyState)

XMLHttpRequest.readyState 屬性會回傳一個 XMLHttpRequest 客戶端物件目前的狀態。

一個 XHR 客戶端可以為下列其中一種狀態：

| Value | State            | Description                              |
| ----- | ---------------- | ---------------------------------------- |
| 0     | UNSENT           | 客戶端已被建立，但 open() 方法尚未被呼叫。                |
| 1     | OPENED           | open() 方法已被呼叫。<br/>於此狀態時，可以使用 [setRequestHeader()](https://developer.mozilla.org/zh-TW/docs/Web/API/XMLHttpRequest/setRequestHeader) 方法設定請求標頭（request headers），並可呼叫 [send()](https://developer.mozilla.org/zh-TW/docs/Web/API/XMLHttpRequest/send) 方法來發送請求。 |
| 2     | HEADERS_RECEIVED | send() 方法已被呼叫，並且已接收到回應標頭（response header），也就是可取得 header 與狀態。 |
| 3     | LOADING          | 正在接收回應內容（response's body），此時 responseText 會擁有部分資料。 |
| 4     | DONE             | 完成下載操作，請求操作完成，這意味著資料傳輸可能已成功完成或是已失敗。      |



----

## XMLHttpRequest Supported



* 所有 modern browsers 都有 support `XMLHttpRequest` object.
  * e.g. Chrome, Firefox, IE7+, Edge, Safari, Opera
  * have a built-in XMLHttpRequest object.
* Older Browsers (Old versions of Internet Explorer)
  * e.g. IE5 and IE6
  * use an ActiveX object(`ActiveXObject()`) instead of the XMLHttpRequest object




----

## Access Across Domains

* For security reasons, modern browsers 不允許 *access across domains*
* 也就是說 web page 跟他要存取的 XML file 必須在位同一個 server

> mynote:
> * 測試：用 local html 去發 request 要遠端 server 的資料
> * 結果：Failed to load http://10.1.31.137/sms/SystemInfo: No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'null' is therefore not allowed access.


Ref: [跨來源資源共享（CORS）| MDN](https://developer.mozilla.org/zh-TW/docs/Web/HTTP/CORS)

* 基於安全性考量，程式碼所發出的跨來源 HTTP 請求是受到限制的。
  * 例如，XMLHttpRequest 及 Fetch 皆遵守同源政策（same-origin policy）。
* 這代表網路應用程式所使用的這些 API 只能請求來自和應用程式相同網域的 HTTP 資源，除非使用了 CORS 標頭。
* 跨來源資源共享（Cross-Origin Resource Sharing，簡稱 CORS）機制提供了網頁伺服器跨網域的存取控制，增加跨網域資料傳輸的安全性。
  * 現代瀏覽器支援在 API 容器（如 XMLHttpRequest 或 Fetch）中使用 CORS，以降低跨來源 HTTP 請求的風險。


> Another solution: [JS JSON - JSONP](../notes/json.md#jsonp)



----