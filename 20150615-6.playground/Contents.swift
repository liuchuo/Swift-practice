//: Playground - noun: a place where people can play

import UIKit

//使用尾随闭包
func calculate(opr : String , funN : (Int , Int) -> Int) {
    switch (opr) {
    case "+" :
        println("10 + 5 = \(funN(10 , 5))")
    default :
        println("10 - 5 = \(funN(10 , 5))")
    }
}

calculate("+"){(a : Int , b : Int) -> Int in return a + b}
calculate("-"){(a : Int , b : Int) -> Int in return a - b}

