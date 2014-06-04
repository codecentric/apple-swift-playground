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