//: Playground - noun: a place where people can play

import UIKit

//嵌套函数
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
        result = add//定义外函数的返回值类型为嵌套函数类型
    case "-" :
        result = sub//定义外函数的返回值类型为嵌套函数类型
    default :
        result = add//定义外函数的返回值类型为嵌套函数类型
    }
    return result//定义外函数的返回值类型为嵌套函数类型
}

let f1 : (Int , Int) -> Int = calculate("+")//从而将嵌套函数传递给外函数
println("10 + 5 = \(f1(10 , 5))")

let f2 : (Int , Int) -> Int = calculate("-")//从而将嵌套函数传递给外函数
println("10 - 5 = \(f2(10 , 5))")

//在函数嵌套中，默认情况下嵌套函数的作用域在外函数体内，但我们可以定义外函数的返回值类型为嵌套函数类型，从而将嵌套函数传递给外函数，被其他调用者使用