## Ajax API (XMLHttpRequest)

Ref: [XMLHttpRequest Object Methods & Properties](https://www.w3schools.com/js/js_ajax_http.asp)


### Examples:

> Basic Example for sending request to a Server:
> When readyState is 4 and status is 200, the response is ready:


````js
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
````


> using GET, you may get a cached result. To avoid this, add a unique ID to the URL:

````js
xhttp.open("GET", "demo_get.asp?t=" + Math.random(), true);
xhttp.send();
````


> To POST data like an HTML form:

````js
xhttp.open("POST", "ajax_test.asp", true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send("fname=Henry&lname=Ford");
````

> Synchronous Request

Since the code will wait for server completion, there is no need for an onreadystatechange function:

````js
xhttp.open("GET", "ajax_info.txt", false);
xhttp.send();
document.getElementById("demo").innerHTML = xhttp.responseText;
````







----

### Request Methods

#### open()

`open(method, url, async)`

> Specifies the type of request
> * `method`: the type of request: GET or POST
> * `url`: the server (file) location
> * `async`: true (asynchronous) or false (synchronous)


----

#### send()

`send()`

> Sends the request to the server (used for GET)

`send(string)`

> Sends the request to the server (used for POST)


> always use POST requests when:
> * A cached file is not an option (update a file or database on the server).
> * Sending a large amount of data to the server (POST has no size limitations).
> * Sending user input (which can contain unknown characters), POST is more robust and secure than GET.


----

### setRequestHeader()

`setRequestHeader(header, value)`

> Adds HTTP headers to the request
> * `header`: specifies the header name
> * `value`: specifies the header value


````js
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
````

----

### Request Properties

#### readyState

holds the status of the XMLHttpRequest

* 0: request not initialized
* 1: server connection established
* 2: request received
* 3: processing request
* 4: request finished and response is ready


#### onreadystatechange

callback function to be executed when the `readyState` changes

* The onreadystatechange function is called every time the readyState changes.
* The onreadystatechange event is triggered four times (1-4)

#### status & statusText

holds the status of the XMLHttpRequest object(Http Status)

E.g.

| status | statusText           |
|--------| ---------------------|
| 200    | "OK"                 |
| 403    | "Forbidden"          |
| 404    | "Page not found"     |


### Response Properties

#### responseText

get the response data as a string


#### responseXML

get the response data as XML data

* The XML HttpRequest object has an in-built XML parser.
* The `responseXML` property returns the server response as an XML DOM object.


Example:

````js
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunc1(this);
    }
  };
  xhttp.open("GET", "cd_catalog.xml", true);
  xhttp.send();
}

function myFunc1(xhttp) {
  xmlDoc = xhttp.responseXML;
  txt = "";
  x = xmlDoc.getElementsByTagName("ARTIST");
  for (i = 0; i < x.length; i++) {
    txt += x[i].childNodes[0].nodeValue + "<br>";
    }
  document.getElementById("demo").innerHTML = txt;
}

function myFunc2(xhttp) {
  var i;
  var xmlDoc = xhttp.responseXML;
  var table="<tr><th>Artist</th><th>Title</th></tr>";
  var x = xmlDoc.getElementsByTagName("CD");
  for (i = 0; i <x.length; i++) { 
    table += "<tr><td>" +
    x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
    "</td></tr>";
  }
  document.getElementById("demo").innerHTML = table;
}
````

cd_catalog.xml:

````xml
<CATALOG>
<CD>
<TITLE>Empire Burlesque</TITLE>
<ARTIST>Bob Dylan</ARTIST>
<COUNTRY>USA</COUNTRY>
<COMPANY>Columbia</COMPANY>
<PRICE>10.90</PRICE>
<YEAR>1985</YEAR>
</CD>
<CD>
<TITLE>Hide your heart</TITLE>
<ARTIST>Bonnie Tyler</ARTIST>
<COUNTRY>UK</COUNTRY>
<COMPANY>CBS Records</COMPANY>
<PRICE>9.90</PRICE>
<YEAR>1988</YEAR>
</CD>
.......
</CATALOG>
````



### Response Methods

#### getResponseHeader()

`getResponseHeader(headerName)`

Returns specific header information from the server resource

E.g.

````js
this.getResponseHeader("Last-Modified");
````


#### getAllResponseHeaders()

Returns all the header information from the server resource

returned such as:

````
date: Wed, 24 Jan 2018 08:13:09 GMT content-encoding: gzip vary: Accept-Encoding last-modified: Tue, 18 Jul 2017 16:14:29 GMT server: ECS (khh/0477) age: 0 x-powered-by: ASP.NET etag: "15bfdeee0ffd21:0" x-frame-options: SAMEORIGIN x-cache: HIT content-type: text/plain cache-control: public,max-age=14400,public connection: Keep-Alive accept-ranges: bytes content-length: 245
````

