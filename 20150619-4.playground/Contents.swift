//: Playground - noun: a place where people can play

import UIKit
//可选类型与可选链（那些“?”和“!”）= 可选类型、可选绑定、强制拆封、隐式拆封
func divide(n1 : Int , n2 : Int) -> Double? {
    if n2 == 0 {
        return nil
    } else {
        return Double(n1) / Double(n2)
    }
}

//1.可选绑定
if let result : Double? = divide(100 , 0) {
    println("success~")
} else {
    println("failure~~")
}

//2.强制拆封
let result1 : Double? = divide(100 , 200)
println(result1!)//结果为：0.5
println(result1)//会出现optional(0.5)

