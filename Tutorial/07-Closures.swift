/* Closures (or blocks or lambdas) */

// Explaining what closures are good for is beyond the scope of this tutorial. Just taking a look at how they work here. Basically they pose as unnamed functions that capture their surrounding context to some extent.

// A bit odd is that "in" separates the body from the head...
var myClosure = { (toGreet: String) -> String in "Hello " + toGreet }

// Calling it
myClosure("foo")

// Functions can take closures as arguments, allowing stuff such as the map method on Array.
["foo", "bar"].map(myClosure)

// If the closure is the last argument you can write it just after the method call. There are also several shorthand notations available.
var mappedArray = ["foo", "bar"].map() { name in "Hello " + name }
mappedArray
var anotherMappedArray = ["foo", "bar"].map() { "Hello " + $0 }
anotherMappedArray

// Just a small example of how closures capture their scope. Mechanics of this can be quite complex, for more detail, you should take a look at the docs.
var incrementEverythingBy = 42
var capturingScope = { (value: Int) in value + incrementEverythingBy }

capturingScope(1) //as expected

incrementEverythingBy = 0 //change the local value
capturingScope(1) //reflected in the closures behavior

// One more example that shows that closures are also able to change variables from scope they have caputured.
var canAlsoChange = 42
var changeTheLocalValues = { (value: Int) in canAlsoChange = value }

changeTheLocalValues(1)
canAlsoChange //Note that the value has changed to 1.