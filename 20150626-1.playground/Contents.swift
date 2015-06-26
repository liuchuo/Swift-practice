//: Playground - noun: a place where people can play

import UIKit

//元组类型的访问级别，遵循元组中字段最低级的访问级别
private class Employee {
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

private let emp = Employee()
var dept = Department()

private var student1 = (dept,emp)
//因为字段dept和emp的最低访问级别是private 所以student1访问级别也是private 符合统一性原则

//枚举类型的访问级别继承自该枚举，因此我们不能为枚举中的成员指定访问级别
public enum WeekDays {
    case Monday
    case Tuesday
    case Wednsday
    case Thursday
    case Friday
}
//由于WeekDays枚举类型是public访问级别，因而它的成员也是public级别