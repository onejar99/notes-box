# JS Conditional Statements (if-else, switch)

[TOC]



---

## if-else

As general.

> * (If or IF) will generate a JavaScript error.
> * if 判斷條件裡的運作等同 [Boolean()](../api/boolean-api.md)



---

## Swtich

### Overview

**Note:**

* The switch expression is evaluated **once**.
* 以隧道的概念去理解 switch-case statements
* case 入口：
  * 每個 case 就像同一個隧道的不同區段入口，和 case 裡的值作 `===`  的比較，如果符合就進去
  * 支援 string 的比較
  * 同樣條件的 case 可以重複設，但整個隧道的入口，只要有一個進去了，其他入口都會關閉，break 出來也不會再進去
* 進入入口後：
  * 一旦進去了，就像進入同一個隧道
  * 除了執行自己這一個 block 的程式，還可以往下繼續執行到下一區段的程式，不被下一區段的入口檢核影響
  * 除非遇到 break，會被強制踢出隧道
* default 是一種特殊入口：
  * 語法上只能放一個
  * 錯誤檢核條件是無條件，所以通常放最後
  * 就算放最前面，還是會等其他入口都檢核過，都沒符合的才進入default
  * 一旦進入default，就像進入隧道的邏輯，根據 default 的位置，有可能執行到下一個區段的程式



**Syntax Template:**

````
switch(**expression**) {
    case **value-of-case**:
        //code block
        break;
    case **value-of-case**:
        //code block
        break;
    default:
        //code block
}
````



### Usage Example:

````js
switch (new Date().getDay()) {
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case 3:
        console.log("Wednesday");
        break;
    case 4:
        console.log("Thursday");
        break;
    case 5:
        console.log("Friday");
        //break;
    case 6:
    case 0:
        console.log("Yes! Weekend!");
        break;
    default:
        console.log("WTF");
}

// ***** result: (at Friday) *******
//"Friday"
//"Yes! Weekend!"
````



### Example: expression是 === 比較

````js
switch ("1") {
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    default:
        console.log("WTF");
}
// ***** result: *******
//"WTF"
````



### Example: 即使 default 放最前面，也會先檢查其他入口

```js
switch ("1") {
	default:
        console.log("WTF");
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case "1":
        console.log("Monday");
        break;
}
// ***** result: *******
//"Monday"
```





### Example: 一旦 default 進去了，就像隧道的運作，和其他區段貫通

```js
switch ("1") {
	default:
        console.log("WTF");
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case 1:
        console.log("Monday");
        break;
}
// ***** result: *******
//"WTF"
//"Monday"
```





### Example: break 出來，不會再進其他入口

````js
switch ("1") {
	default:
        console.log("WTF");
    case "1":
        console.log("Monday1");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case "1":
        console.log("Monday2");
        break;
}
// ***** result: *******
//"Monday1"
````







