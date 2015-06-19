//: Playground - noun: a place where people can play

import UIKit
//引用类型的比较
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

var emp1 = Employee()
emp1.no = 1000
emp1.name = "Martin"
emp1.job = "Salesman"
emp1.salary = 1250

var emp2 = Employee()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Salesman"
emp2.salary = 1250

if emp1 === emp2 {
    println("emp1 === emp2")
}
if emp1 === emp1 {
    println("emp1 === emp1")
}

if emp1 == emp2 {
    println("emp1 == emp2")
}//编译错误。

var dept1 = Department()
dept1.no = 10
dept1.name = "Sales"

var dept2 = Department()
dept2.no = 10
dept2.name = "Sales"

if dept1 === dept2 {
    println("dept1 === dept2")
}//编译错误。===不能用于比较结构体

if dept1 == dept2 {
    println("dept1 == dept2")
}//编译错误。

if dept1.no == dept2.no {
    println("dept1.no == dept.no")
}
// === 只能勇于比较两个引用是否为同一实例 只能用于引用类型 也就是类的实例
