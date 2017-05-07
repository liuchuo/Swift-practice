//: Playground - noun: a place where people can play

import UIKit

// 简单输出
print("hello, world")
// print可以自定义连接符或者自定义结束符
print(1, 2, 3, 4, separator: "-")
print(1, 2, 3, 4, terminator: "")
print(1, 2, 3, 4, separator: "->", terminator: "->End\n")


// let声明常量，var声明变量
let myConstant = 11

var myVariable1 = 42
myVariable1 = 56


// 可以让编译器推断常量或者变量的类型，也可以自己显式指定
var myVariable2:Double = 6


// 值永远的不会被显式转换为其他类型，必须显式转换
let string1 = "the label is"
let integer1 = 94
let string2 = string1 + String(integer1)

// 把值转换为字符串的另一种写法
let string3 = "the label is \(integer1)"


// 数组和字典都是用[]创建
var list1 = ["apple", "banana", "orange"]
list1[2] = "pear"

var dic = ["class": "2班", "grade": "1年级"]
dic["class"] = "3班"

// 创建一个空数组或者字典
let emptyArray = [String]()
let emptyDictionary = [String: Float]()


// 如果数组或者字典的类型已经被推断出来，就可以用[]或者[:]清空数组或者字典
list1 = []
dic = [:]


// for和if后面的条件小括号可以省略，但是语句的大括号不能省略
// Swift3中已经不支持++和--，只能 += 1和 -= 1
// if中必须是布尔表达式，不会隐形和0比较
let list2 = [1, 2, 3, 4]
var cnt = 0
for tempitem in list2 {
    if tempitem < 3 {
        cnt += 1
    } else {
        cnt -= 1
    }
}


// 用if和let处理值缺失的情况(用可选值)
// 如果变量的可选值是nil，条件会判断为false，大括号内的语句不会被执行
var optionalName: String? = nil
if let name = optionalName {
    print("hello, \(name)")
}


// ?可以规避实例为nil时，调用实例方法报错的现象，因为当实例为nil时候，因为实例是可选类型，所以语句会直接忽略后面的不再执行，故而不会出现异常（也就是说?前面的值为nil时，?后面的操作会被全部忽略）
// nil不可以用在不是可选值的常量或者变量中，如果一个常量或者变量可能会没有值，那就必须声明为可选值
// 如果声明了可选值但是没有初始化，它的默认值为nil，如果不是可选值，且没有初始化，可以定义，但是必须初始化后才能使用
var myValue: String? = nil


// 如果我们非常确定一个可选值一定有值的话，我们可以用"!"对它进行强制拆包
var myValue2: String? = "hello, everyone!"
print(myValue2!)


// 另一种处理可选值的方法是通过使用??操作符来提供一个默认值，如果不加??，该变量会输出nil
let nickName: String? = nil
let fullName: String = "John"
print("Hi, \(nickName ?? fullName)")


// switch和case支持任何类型的数据，还支持以下方式：
let vegetable = "red pepper"
switch vegetable {
    case "apple":
        print("1")
    case "banana", "orange":
        print("2")
    case let x where x.hasSuffix("pepper"):
        print("It is a \(x)")
    default:
        print("~~~")
}
// switch语句必须要写default语句，匹配成功后就会退出switch语句，不会继续执行，所以不需要写break


// 使用for-in遍历字典，用两个变量来表示每个键值对，字典里面是一个无序的集合
let dic2 = [
    "apple": [1, 2, 3],
    "orange": [7, 10, 11]
]
for (key, values) in dic2 {
    for value in values {
        if value > 0 {
            //balabala...
        }
    }
}


// 使用while或者repeat while语句
var n = 2
while n < 100 {
    n = n * 2
}
repeat {
    n = n / 2;
} while n > 20


// 使用..<表示范围，不包含上界，包含上界用...
// 如果不希望print换行就写 print("\(i) ", terminator: "")
for i in 0..<4 {
    print("\(i) ", terminator: "")
}
for j in 0...4 {
    print(j)
}


// 使用func声明函数，使用->指定返回值的类型
func greet(person: String, day: String) -> String {
    return "Hi, \(person), today is \(day)"
}


// 我们在写函数的时候，如果不提供参数的标签，那么参数的标签就是参数的名字，我们可以在参数名称前面加上自己想要的文字作为函数的参数标签，如果我们不想使用参数标签的话我们可以在参数名称前面加上"_"
// 下面三个语句，分别使用自定义标签、参数名称以及不使用标签
func myfunc1(name: String, Address adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}
func myfunc2(name: String, adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}
func myfunc3( _ name: String, _ adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}

myfunc1(name: "John", Address: "1234")
myfunc2(name: "John", adr: "1234")
myfunc3("John", "1234")


// 二进制、八进制、十进制、十六进制
var a1 = 0b100 // 4
var a2 = 0o100 // 64
var a3 = 100 // 100
var a4 = 0x100 // 256
// 十进制指数
var a5 = 1.25e-2 // 0.0125


// 元组：可以将多个类型的值聚合起来: 
// 注意！元组是用小括号括起来的
let tuples1 = ("John", 21, 1.78)

// 如果想要分解元组可以这样：
let (name, age, height) = tuples1
print("my name is \(name), my age is \(age), my height is \(height)")

// 如果说只想用name可以用下划线代替想要忽略的值，只指定name变量
let (name2, _, _) = tuples1
print("my name is \(name2)!~~~")

// 元组可以使用类似下标的形式访问
print("my name is \(tuples1.0) and my age is \(tuples1.1)")

// 也可以给元组定义标签，这样就可以直接使用标签的名字进行访问啦
let tuples2 = (name: "TomCat", age:"22")
print("hello, my name is \(tuples2.name) and my age is \(tuples2.age)")


// 可以用元组来让一个函数返回多个值
func myfunc4(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[1]
    var sum = 0
    // balabala...
    return (min, max, sum)
}


// 函数可以带有可变个数的参数
func func8(arr: Int...) -> Int {
    var sum = 0
    for number in arr {
        sum += number
    }
    return sum
}
func8()
func8(arr: 1, 2, 3)


// 函数可以嵌套，被嵌套的函数可以访问外侧函数的变量
func func5() -> Int {
    var y = 10
    func add() {
        y += 20
    }
    add()
    return y
}


// 函数可以作为返回值
func func6() -> ((Int) -> Int) {
    func func7(number: Int) -> Int {
        return 1 + number
    }
    return func7
}

var value6 = func6()
print(value6(7))


// 函数可以作为参数
func func9(arr: [Int], condition: (Int) -> Bool) -> Bool {
    for item in arr {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
func9(arr: numbers, condition: lessThanTen)


// 
