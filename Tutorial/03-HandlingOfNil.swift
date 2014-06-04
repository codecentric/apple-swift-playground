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