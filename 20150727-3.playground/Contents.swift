//: Playground - noun: a place where people can play

import UIKit

class Employee {
    var no : Int = 0
    
    var name : String = "Tony" {
        willSet(newNameValue) {
            println("员工name新值：\(newNameValue)")
        }
        didSet(oldNameValue) {
            println("员工name旧值：\(oldNameValue)")
        }
    }
    
    var job : String?
    var salary : Double = 0
    var dept : Department?
}

struct Department {
    var no : Int = 10 {
        willSet {
            println("部门编号新值\(newValue)")
        }
        didSet {
            println("部门编号旧值\(oldValue)")
        }
    }
    var name : String = "RESEARCH"
}

var emp = Employee()
emp.no = 100
emp.name = "smith"

var dept = Department()
dept.no = 30


