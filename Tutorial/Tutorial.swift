/* NOTE: This file just contains the contents of all smaller files in this directory, for your convenience. */

/*
 * A small tutorial showing of some of the features and syntax of swift without requiring you
 * read the whole documentation while still getting what it's like.
 */

// A swift file has a global scope and will just run whatever you put in it. No main() required.

println("Hello from codecentric!") //No semicolons
print("unless you want to "); print("make two statements in one line.\n")
/* Variables and Constants */

// There are variables and constants, declared by var and let
var myVariable = 0;
let myConstant = 3.1415;

// The language has strict type safety but also smart type inference. If you don't provide evidence for types you have to specify them.

var myString: String

// Type conversions are working as expected, and can be explicated - sometimes must be. Don't be fooled by the playground values, they are rounded for floating point numbers.

var intPlusDouble = 3 + 0.1415;
var asInt = Int(intPlusDouble)
// This won't work, might be unexpected:
//var intVarPlusDouble = asInt + 0.1415
// Explicate the type conversion:
var intVarPlusDouble = Double(asInt) + 0.1415

var integerDivision = 3 / 2
var doubleModulus = 2.5 % 2 // You don't get this everywhere: 2.5 = 2 * 1 + 0.5
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
/* Handling of nil (or null) - Optionals */

// This is a fundamental design decision. You can only assign nil to "optionals". Everything else is guaranteed to be a valid object. nil also is not a pointer to nothing it an alias for "this is not a valid object"

var canNotAssignNil: String
// This won't work:
//canNotAssignNil = nil

// If you want your object to being able to contain a nil value use the optional type version which is explicated by having an added question mark.
var mightBeNil: String?
mightBeNil = nil
mightBeNil = "foo"

// If you want to call methods on optionals you can use the question mark again to "try" to call the method. If the variable contains nil. The whole expression is nil and everything after the question mark is ignored.
mightBeNil?.uppercaseString
mightBeNil = nil
mightBeNil?.uppercaseString //<- no error here

// nil values evaluates to false in control statements.
if mightBeNil {
    "not nil"
} else {
    "nil"
}

// A method that requires a String as parameter does not accept an optional String:
//"foo".hasPrefix(mightBeNil)
// You have to take care of the nil handling and make the optional an "implicitly unwrapped optional" by using an exclamation mark if you are sure that the value is not nil.
mightBeNil = "f"
"foo".hasPrefix(mightBeNil!)
/* Operators */

// Everything is here just as you would expect from other languages, so no details needed. Also, you can declare your own operators.
var i = 0
i++
i
++i

/* Control Flow */

// Everything here as you would expect, so not a lot of details needed.
if i == 2 {
    "yes, i is 2"
}
else if i == 3 {
    "no, i is 3"
}
else {
    "or something entirely different"
}

while i < 10 {
    i++
}

do {
  i++
} while i < 20

for i = 0; i < 10; i++ {
    i
}

// The switch structure is pretty extensive and has nice additions such as a where conditional or special semantics for tuples. Not going into detail here to keep it short.
switch i {
case 10: "switch with implicit break after each case"
case 11: "you are not coming here if i is 10"
default: "you *must* provide a default case"
}
/* Functions */

func foo(myParam: String, myOtherParam: Int) -> String {
    // Strings, by the way, allow a quick template style syntax by putting values in \() structures.
    return "myParam: \(myParam), myOtherParam: \(myOtherParam)"
}

// This looks familiar
foo("bar", 123)

// You can also make parameters named to make their purpose clear. If your internal name is already good enough, add a # before the name or provide your own by writing it in front of the internal name.
func devide(#dividend: Int, by denominator: Int) -> Double {
    return Double(dividend) / Double(denominator);
}

devide(dividend: 1, by: 2)

// By default the parameters inside a function are constants. You can modify this behavior by using the var keyword. There is also an inout keyword available for side effects you wish to create. Not going into detail here.
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
/* Classes, Structures and Objects */

// Basically there is two types of "class"-like structures. struct and class. The first one is a value type, which is copied (passed by value) while the second is passed by reference. Aside from that classes also allow (single class) inheritance, type casting and inspection at runtime and deinitialization, which structs don't. The name instance is used to refer to a realization of either.


class Point {
    // Instance variables or constants are called properties:
    var x: Double //variable
    let y: Double //constant
    
    // "Constructors" are special kinds of methods that need to initialize all variables (and constants) to valid values, they are named *init*, you can provide defaults directly after their declaration. You *must* provide initializers or provide default values when declaring properties to get default initializers synthesized.
    init() {
        x = 0.0;
        y = 0.0;
    }
    
    init(x: Double, y: Double) {
        self.x = x // Use self for self reference and dot syntax for access.
        self.y = y
    }
    
    // Methods have the same syntax as functions.
    func tupelRepresentation() -> (Double, Double) {
        return (x, y)
    }
}

// Generate new instances "java-like" with () syntax but without a new keyword. Also no "alloc"-ation needed.
var myPoint = Point()
var anotherPoint = Point(x: 1.0, y: 1.0)

// A bit odd, there are no access control mechanism such as private or protected, access properties and methods
myPoint.x = 42.0
myPoint.tupelRepresentation()

var referenceToMyPoint = myPoint
referenceToMyPoint.x = 3.0
myPoint // Note how myPoint reflects the change.

struct StructPoint {
    var x = 0.0
    var y = 0.0
    var refToPoint: Point? = nil
}

var myStructPoint = StructPoint() // Note default initializer that got synthesized.
var anotherStructPoint = myStructPoint
anotherStructPoint.x = 1.0
myStructPoint //Note that the original didn't get changed.

// Copies of struct members are done according to their type. With reference type objects, just the reference is copies just as you would expect.
myStructPoint.refToPoint = myPoint
var yetAnotherStructPoint = myStructPoint //struct gets copied
myPoint.x = 23.0
// Both structs reflect the change as they reference the same Point object
myStructPoint.refToPoint
yetAnotherStructPoint.refToPoint


// There are other property mechanisms that we won't cover here, such as computed properties with custom getters and setters as well as observers for property changes. Please see the docs for that.
/* Inheritance, Protocols and Extensions */

// Classes can inherit from one other class and conform to many Protocols (implement Interfaces, in Java-speak) while their functionality can be extended later using Extensions.

class Person {
    let name = "John"
    
    func hello() -> String {
        return "Hello, I am " + name
    }
}

// Inheritance is denoted with a colon following the base class.
class Programmer: Person {
    let favoriteProgrammingLanguage = "Swift"
   
    // You inherit all properties and access to them, as well as (non final marked) methods but never initializers.
    
    // If you want to override functions you have to explicate this using the override keyword.
    override func hello() -> String {
        // Access to overridden properties, initializers and methods is provided using the super keyword.
        return super.hello() + " and I love to code in " + favoriteProgrammingLanguage
    }
    
}

var myProgrammer = Programmer()
myProgrammer.name
myProgrammer.hello()

// We follow the Liskov substitution principle
var myPerson: Programmer
myPerson = myProgrammer
myPerson

// ... and have dynamic method binding just as eg. in Java
myPerson.hello()

// Extensions provide a means to extends classes after they have been written (or even compiled).
extension Programmer {
    
    // Extensions can add a multitude of things to classes, eg. new methods or even initializers.
    func shoutout() -> String {
        return favoriteProgrammingLanguage + " rules!"
    }
    
}

// You can use the extension even for objects that have already been created.
myProgrammer.shoutout()

// A Protocol defines methods or requirements a classes can conform to. They can define requirements such as methods, properties or even operators.
protocol Shouting {
    func shout() -> String
}

// Protocols a class conforms to are added right after the (optional) base class it inherits from.
class ShoutingProgrammer: Programmer, Shouting {
    func shout() -> String {
        return self.shoutout()
    }
}

// As expected, you can use protocols as variable (or constant) types
var somoneWhoCanShout: Shouting
somoneWhoCanShout = ShoutingProgrammer()
somoneWhoCanShout.shout()

// Interestingly, you can use extensions to make existing classes conform to protocols. However, at the time of this writing, this results in an error message in the playground. (See "The Swift Programming Language", p. 560)
/*
extension Programmer: Shouting {
    func shout() -> String {
        return self.shoutout()
    }
}

somoneWhoCanShout = myProgrammer
somoneWhoCanShout.shout()
*/
