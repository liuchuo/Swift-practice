//
//  main.swift
//  20150908-2
//
//  Created by 欣 陈 on 15/9/8.
//  Copyright (c) 2015年 欣 陈. All rights reserved.
//

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
