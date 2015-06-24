//: Playground - noun: a place where people can play

import UIKit
//使用访问级别最佳实践
//统一性原则
private class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String?
    var salary : Double = 0
    var dept : Department?
}

internal struct Department {
    var no : Int = 0
    var name : String = ""
}

public let emp = Employee()

public var dept = Department()
/*if a type uses an internal or private type,the constant or variable cannot be declared "public"~*/

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

public func getEmpDept(emp : Employee)-> Department? {
    return emp.dept
}
/*Employee's parameter uses an internal type,so the function getEmpDept cannot be declared public type*/


public class Employee {
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

public func getEmpDept(emp : Employee)-> Department? {
    return emp.dept
}
/*the Department's type of getEmpDept uses an internal type,so the function getEmpDept cannot be declared public*/




