# JS Events

## JS Can React to HTML Events

* HTML events are "things" that happen to HTML elements.
* JavaScript lets you execute code when events are detected.
* An HTML event can be something the __browser does__, or something a __user does__.



Syntax:

````
<[element] [event name]="(JavaScript code)">
````

Example:

````html
<!-- executes some javascript code or calls javascript function -->
<button onclick="document.getElementById('demo').innerHTML = Date()">The time is?</button>
<button onclick="displayDate()">The time is?</button>
<!-- changes the content of its own element -->
<button onclick="this.innerHTML = Date()">The time is?</button>
<!-- changes the style of its own element -->
<span onmouseover="this.style.color='red'" onmouseout="this.style.color='black'">Mouse over me!</span>
````



##  HTML Events

| Event       | Description                              |
| ----------- | ---------------------------------------- |
| onchange    | An HTML element has been changed         |
| onclick     | The user clicks an HTML element          |
| onmouseover | The user moves the mouse over an HTML element |
| onmouseout  | The user moves the mouse away from an HTML element |
| onkeydown   | The user pushes a keyboard key           |
| onload      | The browser has finished loading the page |
| .....       |                                          |

Complete list of HTML Events: [HTML DOM Events](https://www.w3schools.com/jsref/dom_obj_event.asp)