//: Playground - noun: a place where people can play

import UIKit

//for循环
println("n  n*n")
println("---------")
for var i = 1;i < 10;i++ {
    println("\(i)x\(i) = \(i*i)")
}

var x:Int32
var y:Int32
for x = 0,y = 10;x < y;x++,y-- {
    println("(x,y) = (\(x),\(y))")
}

//for in 循环 用来遍历集合的for循环
let numbers = [2,6,3,12,2,88,97,98,69,100]
for item in numbers {
    println("Count is:\(item)")
}