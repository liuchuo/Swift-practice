//: Playground - noun: a place where people can play

import UIKit

enum Account {
    case wo
    case shi
    case sha
    case bi
    
    static var interestRate : Double = 0.668
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}
