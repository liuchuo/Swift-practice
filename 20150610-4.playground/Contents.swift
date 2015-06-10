//: Playground - noun: a place where people can play

import UIKit
//集合的复制
//字典复制
var students = [39 : "小恺垣",2 : "小欣欣"]
var copyStudents = students
copyStudents[39] = "大笨蛋"
for (number,name) in students {
    println("\(number):\(name)")
}
for (number,name) in copyStudents {
    println("\(number):\(name)")
}

//引用
class Employee {
    var name : String
    var salary : Double
    init (n : String) {
        name = n
        salary = 0
    }
}

var emps = Dictionary<String,Employee>()
let emp1 = Employee(n: "Amy Lee")
let emp2 = Employee(n: "Harry Hacker")
emps["144-25-5464"] = emp1
emps["567-24-2546"] = emp2

var copyEmps = emps

let copy : Employee! = copyEmps["567-24-2546"]
copyEmp.name = "Gary Cooper"

let emp : Employee! = emps["567-24-2546"]
println(emp.name)


