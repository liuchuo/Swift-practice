//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//只读计算属性
class Employee {
    var no : Int = 0
    var firstName : String = "chen"
    var lastName : String = "xin"
    var job : String?
    var salary : Double = 0
    lazy var dept : Department = Department()
    
    var fullName : String {
        return firstName + "." + lastName
    }
}

struct Department {
    let no : Int = 0
    var name : String = ""
}

var emp = Employee()
println(emp.fullName)
////只读计算属性不仅不用写setter访问器 而且get{}代码也可以省略


//结构体和枚举中的计算属性
struct Department {
    let no : Int = 0
    var name : String = "SALES"
    
    var fullName : String {
        return "Swift." + name + ".D"
    }
}

var dept = Department()
println(dept.fullName)

enum WeekDays : String {
    case Monday = "1"
    case Tuesday = "2"
    case Wednsday = "3"
    case Thursday = "4"
    case Friday = "5"
    
    var message : String {
        return "Today is" + self.rawValue
    }
}

var day = WeekDays.Monday
println(day.message)


