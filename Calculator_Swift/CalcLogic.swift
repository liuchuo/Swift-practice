//
//  CalcLogic.swift
//  Calculator_Swift
//
//  Created by 欣 陈 on 15/9/10.
//  Copyright (c) 2015年 欣 陈. All rights reserved.
//

import Foundation

enum Operator : Int {
    case Plus = 200, Minus, Multiply, Divide
    case Default = 0
}

class CalcLogic {
    //保存上一次的值
    var lastRetainValue : Double
    //最近一次选择的操作符（加、减、乘、除）
    var opr : Operator
    //临时保存MainLabel内容，为true时，输入数字MainLabel内容被清为0
    var isMainLabelTextTemporary : Bool
    
    
    //构造器
    init () {
        println("CalcLogic init")
        lastRetainValue = 0.0
        isMainLabelTextTemporary = false
        opr = .Default
    }
    
    //析构器
    deinit {
        println("CalcLogic deinit")
    }
    
    //更新主标签内容
    func updateMainLabelStringByNumberTag(tag : Int,withMainLabelString mainLabelString : String) -> String {
        var string = mainLabelString
        
        if(isMainLabelTextTemporary) {
            string = "0"
            isMainLabelTextTemporary = false
        }
        
        let optNumber = tag - 100
        //把String转为double
        var mainLabelDouble = (string as NSString).doubleValue
        
        if mainLabelDouble == 0 && doesStringContainDecimal(string) == false {
            return String(optNumber)
        }
        
        let resultString = string + String(optNumber)
        
        return resultString
        
    }
    
    //判断字符串中是否包含小数点
    func doesStringContainDecimal(string : String) -> Bool {
        for ch in string {
            if ch == "." {
                return true
            }
        }
        return false
    }
    
    func calculateByTag(tag : Int,withMainLabelString mainLabelString : String) -> String {
        var currentValue = (mainLabelString as NSString).doubleValue
        

        switch opr {
        case .Plus:
            lastRetainValue += currentValue
        case .Minus:
            lastRetainValue -= currentValue
        case .Multiply:
            lastRetainValue *= currentValue
        case .Divide:
            if currentValue != 0 {
                lastRetainValue /= currentValue
            } else {
                opr = .Default
                isMainLabelTextTemporary = true
                return "错误"
            }
        default:
            lastRetainValue = currentValue
        }
        
        //记录当前操作符，下次计算时使用
        opr = Operator(rawValue : tag)!
        
        let resultString = NSString(format : "%g",lastRetainValue)
        
        isMainLabelTextTemporary = true
        
        return resultString as String
        
    }
    
    
    func clear() {
        lastRetainValue = 0.0
        isMainLabelTextTemporary = false
        opr = .Default
    }
    
    
}

