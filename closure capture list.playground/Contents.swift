//: Example 1
//no capture list
var i = 25
var closure = {print(i)}    //no capture list
i = 35
closure()
////will print 35


//: Example 2
var j = 25
var closure2 = {[j] in print(j)}    //with capture list
j = 35
closure2()

//will print 25
