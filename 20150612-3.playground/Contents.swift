//: Playground - noun: a place where people can play

import UIKit

//函数返回值
//1.无返回值
func increment(inout value : Double,amount : Double = 1.0) {
    value += amount
}

func increment1(inout value : Double,amount : Double = 1.0) ->() {
    value += amount
}

func increment2(inout value : Double,amount : Double = 1.0) ->Void {
    value += amount
}

//2.一个返回值

//3.多个返回值 1、多个参数声明为引用类型传递 2、将返回定义为元组类型
func position(dt : Double,speed : (x : Int,y : Int)) -> (x : Int,y : Int) {
    var posx : Int = speed.x * Int(dt)
    var posy : Int = speed.y * Int(dt)
    return (posx,posy)
}
let move = position(60.0, (10,-5))
println("物体位移: \(move.x),\(move.y)")
