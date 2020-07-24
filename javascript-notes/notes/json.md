# JS JSON

## What is JSON

> **JSON** stands for **J**ava**S**cript **O**bject **N**otation

* JSON is **lightweight** **data interchange** format
* JSON is language independent
  * The JSON syntax is derived from JavaScript object notation syntax, but the JSON format is **text only**.
  * Code for reading and generating JSON data can be written in any programming language.
* JSON is "self-describing" and easy to understand


----

## JSON vs. JS Object

* JSON 是由 Native JS Object 語法衍生而來，非常相似，因此兩者可以輕易轉換
* there is any different?  --> yes, with detail syntax, but still similar


1. name/value pairs syntax
    * JSON: `{"firstName":"John", "lastName":"Doe"}`
    * JS Object: `{firstName:'John', lastName:"Doe"}`

2. name(key):
    * In JSON, keys must be strings. JSON names require **double quotes**
    * In JS, keys can be strings, numbers, or identifier names. JS names do not require double quotes.

3. value:
    * 少數 JS 的資料型態在 JSON 不支援，從 JS Object 轉成 JSON 會被忽略或轉型
      * e.g., function(忽略), Date(轉型成字串), undefined(忽略), null(忽略)
    * 如果硬希望透過 JSON 傳遞 function，迂迴方式: 用字串型態傳遞 function 定義，再用 eval() 轉換成真正的 function 型態
    * Date 雖然轉成JSON時會自動轉成字串，但轉回來時不會自動變成 Date 型態，要用 reviver function 額外處理

4. string:
    * JSON 必須雙括號，JS 單雙括號都可以


### Example 1: JS Object 轉換 JSON 會忽略不支援的資料型態

````js
var myFunc = function(){console.log('hi');};
var lv = "level";
var myName = "john";
var obj = {name: myName, age: 18, lv: 2, "addr": 'mars', birth: new Date(), armor: null, weapon:undefined, spell: myFunc};
console.log(obj);
console.log(JSON.stringify(obj));

// ********* result ********
// {name: "john", age: 18, lv: 2, addr: "mars", birth: Tue Jan 30 2018 11:33:20 GMT+0800 (台北標準時間), armor: null, weapon: undefined, spell: ƒ}
// {"name":"john","age":18,"lv":2,"addr":"mars","birth":"2018-01-30T03:33:20.615Z", "armor":null}
````


### Example 2: 從 JSON 傳 function 給 JS Object 執行的迂迴作法


````js
var text = '{ "name":"John", "age":"function () {return 30;}", "city":"New York"}';
var obj = JSON.parse(text);
console.log(typeof obj.age);         //"string"
console.log(obj.age);                //"function () {return 30;}"
var x = eval("(" + obj.age + ")");
console.log(x);                      //ƒ () {return 30;}
````

----

## JSON Files

* The file type for JSON files is `.json`
* The MIME type for JSON text is `application/json`

----

## Why JSON is Better Than XML

* JSON is shorter
* JSON can use arrays
* XML has to be parsed with an XML parser. JSON can be parsed by a standard JavaScript function.
  (mynote: 主流 browser 其實都有內建 XML parser 可以轉換 XML text 成 XML DOM Object，不過比起原生 JS Object 的操作，XML DOM Object 相對不那麼簡便直觀)


----

## JSONP

> JSONP stands for JSON with Padding.

### What's JSONP

* JSONP is a method for sending JSON data without worrying about **cross-domain issues**.
* JSONP does **not** use the `XMLHttpRequest` object.
* JSONP uses the `<script>` tag instead.
* Requesting a file from another domain can cause problems, due to cross-domain policy.
* Requesting an external script from another domain does not have this problem.
* JSONP uses this advantage, and request files using the script tag instead of the XMLHttpRequest object.

> Also refer to: [JS AJAX - Access Across Domains](../notes/ajax.md#access-across-domains)


### Example: Basic Usage

test.html (client-side):

````js
<p id="demo"></p>
<script>
function myFunc(myObj) {
  console.log('myObj=', myObj);
    document.getElementById("demo").innerHTML = myObj.name;
}
</script>
<script src="demo_jsonp.php"></script>
````

demo_jsonp.php (dummy of server-side response):

````
myFunc({ "name":"John", "age":30, "city":"New York" });
````

HTML Page Result:

````
John
````



### Example: Creating a Dynamic Script Tag

The script tag should only be created when needed:

````js
function clickButton() {
    var s = document.createElement("script");
    s.src = "demo_jsonp.php?x=123&callback=myDisplayFunction";
    document.body.appendChild(s);
}
````


