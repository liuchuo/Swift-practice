//: Playground - noun: a place where people can play

import UIKit
//数组遍历
var studentList:[String] = ["张三","李四","王五"]
for item in studentList {
    println(item)
}

for(index,value) in enumerate(studentList) {
    println("Item \(index + 1) : \(value)")
}

//index value item  these can be changed
