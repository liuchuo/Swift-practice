//: Playground - noun: a place where people can play

import UIKit
//数组声明
//var studentList1: Array<String> = ["张三","李四","王五","董六"]
//var studentList2: [String] = ["张三","李四","王五","董六"]
//let studentList3: [String] = ["张三","李四","王五","董六"]
//var studentList4: [String]()
//数组的修改
var studentList: [String] = ["张三","李四","王五"]
println(studentList)

studentList.append("董六~")
println(studentList)

studentList += ["刘备","关羽~"]
println(studentList)

studentList.insert("张飞",atIndex:studentList.count)
println(studentList)

let removeStudent = studentList.removeAtIndex(0)
println(studentList)

studentList[0] = "诸葛亮"
println(studentList)
