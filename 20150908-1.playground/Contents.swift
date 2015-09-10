import Foundation

var intSwift = 89
var intNumber = NSNumber(integer : intSwift)
var floatNumber = NSNumber(double : 80.00)

if intNumber.isEqualToNumber(floatNumber) == true {
    NSLog("相等")
} else {
    NSLog("不相等")
}

switch intNumber.compare(floatNumber) {
    case .OrderedAscending :
        NSLog("第一个数小于第二个数~~~")
    case .OrderedDescending :
        NSLog("第一个数大于第二个数~~~")
    case .OrderedSame :
        NSLog("第一个数等于第二个数~")
    
}

