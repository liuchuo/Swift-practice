//: Playground - noun: a place where people can play

import UIKit
//数组复制
var a = ["张三","李四","王五"]
var b = a
var c = a
a[0] = "董六"
println(a[0])
println(b[0])
println(c[0])


class Employee {
    var name : String
    var salary : Double
    init(n : String) {
        name = n
        salary = 0
    }
}

var emps = Array<Employee>()
let emp1 = Employee(n : "Amy Lee")
let emp2 = Employee(n: "Harry Hacker")
emps.append(emp1)
emps.append(emp2)

var copyEmps = emps

let copyEmp : Employee! = copyEmps[0]
copyEmp.name = "Gary Cooper"

let emp : Employee! = emps[0]
println(emp.name)




