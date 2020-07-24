# JS Coding Conventions

Coding conventions are **style guidelines for programming**.

They typically cover:
* Naming and declaration rules for variables and functions.
* Rules for the use of white space, indentation, and comments.
* Programming practices and principles

Coding conventions secure **quality**:
* Improves code readability
* Make code maintenance easier

General JavaScript code conventions used by W3Schools:
1. Variable And Function Names
  * camelCase
  * start with a letter
  * Global variables & Constants written in UPPERCASE
  * Hyphens are not allowed in JavaScript names.
2. Spaces Around Operators
3. Code Indentation
  * Always use 4 spaces
  * Do not use tabs (tabulators) for indentation. Different editors interpret tabs differently.
4. Always end a simple statement with a semicolon
5. General rules for complex (compound) statements:
  * Put the opening bracket at the end of the first line.
  * Use one space before the opening bracket.
  * Put the closing bracket on a new line, without leading spaces.
  * Do not end a complex statement with a semicolon.
  * EX:
  ````js
  if (time < 20) {
      greeting = "Good day";
  }
  ````
6. Line Length
  * if tool long, break it after an operator or a comma.

Use Lower Case File Names
* Most web servers (Apache, Unix) are case sensitive about file names:
  * EX: london.jpg cannot be accessed as London.jpg.
* Other web servers (Microsoft, IIS) are not case sensitive:
  * EX: london.jpg can be accessed as London.jpg or london.jpg.
* Always use lower case file names (if possible).


Performance
* Coding conventions are not used by computers. Most rules have little impact on the execution of programs.
* Indentation and extra spaces are not significant in small scripts.
* For code in development, readability should be preferred. Larger production scripts should be minified.
