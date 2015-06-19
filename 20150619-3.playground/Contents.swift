//: Playground - noun: a place where people can play

import UIKit
//类型嵌套
//便于我们访问外部类成员，但它会使程序结构变得不清楚，使程序可读性变差
class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String = ""
    var salary : Double = 0
    var dept : Department = Department()
    
    var day : WeekDays = WeekDays.Friday
    
    struct Department {
        var no : Int = 10
        var name : String = "SALES"
    }
    
    enum WeekDays {
        case Monday
        case Tuesday
        case Wednsday
        case Thursday
        case Friday
        
        struct Day {
            static var message : String = "Today is..."
        }
    }
}

var emp = Employee()
println(emp.dept.name)
println(emp.day)

let friday = Employee.WeekDays.Friday
if emp.day == friday {
    println("euqal")
}

println(Employee.WeekDays.Day.message)