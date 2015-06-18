//: Playground - noun: a place where people can play

import UIKit

var i,j : Int
for i = 1;i <= 4;i++ {
    for j = 1;j <= 4 - i;j++ {
        print(" ")
    }
    for j = 1;j <= 2 * i - 1;j++ {
        print("*")
    }
    println("")
}
print("\(i)")
println("heheda~")
print("\(i)")
//print就是一般的标准输出，但是不换行
//println和print基本没什么差别，就是最后会换行
