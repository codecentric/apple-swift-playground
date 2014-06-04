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