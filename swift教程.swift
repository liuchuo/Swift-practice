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
let http404Error = (404, "Not Found")或者：
let http404Error = (statusCode: 404, description: "OK")

两种提取元组中元素的方法：
1. 
let (statusCode, statusMessage) = http404Error
print("the status codes is \(statusCode), the status message is \(statusMessage)")
注意，可以只需要其中一部分的值，不需要的值可用_代替，如：
let (statusCode, _) = http404Error

2.print("the status code is \(http404Error.0), the statue message is \(http404Error.1)")


//可选类型
Swift的nil和Objective-C的nil的区别：在Objective-C中，nil是一个指向不存在对象的指针。而在Swift中，nil不是指针，它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。

强制解析：当你确定可选类型确实包含值后，可以再可选名字后面加！来获取值，这个！表示我知道这个可选有值，请使用它。
if convertedNumber != nil {
    print("it is \(convertedNumber!).")
} else {
    print("～～")
}

也可以这样写，使用可选绑定来判断可选类型是否包含值，如果包含就把值赋给一个临时变量或者变量。
if let actualNumber = Int(possibleNumber) {
    print("actualNumber is \(actualNumber)")
}
这样转换成功的话actualNumber就能在if下面语句中用，这时候就可以不用写actualNumber的!啦～

//隐式解析可选类型
当可选类型第一次赋值后就可以确定之后一定有值的时候，隐式解析可选类型可以定义时把后面的问号改成感叹号，来声明一个隐式解析可选类型，后面使用它时候就不需要强制拆封了
let possibleString: String! = "djskfjls"
let aString: String = possiableString


// 错误处理












