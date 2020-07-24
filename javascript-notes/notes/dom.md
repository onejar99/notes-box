# DOM

> Document Object Model (DOM)

[TOC]

## What is the DOM?

DOM 定義了操作文件檔的標準
(The DOM defines a standard for accessing and manipulating documents)

* **HTML DOM** 定義了操作HTML文檔的標準方法。 它將HTML文檔呈現為樹狀結構。
* **XML DOM** 定義了操作XML文檔的標準方式。 它將XML文檔呈現為樹形結構。


## XML DOM

> mynote: XML DOM 在操作時，每個東西視為一個 node，不管是element，element裡的文字，element上的attribute，都是用一個個node的方式在操作

[!](https://www.w3schools.com/xml/nodetree.gif)
(source: W3Schools)


### DOM Parser Support

All modern browsers have a built-in XML parser that can convert text into an **XML DOM object**.
(Old versions of Internet Explorer (IE5, IE6, IE7, IE8) do not support the DOMParser object. They use ActiveXObject)


````js
if (window.DOMParser) {
  // code for modern browsers
  parser = new DOMParser();
  xmlDoc = parser.parseFromString(text,"text/xml");
} else {
  // code for old IE browsers
xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  xmlDoc.async = false;
  xmlDoc.loadXML(text);
}
````

## XML DOM Example

### Example 1: XML Text to XML DOM Object:

````js
var parser = new DOMParser();
var xmlDoc = parser.parseFromString(text,"text/xml");

print(xmlDoc.getElementsByTagName("title")); // type=HTMLCollection, value= HTMLCollection(3) [title, title, title]
print(xmlDoc.getElementsByTagName("title")[0]); // type=Element, value= <title>The Little Prince</title>
print(xmlDoc.getElementsByTagName("title")[0].childNodes); // type=NodeList, value= NodeList [text]
print(xmlDoc.getElementsByTagName("title")[0].childNodes[0]); // type=Text, value= "The Little Prince"
print(xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue); //type=String, value= The Little Prince

function print(x){
  console.log('type=' + getType(x) + ', value=', x);
}

function getType(x){
  var cstr = x.constructor.toString();
  var endPos = cstr.indexOf("(");
    return cstr.substring("function ".length, endPos);
}
````


### Example 2: Generating XML DOM Document and converting to string:
(including CDATA, Attribute)

````js
var xmlDoc = document.implementation.createDocument(null, "books");
var rootElement = xmlDoc.getElementsByTagName("books")[0];
rootElement.appendChild(genBookNode(xmlDoc, "Harry Potter", 399));
rootElement.appendChild(genBookNode(xmlDoc, "The Little Prince", 299));
rootElement.appendChild(genBookNode(xmlDoc, "Test<GoGo>!@#$%^&*", 99));
var text = convertXmlDom2String(xmlDoc);
console.log(text);

function genBookNode(xmlDoc, title, price){
  var bookNnode = xmlDoc.createElement("book");
    var titleNode = genNodeWithTextValue(xmlDoc, "title", title);
    var priceNode = genNodeWithTextValue(xmlDoc, "price", price);
    var aliasNode = genNodeWithCdataTextValue(xmlDoc, "alias", title)
    addAttrToNode(xmlDoc, priceNode, "currency", "NT")
    bookNnode.appendChild(titleNode);
    bookNnode.appendChild(priceNode);
    bookNnode.appendChild(aliasNode);
    return bookNnode;
}

function genNodeWithTextValue(xmlDoc, tagName, value){
  var node = xmlDoc.createElement(tagName);
    var textNode = xmlDoc.createTextNode(value);
  node.appendChild(textNode);
    return node;
}

function addAttrToNode(xmlDoc, node, attrName, attrValue){
  var newAtt = xmlDoc.createAttribute(attrName);
  newAtt.nodeValue = attrValue;
  node.setAttributeNode(newAtt);
}

function genNodeWithCdataTextValue(xmlDoc, tagName, value){
  var node = xmlDoc.createElement(tagName);
    var textNode = xmlDoc.createCDATASection(value);
  node.appendChild(textNode);
    return node;
}

function convertXmlDom2String(xmlDoc){
  var serializer = new XMLSerializer();
  var xmlString = serializer.serializeToString(xmlDoc);
    return xmlString;
}

// ****** result *******
// <books>
//   <book>
//     <title>Harry Potter</title>
//     <price currency="NT">399</price>
//     <alias>
//       <![CDATA[Harry Potter]]>
//     </alias>
//   </book>
//   <book>
//     <title>The Little Prince</title>
//     <price currency="NT">299</price>
//     <alias>
//       <![CDATA[The Little Prince]]>
//     </alias>
//   </book>
//   <book>
//     <title>Test&lt;GoGo&gt;!@#$%^&amp;*</title>
//     <price currency="NT">99</price>
//     <alias>
//       <![CDATA[Test<GoGo>!@#$%^&*]]>
//     </alias>
//   </book>
// </books>
````


### Example 3: Creating XML DOM

ref: [Create XML in Javascript](https://stackoverflow.com/questions/14340894/create-xml-in-javascript)

JavaScript handles XML with 'XML DOM objects'. You can obtain such an object in three ways:

1. Creating a new XML DOM object

````js
var xmlDoc = document.implementation.createDocument(null, "books");
````

2. Fetching an XML file with XMLHttpRequest

````js
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
if (xhttp.readyState == 4 && xhttp.status == 200) {

    var xmlDoc = xhttp.responseXML; //important to use responseXML here
}
xhttp.open("GET", "books.xml", true);
xhttp.send();
````

3. Parsing a string containing serialized XML

````js
var xmlString = "<root></root>";
var parser = new DOMParser();
var xmlDoc = parser.parseFromString(xmlString, "text/xml"); //important to use "text/xml"
````


````js
var node = xmlDoc.createElement("heyHo");
var elements = xmlDoc.getElementsByTagName("root");
elements[0].appendChild(node);
````

can serialize XML DOM objects like this:

````js
var serializer = new XMLSerializer();
var xmlString = serializer.serializeToString(xmlDoc);
````


## XML CDATA

ref: http://www.w3school.com.cn/xml/xml_cdata.asp
ref: https://docs.microsoft.com/zh-tw/sql/relational-databases/xml/example-specifying-the-cdata-directive

所有 XML 文檔中的文本均會被解析器解析。

只有 CDATA 區段（CDATA section）中的文本會被解析器忽略。

常用於程式碼或SQL語法場合，例如ORM定義文件


CDATA 部分由 "<![CDATA[" 开始，由 "]]>" 结束：

EX:
````xml
<![CDATA[<Summary>This is summary description</Summary>]]>

<![CDATA[
function matchwo(a,b)
{
  if (a < b && a < 0) then
    { return 1; }
  else  {  return 0; }
}
]]>
````