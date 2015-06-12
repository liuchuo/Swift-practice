//: Playground - noun: a place where people can play

import UIKit

//参数的传递引用
func increment(inout value:Double,amount:Double = 1.0) {
    value += amount
}
var value : Double = 10.0

increment(&value)
println(value)

increment(&value, amount: 100.0)
println(value)
