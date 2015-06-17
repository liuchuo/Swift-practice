//: Playground - noun: a place where people can play

import UIKit
//枚举 - 成员值
enum WeekDays {
    case Monday
    case Tuesday
    case Wednsday
    case Thursday
    case Friday
}

var day = WeekDays.Friday
day = WeekDays.Wednsday
day = .Monday

func writeGreeting(day : WeekDays) {
    switch day {
    case .Monday :
        println("星期一好~")
    case .Tuesday :
        println("星期二好~~")
    case .Wednsday :
        println("星期三好~~")
    case .Thursday :
        println("星期四好~~~")
    case .Friday :
        println("星期五好~~~~")
    }
}
//在switch语句中使用枚举类型可以没有default分支，这在其他类型时是不允许的
writeGreeting(day)
writeGreeting(WeekDays.Friday)

枚举 - 原始值
枚举名+“:”+数据类型
enum WeekDays : Int {
    case Monday = 0
    case Tuesday = 1
    case Wednsday = 2
    case Thursday = 3
    case Friday = 4
}

//enum WeekDays : Int {
//    case Monday = 0,Tuesday,Wednsday,Thursday,Friday
//}
var day = WeekDays.Friday

func writeGreeting(day : WeekDays) {
    switch day {
    case .Monday :
        println("星期一好~")
    case .Tuesday :
        println("星期二好~~")
    case .Wednsday :
        println("星期三好~~")
    case .Thursday :
        println("星期四好~~~")
    case .Friday :
        println("星期五好~~~~")
    }
}

let friday = WeekDays.Friday.rawValue

if let thursday = WeekDays(rawValue : 3) {
    println(thursday.rawValue)
}

if(WeekDays.Friday.rawValue == 4) {
    println("今天是星期五")
}
//toRaw()将成员值转换为原始值，fromRaw()将原始值转换为成员值
//toRaw改为: let friday = WeekDays.Friday.rawValue(取成员的原始值)
//formRaw改为: let thursday = WeekDays(rawValue : 3)(初始化为某成员的成员值)

writeGreeting(day)
writeGreeting(WeekDays.Friday)










