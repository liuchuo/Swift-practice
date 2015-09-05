//: Playground - noun: a place where people can play
// 扩展下标实现访问字符功能
import UIKit
extension String {
    subscript(index : Int) -> String {
        if index > count(self) {
            return ""
        }
        var c : String = ""
        var i = 0
        
        for character in self {
            if(i == index) {
                c = String(character)
                break
            }
            i++
        }
        return c
    }
}

let s = "The quick brown fox jumps over the lazy dog"
println(s[0])

println("ABC"[2])