//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let specialCharTab1 = "Hello\tWorld."
println("specialCharTab1:\(specialCharTab1)")

let specialCharNewLine = "Hello\nWorld."
println("specialCharNewLine:\(specialCharNewLine)")

let specialCharReturn = "Hello\rWorld."
println("specialCharReturn:\(specialCharReturn)")

//在时间轴里面不会出现\n\r的输出格式但是在输出框里面会有体现

let 🌎 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐦🐧🐼🐘🐑🐴🐒🐵🐗🐮🐽🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐃🐀🐏🐄🐋🐬🐳🐟🐠🐙🐅"
println("诺亚方舟上的小动物数：\(count(🌎))")

let 熊: Character = "🐻"
let 猫: Character = "🐱"
let 🐼 = 熊 + 猫
//报错

let emptyString1 = ""
let emptyString = String()


