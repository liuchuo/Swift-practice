//: Playground - noun: a place where people can play

import UIKit

//捕获上下文中的变量和常量
func makeArray() -> (String) ->[String] {
    var ary : [String] = [String]()
    func addElement(element : String) -> [String] {
        ary.append(element)
        return ary
    }
    return addElement
}

let f1 = makeArray()
println("---f1---")
println(f1("张三"))
println(f1("李四"))
println(f1("whwu"))

let f2 = makeArray()
println("---f2---")
println(f2("刘备"))
println(f2("张飞"))
println(f2("gryu~"))
