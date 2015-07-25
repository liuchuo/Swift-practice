//: Playground - noun: a place where people can play

import UIKit
//lazy 延迟存储属性
class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String?
    var salary : Double = 0
    lazy var dept : Department = Department()
}
struct Department {
    let no : Int = 0
    var name : String = ""
}

let emp = Employee()

