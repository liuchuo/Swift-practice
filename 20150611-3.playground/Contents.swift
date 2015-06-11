//: Playground - noun: a place where people can play

import UIKit

//参数默认值
func makecoffee(type : String = "卡布基诺") -> String {
    return "制作一杯\(type)咖啡"
}

let coffee1 = makecoffee(type: "拿铁")
let coffee2 = makecoffee()
//为具有默认值的参数添加外部参数名 用_后 当我们调用该函数的时候，不需要提供第二个参数的外部参数名

func CircleArea(R radius : Double = 30,_ pi : Double = 3.14) -> Double {
    let area = radius * radius * pi
    return area
}
println("圆面积: \(CircleArea(R : 50,3.1415926))")


