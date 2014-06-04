/*
 * An example of -- for most developers of other languages -- odd array copying behavior.
 * This is described on p. 302 of "The Swift Programming Language" book in section
 * "Assignment and Copy Behavior for Arrays"
 */


var a = ["foo"]
var b = a

b[0] = "bar"

//a reflects the change, as expected
a
a === b

//but changing the length of a
a.append("baz")

//leads to a and be becoming independent of each other
a
b
a === b