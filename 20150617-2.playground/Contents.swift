//: Playground - noun: a place where people can play

import UIKit

//枚举-相关值
enum Figure {
    case Rectangle(Int , Int)
    case Circle(Int)
}

func printFigure(figure : Figure) {
    switch figure {
    case .Rectangle(let width , let height) :
        println("矩形的宽:\(width) 高:\(height)")
    case .Circle(let radius) :
        println("圆形的半径:\(radius)")
    }
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)

//枚举类型中的相关值类似于C中的联合类型。