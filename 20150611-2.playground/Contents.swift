//: Playground - noun: a place where people can play
//汉诺塔问题
import UIKit
func hanoi(N:Int,A:Character,B:Character,C:Character) {
    if(N == 1) {
        println("移动盘子\(N)从\(A)到\(C)\n")
    }
    else {
        hanoi(N-1,A,C,B)
        println("移动盘子\(N)从\(A)到\(C)\n")
        hanoi(N-1,B,A,C)
    }
}
println("4个盘子移动：\n")
hanoi(4, "A","B","C")