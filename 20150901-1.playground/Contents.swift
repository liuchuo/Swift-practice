//: Playground - noun: a place where people can play
//静态方法
//结构体中的静态方法
import UIKit

struct Account {
    var owner : String = "Tony"
    static var interestRate : Double = 0.668
    //静态方法
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
    //实例方法
    func messageWith(amount : Double) -> String {
        var interest = Account.interestBy(amount)
        return "\(self.owner)的利息是\(interest)"
    }
}
//调用静态方法
println(Account.interestBy(10_000.00))
    
var myAccount = Account()
//调用实例方法
println(myAccount.messageWith(10_000.00))

