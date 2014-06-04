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