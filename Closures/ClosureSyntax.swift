// function that takes in a function.
func makerAdder (a:Int, b:Int, fn:(Int,Int)->Int) -> Int {
  return fn(a,b)
}

// Different kinds of syntax for passing a closure to a function.
// --------------------------
// very verbose
var verbose = makerAdder(1, 5, { (a:Int, b:Int)-> Int in return a+b
  })
println(verbose)

// less verbose
var lessV = makerAdder(1, 8, { (a:Int, b:Int)in return a+b  })
println(lessV)

// less verbose2
var lessV2 = makerAdder(1, 3, { (a, b)in
  return a+b
  })
println(lessV2)

// less verbose3
var lessV3 = makerAdder(1, 15, { (a, b) in a+b  })
println(lessV3)

// less verbose4
var lessV4 = makerAdder(1, 14, { $0 + $1  })
println(lessV4)

// less verbose4
var lessV5 = makerAdder(2, 16, +)
println(lessV5)
