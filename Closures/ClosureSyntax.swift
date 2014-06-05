/* 
 * Different kinds of syntax for passing a closure to a function.
 * Provided by aminmeyghani.
 */

// function that takes in a function.
func returnResultOfClosure (a:Int, b:Int, fn:(Int,Int)->Int) -> Int {
    return fn(a,b)
}

// very verbose
var verbose = returnResultOfClosure(1, 5, { (a:Int, b:Int)-> Int in return a+b })
println(verbose)

// you can also provide the closure after the method parentheses if it is the last parameter
var verbose2 = returnResultOfClosure(1, 5) { (a:Int, b:Int)-> Int in return a+b }
println(verbose)

// less verbose
var lessVerbose = returnResultOfClosure(1, 8, { (a:Int, b:Int) in return a+b })
println(lessVerbose)

// less verbose 2
var lessVerbose2 = returnResultOfClosure(1, 3, { (a, b) in return a+b })
println(lessVerbose2)

// less verbose 3
var lessVerbose3 = returnResultOfClosure(1, 15, { (a, b) in a+b })
println(lessVerbose3)

// less verbose 4
var lessVerbose4 = returnResultOfClosure(1, 14, { $0 + $1 })
println(lessVerbose4)

// less verbose 5
var lessVerbose5 = returnResultOfClosure(2, 16, +)
println(lessVerbose5)