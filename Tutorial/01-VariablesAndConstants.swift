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