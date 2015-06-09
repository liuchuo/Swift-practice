//: Playground - noun: a place where people can play

import UIKit
//跳转语句_continue
let numbers = [1,2,3,4,5,6,7,8,9,0]
for var i = 0;i < count(numbers);i++ {
    if i == 3 {
        continue
    }
    println("Count is :\(i)")
}

//continue_带label

label1: for var x = 0;x < 5;x++ {
    label2: for var y = 5;y > 0;y-- {
        if y == x {
            continue label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}