//: Playground - noun: a place where people can play

import UIKit
//fallthrough语句
var j = 1
var x = 4
switch x {
case 1:
    j++
    println("\(j)")
case 4:
    j++
    println("\(j)")
    fallthrough
case 5:
    j++
    println("\(j)")
case 6:
    j++
    println("\(j)")
    fallthrough
default:
    j++
    println("\(j)")
}
//case每个分支相当于每句话加了个隐形break
//fallthrough能进入下一句~