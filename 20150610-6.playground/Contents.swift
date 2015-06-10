//: Playground - noun: a place where people can play
//使用函数_传递函数
import UIKit
func rectangleArea(width : Double , height : Double) -> Double {
    let area = width * height
    return area
}

println("320x480的长方形面积为:\(rectangleArea(320,480))")


func rectangleArea1(W width : Double , H height : Double) -> Double {
    let area = width * height
    return area
}

println("320x480的长方形面积为:\(rectangleArea1(W:320,H:480))")


func rectangleArea2(#width : Double , #height : Double) -> Double {
    let area = width * height
    return area
}

println("320x480的长方形面积为:\(rectangleArea2(width : 320,height : 480))")

