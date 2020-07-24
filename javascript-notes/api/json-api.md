## JSON API

### Convert JSON Text and Object

#### JSON.parse()

`JSON.parse(text [, reviverFunc])`


JavaScript built-in function

````js
var obj = JSON.parse(text);
````

> When using the JSON.parse() on a JSON derived from an array, the method will return a JavaScript array, instead of a JavaScript object.

````js
var ret1 = JSON.parse('{"names":["John", "Ann", "Jeremy"]}');
var ret2 = JSON.parse('["John", "Ann", "Jeremy"]');
var ret3 = JSON.parse('"John"');

console.log(ret1.constructor);  //ƒ Object() { [native code] }
console.log(ret2.constructor);  //ƒ Array() { [native code] }
console.log(ret3.constructor);  //ƒ String() { [native code] }
````


The reviver parameter is a function that checks each property, before returning the value.

````js
var text = '{ "name":"Soar", "package":"FireSword,ChainArmor,Herb", "occupation":"Hero", "birth":"2018-01-30T08:09:26.066Z"}';
var obj = JSON.parse(text, function (key, value) {
    if (key == "birth") {
      return new Date(value);
    } else if (key == "package") {
    var ary = value.split(",");
        return {weapon: ary[0], armor: ary[1], item: ary[2]};
    } else {
        return value;
    }
});
console.log(obj);

//****result****
// {
//   name:"Soar",
//   birth:Tue Jan 30 2018 16:09:26 GMT+0800 (台北標準時間)
//   occupation:"Hero",
//   package:{
//     armor:"ChainArmor",
//     item:"Herb",
//     weapon:"FireSword"
//   }
// }
````




#### JSON.stringify()


````js
var person = { name: 'John', age: 18 };
var x = JSON.stringify(person);
console.log(x); //"{"name":"John","age":18}"
````
