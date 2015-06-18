//: Playground - noun: a place where people can play

import UIKit

//类和结构体定义
class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String?
    var salary : Double = 0
    var dept : Department?
}

struct Department {
    var no : Int = 0
    var name : String = ""
}

//实例化
var emp = Employee()
var dept = Department()
