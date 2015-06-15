//: Playground - noun: a place where people can play

import UIKit

//使用闭包表达式-3.缩写参数名称
func calculate(opr : String) -> (Int , Int) -> Int {
    var result : (Int , Int) -> Int
    switch (opr) {
    case "+" :
        result = {$0 + $1}
    default :
        result = {$0 - $1}
    }
    return result
}
let f1 : (Int , Int) -> Int = calculate("+")
println("10 + 5 = \(f1(10 , 5))")

let f2 : (Int , Int) -> Int = calculate("-")
println("10 - 5 = \(f2(10 , 5))")

//使用闭包表达式-4.使用闭包返回值
let c1 : Int = {(a : Int , b : Int) -> Int in
    return a + b
}(10 , 5)

println("10 + 5 = \(c1)")

let c2 : Int = {(a : Int , b : Int) -> Int in
    return a - b
}(10 , 5)

println("10 - 5 = \(c2)")