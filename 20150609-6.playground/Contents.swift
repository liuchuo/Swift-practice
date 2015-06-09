//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let 熊:String = "🐻"
let 猫:String = "🐱"
let 🐼 = 熊 + 猫

if 🐼 == "🐻🐱" {
    println("🐼是🐻🐱")
} else {
    println("🐼不是🐻🐱")
}

let emptyString1 = ""
let emptyString2 = String()

if emptyString1 == emptyString2 {
    println("相等")
} else {
    println("不相等")
}

var 陈恺垣: String = "🐵"
var 渣男: String = "👿"
if 陈恺垣 == 渣男 {
    println("陈恺垣是渣男😒")
} else {
    println("小恺垣是好人😳")
}

let docFolder = [
    "java.docx",
    "JavaBean.docx",
    "Objective-C.xlsx",
    "Swift.docx"
]

var wordDocCount = 0
for doc in docFolder{
    if doc.hasSuffix(".docx"){
        ++wordDocCount
    }
}
println("文件夹中word文档个数是:\(wordDocCount)")

var javaDocCount = 0
for doc in docFolder{
    let lowercaseDoc = doc.lowercaseString
    if lowercaseDoc.hasPrefix("java"){
        ++javaDocCount
    }
}
println("文件夹中java文档个数是:\(javaDocCount)")

























