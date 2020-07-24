## Base64 API

````js
testBase64('Hello, world', btoa, atob); //SGVsbG8sIHdvcmxk
testBase64('Hello, world', b64EncodeUnicode, b64DecodeUnicode); //SGVsbG8sIHdvcmxk
testBase64('C# Base64編碼處理', b64EncodeUnicode, b64DecodeUnicode);  //QyMgQmFzZTY057eo56K86JmV55CG
testBase64('✓ à la mode', b64EncodeUnicode, b64DecodeUnicode);  //4pyTIMOgIGxhIG1vZGU=


function testBase64(origStr, encodeFunc, decodeFunc){
  var base64Str = encodeFunc(origStr);
  var decodedStr = decodeFunc(base64Str);
  console.log(`origStr       =[${origStr}]`);
  console.log(`decodedStr    =[${decodedStr}]`);
  console.log(`base64Str     =[${base64Str}]`);
}


/*** Solution – escaping the string before encoding it ***/
function b64EncodeUnicode(str) {
    // first we use encodeURIComponent to get percent-encoded UTF-8,
    // then we convert the percent encodings into raw bytes which
    // can be fed into btoa.
    return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g,
        function toSolidBytes(match, p1) {
            return String.fromCharCode('0x' + p1);
    }));
}
function b64DecodeUnicode(str) {
    // Going backwards: from bytestream, to percent-encoding, to original string.
    return decodeURIComponent(atob(str).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
}
````
