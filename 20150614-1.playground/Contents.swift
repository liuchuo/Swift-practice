//: Playground - noun: a place where people can play

import UIKit

//把函数类型作为另一个函数的返回类型使用
func rectangleArea(width : Double , height : Double) -> Double {
    let area = width * height
    return area
}

func triangleArea(bottom : Double , height : Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}

func getArea(type : String) -> (Double , Double) -> Double {
    var returnFunction : (Double , Double) -> Double
    switch (type) {
    case "rect" :
        returnFunction = rectangleArea
    case "tria" :
        returnFunction = triangleArea
    default :
        returnFunction = rectangleArea
    }
    return returnFunction
}

var area : (Double , Double) -> Double = getArea("tria")
println("底10 高15，三角形面积：\(area(10,15))")

area = getArea("rect")
println("宽10 高15，计算长方形面积：\(area(10,15))")
