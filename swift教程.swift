//: Playground - noun: a place where people can play

import UIKit
// --------------------Swift教程-------------------------------------------
 要么变量初始化让其可以推断出类型，要么直接指定一个类型，不可以写：
 var a
 这样的语句，会让系统不明白a到底是什么类型的变量


允许嵌套多行注释


可以访问不同整数类型的min和max属性来获取对应类型的最小值和最大值
let minValue = UInt8.min
let maxValue = UInt8.max


二进制数：0b
八进制数：0o
十六进制数：0x


可以添加额外的0或者下划线来增加数值的可读性，并不影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000


如果赋值的数值超过了变量或者敞亮可存储的范围，编译的时候会报错


加号两边的数的类型必须相同，如果不进行类型的转换，无法直接相加
将Double或者Float转化为Int的时候，会截断到整数部分，舍弃小数部分


如果在需要使用Bool类型的地方使用了非布尔值，Swift的类型安全机制会报错
这样能够避免错误并保证这块代码的意图总是清晰的：
if i {

}
//这样的语句不被允许，会报错


元组：把多个值组合成一个复合值，元组内的值可以是任意类型，并不要求是相同类型，常常用作函数的多个返回值组成一个元组返回

















