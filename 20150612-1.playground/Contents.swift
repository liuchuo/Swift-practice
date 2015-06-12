//: Playground - noun: a place where people can play

import UIKit
//可变函数
func sum(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(100.0,20,30)
sum(30,80)
sum(1,2,3,4,5,6,7,8,9,10)
