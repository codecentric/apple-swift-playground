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