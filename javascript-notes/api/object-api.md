## Object API

### defineProperty()

````js
var person = {};
Object.defineProperty(person, "name", {value:'John', writable:false});
Object.defineProperty(person, "age", {value:18, writable:true});
console.log(person);  // {name: "John", age: 18}
person.name = 'Andrew';
person.age = 40;
console.log(person);  // {name: "John", age: 40}
````

---

### get-only properties

var obj = {get x() {return 0} };
obj.x = 3.14;            // This will cause an error
