//: Playground - noun: a place where people can play

import UIKit

//泛型和泛型函数
func isEquals<T : Comparable>(a : T , b : T) -> Bool {
    return (a == b)
}

let n1 = 200
let n2 = 100
println(isEquals(n1 , n2))

let s1 = "ABC1"
let s2 = "ABC1"
println(isEquals(s1 , s2))
