## Encode URI

### escape()

> The escape() function was deprecated in JavaScript version 1.5. 
>
> Use encodeURI() or encodeURIComponent() instead.

````js
console.log("Need tips? Visit W3Schools!"); //"Need%20tips%3F%20Visit%20W3Schools%21"
````



### encodeURI()

````js
var uri = "my test.asp?name=ståle&car=saab";
var res = encodeURI(uri); //"my%20test.asp?name=st%C3%A5le&car=saab"
````



### decodeURI()

