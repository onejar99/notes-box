# JS Best Practices


## Avoid global variables

* Minimize the use of global variables.
  * (includes all data types, objects, and functions)
  * Global variables and functions can be overwritten by other scripts.
* Always Declare Local Variables
  * All variables used in a function should be declared as local variables.
  * Local variables must be declared with the `var` keyword, otherwise they will become global variables.
  * Strict mode does not allow undeclared variables.
* Learn how to use **closures**.


----

## Declarations on Top

It is a good coding practice to put all declarations at the top of each script or function.

This will:
* Give cleaner code
* Provide a single place to look for local variables
* Make it easier to avoid unwanted (implied) global variables
* Reduce the possibility of unwanted re-declarations

> By default, JavaScript moves all declarations to the top (JavaScript Hoisting).



----

## Initialize Variables

It is a good coding practice to initialize variables when you declare them.

This will:
* Give cleaner code
* Provide a single place to initialize variables
* Avoid undefined values

Initializing variables provides an idea of the intended use (and intended data type).


----

## Avoid `new`

Never Declare Number, String, or Boolean Objects

Don't Use new Object()
* Use {} instead of new Object()
* Use "" instead of new String()
* Use 0 instead of new Number()
* Use false instead of new Boolean()
* Use [] instead of new Array()
* Use /()/ instead of new RegExp()
* Use function (){} instead of new Function()


----

## Use `===` Comparison

avoid  `==`


----

## Use Parameter Defaults

refer to section: Function Parameter Defaults


----

## End Your Switches with Defaults

Always end your switch statements with a default.
Even if you think there is no need for it.


----

## Avoid Using eval()
The eval() function is used to run text as code.
In almost all cases, it should not be necessary to use it.
Because it allows arbitrary code to be run, it also represents a security problem.

----

