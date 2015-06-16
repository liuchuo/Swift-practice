//: Playground - noun: a place where people can play

import UIKit

//使用do...while循环计算水仙花数
var i = 100,r = 0,s = 0,t = 0
do {
    r = i / 100
    s = (i - r * 100) / 10
    t = i - r * 100 - s * 10
    if(i == r * r * r + s * s * s + t * t * t) {
        println("i = \(i)")
    }
    i++
}while i < 1000

//使用while循环计算水仙花数
var i = 100,r = 0,s = 0,t = 0
while i < 1000 {
    r = i / 100
    s = (i - r * 100) / 10
    t = i - r * 100 - s * 10
    if(i == r * r * r + s * s * s + t * t * t) {
        println("i = \(i)")
    }
    i++
}

//使用for循环计算水仙花数
var r = 0,s = 0,t = 0
for var i = 100;i < 1000;i++ {
    r = i / 100
    s = (i - r * 100) / 10
    t = i - r * 100 - s * 10
    if(i = r * r * r + s * s * s + t * t * t) {
        println("i = \(i)")
    }
    i++
}


