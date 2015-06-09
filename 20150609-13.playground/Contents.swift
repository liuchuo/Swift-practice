//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//跳转语句
let numbers = [1,2,3,4,5,6,7,8,9,0]
for var i = 0;i < count(numbers);i++ {
    if i == 3 {
        break
    }
    println("Count is :\(i)")
}

//break label
label1: for var x = 0;x < 5;x++ {
    label2: for var y = 5;y > 0;y-- {
        if y == x {
            break label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}
println("Game Over!")