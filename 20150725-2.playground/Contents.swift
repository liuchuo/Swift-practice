//: Playground - noun: a place where people can play

import UIKit

class Employee {
    var no : Int = 0
    var firstname : String = "liu"
    var lastname : String = "chuo"
    var job : String?
    var salary : Double = 0
    lazy var dept : Department = Department()
    
    var fullName : String {
        get {
            return firstname + "." + lastname
        }
        set (newFullName) {
            var name = newFullName.componentsSeparatedByString(".")
            firstname = name[0]
            lastname = name[1]
        }
    }
}
    
    struct Department {
        let no : Int = 0
        var name : String = ""
    }
    var emp = Employee()
    println(emp.fullName)
    
    emp.fullName = "chen.xin"
    println(emp.fullName)
ddd
扥阿凡达