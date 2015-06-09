//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//分支语句
var score = 95
if score >= 85 {
    println("您真优秀~")
}
if score < 60 {
    println("您需要加倍努力")
}
if score >= 60 && score < 85 {
    println("您的成绩还可以，仍需继续努力~")
}
//比较整数
let testscore = 77
var grade: Character
if testscore >= 90 {
    grade = "A"
} else if testscore >= 80 {
    grade = "B"
} else if testscore >= 70 {
    grade = "C"
} else if testscore >= 60 {
    grade = "D"
} else {
    grade = "E"
}
println("Grade = \(grade)")

let yourscore = 86
var yourgrade: Character
switch yourscore / 10 {
case 9:
    yourgrade = "优"
case 8:
    yourgrade = "良"
case 7,6:
    yourgrade = "中"
default:
    yourgrade = "差"
}
println("Grade = \(yourgrade)")

//比较浮点数
let value = 1.000
var desc: String
switch value {
case 0.0:
    desc = "最小值"
case 0.5:
    desc = "中值"
case 1.0:
    desc = "最大值"
default:
    desc = "其他值"
}
println("啦啦啦 = \(desc)")

//比较字符
let level = "良"
var zifu: String
switch level {
    case "优":
        zifu = "90分以上"
    case "良":
        zifu = "80-90分"
    case "中":
        zifu = "70-80分"
    case "差":
        zifu = "低于70分"
    default:
        zifu = "无法判断"
}
println("\(zifu)")

