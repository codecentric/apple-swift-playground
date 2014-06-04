/* Tuples (very nice to have) */

var intAndString = (123, "foo")
// Access like this
intAndString.0
intAndString.1

// Or even more readable
var myTuple: (tuplesInt: Int, tuplesString: String)
myTuple.tuplesInt = 123
myTuple.tuplesString = "foo"
myTuple

// You also can decompose in a batch
var (theInt, theString) = intAndString
theInt
theString

// Or use the wildcard to ignore some values
var (_, onlyWantTheString) = intAndString
onlyWantTheString