//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let a: Float = 4

let label = "the width is"
let width = 94
let widthLabel = label + String(width)

let name = "chenxin"
var apple = 8.888
print("hi,\(name), i have \(apple) apple")


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

var optionalString: String? = "Hello"
print(optionalString == nil)//返回false 表示optionalString 不等于 nil
var optionalName: String? = nil

var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"



let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
//default:
//    print("Everything tastes good in soup.")
}






