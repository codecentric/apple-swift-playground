/* Collections */

// Aside from the basic data types, Swift provides two collection types Array and Dictionary with a nice creation and accessing syntax.
var myArray = ["foo", "bar"]
myArray[0]
var myDict = ["foo": 0, "bar": 42]
myDict["bar"] //notice this returns Int? as it might be nil

// Collections use generics for strong typing as well:
var anotherArray: Array<String>
var anotherDict: Dictionary<String,Int>

// Collections are mutable by default and assigning them to constants disallows: a) for arrays operations that change their size b) for dictionaries also operations that change values for keys
let noSizeChangeAllowed = ["foo", "bar"]
noSizeChangeAllowed[0] = "baz"
//not allowed:
//noSizeChangeAllowed.append("foofoo")

// Not really specific to collections, but noteworthy here: The language also supports ranges.
[0,1,2,3,4,5][1..3] //the range for indices in [1,3[
[0,1,2,3,4,5][1...3] //the range for indices in [1,3]

// Collections can be iterated using for-in loops
for elem in myArray {
    elem
}

// And, nice!, with indices if you wrap it using the enumerate function.
for (index, elem) in enumerate(myArray) {
    index
    elem
}

// Same works for Dictionary and its key-values
for (key, value) in myDict {
    key
    value
}