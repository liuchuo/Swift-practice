//: Playground - noun: a place where people can play

import UIKit

//函数重载
func receive(i : Int) {
    println("接收一个Int类型数据 i = \(i)")
}

func receive(d : Double) {
    println("接收一个Double类型数据 d = \(d)")
}

func receive(x : Int , y : Int) {
    println("接收两个Int类型数据 x = \(x) y = \(y)")
}

func receive(i : Int) -> Int {
    println("接收一个Int类型数据 i = \(i),返回值类型是Int")
    return i * i
}

let a1 : Int = receive(10)
let a2 : () = receive(10)
let a3 : Void = receive(10)
let a4 : () = receive(10.0)
let a5 : () = receive(10,10)