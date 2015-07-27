//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Account {
    var amount : Double = 0.0
    var owner : String = ""
    
    static var interestRate : Double = 0.668
    
    static var staticProp : Double {
        return interestRate * 1_000
    }
    
    var instanceProp : Double {
        return Account.interestRate * amount
    }
}
    
println(Account.staticProp)
    
var 😛的Account = Account()
😛的Account.amount = 8
println(😛的Account.instanceProp)
