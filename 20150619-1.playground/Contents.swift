//: Playground - noun: a place where people can play

import UIKit

//结构体与类-再谈值类型和引用类型
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

var dept = Department()
dept.no = 10
dept.name = "Sales"

var emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Salesman"
emp.salary = 1250
emp.dept = dept

func updateDept(inout dept : Department) {
    dept.name = "Research"
}

println("Department更新前:\(dept.name)")
updateDept(&dept)
println("Department更新后:\(dept.name)")

func updateEmp(emp : Employee) {
    emp.job = "Clerk"
}

println("Employee更新前:\(emp.job)")
updateEmp(emp)
println("Employee更新后:\(emp.job)")

//说明了结构体是值类型，类是引用类型