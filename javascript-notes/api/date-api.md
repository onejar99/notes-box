## Date API

[TOC]



----

### Create Date Object

#### Date()

`new Date()`

`new Date(milliseconds)`

`new Date(dateString)`

`new Date(year, month, day, hours, minutes, seconds, milliseconds)`

> JS counts months from 0 to 11. January is 0. December is 11.

````js
// Way 1: new Date()
var d = new Date();

// Way 2: new Date(milliseconds)
var d = new Date(86400000); //Fri Jan 02 1970 08:00:00 GMT+0800 (台北標準時間)

// Way 3: new Date(dateString)
var d = new Date("March 25, 2015 11:13:00");  //Wed Mar 25 2015 11:13:00 GMT+0800 (台北標準時間)
var d = new Date("2015-03-25"); //(ISO Date, The International Standard)
var d = new Date("2015/03/25");
var d = new Date("03/25/2015");
var d = new Date("Mar 25 2015");
var d = new Date("25 Mar 2015");
var d = new Date("Wednesday March 25 2015");
var d = new Date("2015-03");
var d = new Date("2015");
//.....etc.

//Omitting T or Z in a date-time string can give different result in different browser.
var d = new Date("2015-03-25T12:00:00Z"); // T: separating Date and time; Z: UTC time
var d = new Date("2015-03-25T12:00:00-06:30"); //relative to UTC (+HH:MM or -HH:MM)

//Some browsers will error
var d = new Date("2015-3-25"); //with no leading zeroes
var d = new Date("2015/03/25"); //YYYY/MM/DD
var d = new Date("25-03-2015"); //DD-MM-YYYY


// Way 4: new Date(year, month, day, hours, minutes, seconds, milliseconds)
//counts months from 0 to 11. January is 0. December is 11.
var d = new Date(99, 5, 24, 11, 33, 30, 500); //Thu Jun 24 1999 11:33:30 GMT+0800 (台北標準時間)
var d = new Date(99, 5, 24, 11, 33, 30);	//Thu Jun 24 1999 11:33:30 GMT+0800 (台北標準時間)
var d = new Date(99, 5, 24, 11, 33);		//Thu Jun 24 1999 11:33:00 GMT+0800 (台北標準時間)
var d = new Date(99, 5, 24, 11);			//Thu Jun 24 1999 11:00:00 GMT+0800 (台北標準時間)
var d = new Date(99, 5, 24);				//Thu Jun 24 1999 00:00:00 GMT+0800 (台北標準時間)
var d = new Date(99, 5);					//Tue Jun 01 1999 00:00:00 GMT+0800 (台北標準時間)
var d = new Date(99);			//Thu Jan 01 1970 08:00:00 GMT+0800 (台北標準時間) (incorrect)
````



----

### Parsing Dates

#### Date.parse()

> convert a valid date string to milliseconds
>
> mynote:
> 覺得和 new Date(string) 的用途極類似，轉成 millisecond 反而多一層工

```js
var msec = Date.parse("March 21, 2012");
var d = new Date(msec);
```

----

### Is Date

Refer to: Array API - Self-Defined isArray() via constructor

----

### To String

#### (directly stringify object)

#### toString()

#### toUTCString()

#### toDateString()

````js
var d = new Date();

console.log( d );					    //Tue Dec 05 2017 19:29:54 GMT+0800 (台北標準時間)
console.log( d.toString() );		//Tue Dec 05 2017 19:29:54 GMT+0800 (台北標準時間)

//The toUTCString() method converts a date to a UTC string (a date display standard).
console.log( d.toUTCString() );		//Tue, 05 Dec 2017 11:29:54 GMT

console.log( d.toDateString() );	//Tue Dec 05 2017
````



----

### Getting (a part of a Date)

````js
var d = new Date("March 25, 2015 11:13:05.800");

//Getting a part of a Date
console.log( d.getFullYear() );			//2015 (the four digit year) (yyyy)
console.log( d.getMonth() );			//2 (0-11)
console.log( d.getDate() );				//25 (day) (1-31)
console.log( d.getDay() );				//3 (weekday) (0-6) 0=Sunday
console.log( d.getHours() );			//11 (0-23)
console.log( d.getMinutes() );			//13 (0-59)
console.log( d.getSeconds() );			//5 (0-59)
console.log( d.getMilliseconds() );		//800 (0-999)
console.log( d.getTime() );				//1427253180000 (milliseconds since January 1, 1970)
````



----

### Setting (a part of a Date)

> mynote:
>
> 1. Setting methods just __like void setter__. The object will be changed.
> 2. There is still returned value. Note that will __return timestamp(number), not a Date object__.

````js
var d = new Date('2015-03-25T12:30:05.800');
console.log( typeof d );							//"object"
console.log( typeof d.setFullYear(20201, 0, 14) );	//"number"
````



Setting Example:

````js
var d = new Date('2015-03-25T12:30:05.800');
d.setFullYear(2020);		//Set the year (optionally month and day)
d.setFullYear(2020, 5);
d.setFullYear(2020, 5, 15);
d.setDate(1); 				//Set the day as a number (1-31)
d.setHours(23);				//Set the hour (0-23)
d.setMilliseconds(440);		//Set the milliseconds (0-999)
d.setMinutes(33);			//Set the minutes (0-59)
d.setMonth(1);				//Set the month (0-11)
d.setSeconds(33);			//Set the seconds (0-59)
d.setTime(1580571213440);	//Set the time (milliseconds since January 1, 1970)
console.log(d);	// "Sat Feb 01 2020 23:33:33 GMT+0800 (台北標準時間)"
````



----

### UTC Getting

> Same as Getting Methods, , but returns the UTC date

````js
getUTCDate()	//Same as getDate(), but returns the UTC date
getUTCDay()	//Same as getDay(), but returns the UTC day
getUTCFullYear()	//Same as getFullYear(), but returns the UTC year
getUTCHours()	//Same as getHours(), but returns the UTC hour
getUTCMilliseconds()	//Same as getMilliseconds(), but returns the UTC milliseconds
getUTCMinutes()	//Same as getMinutes(), but returns the UTC minutes
getUTCMonth()	//Same as getMonth(), but returns the UTC month
getUTCSeconds()	//Same as getSeconds(), but returns the UTC seconds
````



----

### Add Days

> The `setDate()` method can also be used to add days to a date:

````js
var d = new Date('2015-01-10T12:30:05.800');
console.log(d);						// "Sat Jan 10 2015 12:30:05 GMT+0800 (台北標準時間)"
d.setDate( 50 );	//將日期部分設50，超過當月天數的部分自動進位到下個月
console.log(d);						// "Thu Feb 19 2015 12:30:05 GMT+0800 (台北標準時間)"
d.setDate( d.getDate() + 50 ); //從指定日期往上加50天，如果超過當月天數，一樣自動進位
console.log(d);						// "Fri Apr 10 2015 12:30:05 GMT+0800 (台北標準時間)"
````

----

### Compare Dates

> Directly comparing

````js
var today = new Date();
var someday = new Date();
someday.setFullYear(2100, 0, 14);

if (someday > today) {
    text = "Today is before January 14, 2100.";
} else {
    text = "Today is after January 14, 2100.";
}
````



----

### Format

EX:

````js
var date = new Date(value);
return date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate();
````
