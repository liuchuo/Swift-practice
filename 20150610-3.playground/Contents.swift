//: Playground - noun: a place where people can play

import UIKit
//字典的声明与初始化
var studentDictionary1: Dictionary<Int,String> = [102 : "张三",105 : "李四",109 : "王五"]
var studentDictionary2 = [102 : "张三",105 : "李四",109 : "王五"]
let studentDictionary3 = [102 : "张三",105 : "李四",109 : "王五"]
var studentDictionary4 = Dictionary<Int,String>()

//字典的修改
var studentDictionary = [102 : "张三",105 : "李四",109 : "王五"]
println("现在的人数: \(studentDictionary.count)")

println("--遍历键--")
for studentID in studentDictionary.keys {
    println("学号 \(studentID)")
}
studentDictionary[110] = "董六~"
println("班级人数：\(studentDictionary.count)")

let dismissStudent = studentDictionary.removeValueForKey(102)
println("开除的学生: \(dismissStudent)")
println("现在的人数: \(studentDictionary.count)")

studentDictionary[105] = nil
println("现在的人数: \(studentDictionary.count)")

println("--遍历键--")
for studentID in studentDictionary.keys {
    println("学号 \(studentID)")
}

studentDictionary[109] = "张三~"
println("现在的人数: \(studentDictionary.count)")

let replaceStudent = studentDictionary.updateValue("李四", forKey: 109)
println("现在的人数: \(studentDictionary.count)")
println("被替换的学生是：\(replaceStudent)")

//字典遍历
var stuDictionary = [2:"小欣欣",39:"小恺垣",45:"小珠珠"]

println("--遍历键--")
for studentID in stuDictionary.keys {
    println("学号 \(studentID)")
}

println("--遍历值--")
for studentName in stuDictionary.values {
    println("学生 \(studentName)")
}

println("--遍历键：值")
for (studentId,studentName) in stuDictionary {
    println("\(studentId) : \(studentName)")
}