//: Playground - noun: a place where people can play
//可选链~
import UIKit
//class Employee {
//    var no : Int = 0
//    var name : String = ""
//    var job : String = ""
//    var salary : Double = 0
//    var dept : Department?
//    
//    struct Department {
//        var no : Int = 11
//        var name : String = "Sales~~~~"
//    }
//}
//
//var emp = Employee()
//
//println(emp.dept?.name)

class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String = ""
    var salary : Double = 0
    var dept : Department? = Department()
    
    struct Department {
        var no : Int = 11
        var name : String = "Sales~~~~"
    }
}

var emp = Employee()

println(emp.dept?.name)
//optional("Sales~~~~")
println(emp.dept!.name)
//"Sales~~~~"