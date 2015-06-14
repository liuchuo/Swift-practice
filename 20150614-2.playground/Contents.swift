//: Playground - noun: a place where people can play

import UIKit

//函数类型作为参数类型使用
func rectangleArea(width : Double , height : Double) -> Double {
    let area = width * height
    return area
}

func triangleArea(bottom : Double , height : Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}

func getAreaByFunc(funcName : (Double , Double) -> Double , a : Double , b : Double) -> Double {
    var area = funcName(a , b)
    return area
}

var result : Double = getAreaByFunc(triangleArea , 10 , 15)
println("底10 高15 三角形面积：\(result)")

result = getAreaByFunc(rectangleArea , 10 , 15)
println("宽10 高15，计算长方形面积：\(result)")