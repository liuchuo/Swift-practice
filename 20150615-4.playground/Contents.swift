//: Playground - noun: a place where people can play

import UIKit

//闭包
//引子
func calculate(opr : String) -> (Int , Int) -> Int {
    func add(a : Int , b : Int) -> Int {
        return a + b
    }
    func sub(a : Int , b : Int) -> Int {
        return a - b
    }
    var result : (Int , Int) -> Int
    
    switch(opr) {
    case "+" :
        result = add
    case "-" :
        result = sub
    default :
        result = add
    }
    return result
}

let f1 : (Int , Int) -> Int = calculate("+")
println("10 + 5 = \(f1(10 , 5))")

let f2 : (Int , Int) -> Int = calculate("-")
println("10 - 5 = \(f2(10 , 5))")


//闭包的概念
func calculate(opr : String) -> (Int , Int) -> Int {
    var result : (Int , Int) -> Int
    switch(opr) {
    case "+" :
        result = {(a : Int , b : Int) -> Int in
            return a + b
        }
    default :
        result = {(a : Int , b : Int) -> Int in
            return a - b
        }
    }
    return result
}

let f1 : (Int , Int) -> Int = calculate("+")
println("10 + 5 = \(f1(10,5))")

let f2 : (Int , Int) -> Int = calculate("-")
println("10 - 5 = \(f2(10,5))")

{(a : Int , b : Int) -> Int in return a + b}
{(a : Int , b : Int) -> Int in return a - b}
//    简化为{a , b in return a + b}

//使用闭包表达式-1.类型推断简化
func calculate(opr : String) -> (Int , Int) -> Int {
    var result : (Int , Int) -> Int
    switch(opr) {
    case "+" :
        result = {a , b in return a + b}
    default :
        result = {a , b in return a - b}
    }
    return result
}
let f1 : (Int , Int) -> Int = calculate("+")
println("10 + 5 = \(f1(10 , 5))")

let f2 : (Int , Int) -> Int = calculate("-")
println("10 - 5 = \(f2(10 , 5))")

//-2.隐藏return关键字
//闭包内部语句只有1条语句时 ：{a , b in a + b}
func calculate(opr : String) -> (Int , Int) -> Int {
    var result : (Int , Int) -> Int
    switch(opr) {
    case "+" :
        result = {a , b in a + b}
    default :
        result = {a , b in a - b}
    }
    return result
}

let f1 : (Int , Int) -> Int = calculate("+")
println("10 + 5 = \(f1(10 , 5))")

let f2 : (Int , Int) -> Int = calculate("-")
println("10 - 5 = \(f2(10 , 5))")













