//: Playground - noun: a place where people can play

import UIKit

var student1 = ("1001","张三",30,90)
println("学生：\(student1.1) 学号：\(student1.0) 年龄：\(student1.2) 得分：\(student1.3)")

var student2 = (id:"1002",name:"李四",age:32,score:80)
println("学生:\(student2.name) 学号:\(student2.id) 年龄:\(student2.age) 得分:\(student2.score)")

let (id1,name1,age1,score1) = student1
println("学生\(name1) 学号\(id1) 年龄:\(age1) 得分:\(score1)")

let(id2,name2,_,_) = student2
println("\(name1) \(id1) \(name2) \(id2)")

