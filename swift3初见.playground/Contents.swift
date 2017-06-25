//: Playground - noun: a place where people can play

import UIKit


// -----------------------Swift初见--------------------------------------
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


// 值永远的不会被隐式转换为其他类型，必须显式转换
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
// if中必须是布尔表达式，不会隐性和0比较
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
print("Hi, \(nickName ?? fullName)")  //此时会输出"Hi, John\n"


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
// switch语句必须要写default语句，不需要写break语句，因为它匹配成功后就会退出switch语句，不会继续执行


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


// 不包含上界用..<  包含上界用...
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

// 内部使用的时候采用参数名称（内部参数名）
func myfunc1(name: String, Address adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}
func myfunc2(name: String, adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}
func myfunc3( _ name: String, _ adr: String) -> Void {
    print("My name is \(name), my address is \(adr)")
}

// 外部调用的时候使用的是参数标签名（外部参数名）
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


// 闭包
// 函数实际上是一种特殊的闭包，它是一段之后能够被调取的代码
// 可以使用{}创建一个匿名闭包，使用in将参数和返回值类型声明与闭包函数体进行分离
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// 更简洁的写法：如果一个闭包的类型已知，比如作为一个回调函数，就可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当作结果返回
let value7 = numbers.map({number in 3 * number})
print(value7)

// 可以通过参数的位置而不是参数名字来引用参数
// 如果一个闭包是作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面
// 当一个闭包是传给函数的唯一参数，可以完全忽略括号
let arr2 = numbers.sorted { $0 > $1 }
print(arr2)


// 使用class来创建一个类
// 使用一个构造函数来初始化类实例，使用init来创建一个构造器
class className1 {
    var value = 0
    var name = "hahaha"
    init(value: Int) {
        self.value = value
    }
    func func10() -> String {
        return "A shape with \(value) sides"
    }
}


// 创建一个类的实例，在类名后面加括号。使用点来访问实例的属性和方法
var instanceName1 = className1(value: 5)
instanceName1.value = 2
var stringName2 = instanceName1.func10()


// 子类在后面加上:父类名字就能继承自父类～创建类的时候并不需要一个标准的根类，所以可以忽略父类
// 如果要重写父类的方法，必须使用override标记（如果没有添加override就重写负累方法的话编译器会报错）。编译器也同样会检测override标记的方法是否确实在父类中
class className2: className1 {
    var sideLength: Double
    init(sideLength: Double, value: Int) {
        self.sideLength = sideLength
        super.init(value: value)
        name = "xixi"
    }
    override func func10() -> String {
        print("lalala~")
        return name
    }
}


// 除了储存简单的属性之外，属性可以有getter和setter
class className3 {
    var sideLength: Double = 2
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
}

var instanceName2 = className3()
print(instanceName2.perimeter)
instanceName2.perimeter = 8
print(instanceName2.sideLength)


// willSet和didSet 在设置一个新值之前或者之后运行的代码
class className4 {
    var age: Int = 0 {
        willSet {
            print("we will set an new value \(newValue) to age")
        }
        didSet {
            print("we have changed \(oldValue) to \(age)")
        }
    }
}

var instanceName4 = className4()
instanceName4.age = 8
instanceName4.age = 12


// 使用enum创建枚举 ?????
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
        default:
            return String(self.rawValue)
        
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue


// 使用struct创建结构体。结构体和类相似，比如方法和构造器。结构体是传值，类是传引用
struct Card {
    var rank = 1
    func func11() -> String {
        return "hello"
    }
}


// 使用protocol来声明协议
// mutating 关键字用来标记一个会修改结构体的方法
protocol ExampleProtocol {
    var value11: Int {get}
    mutating func adjust()
}
// 类、枚举和结构体都可以实现协议


// Extension 扩展是给已经存在的类，结构体，枚举类型和协议增加新的功能
// 扩展能够增加新功能，但是不能覆盖已有的功能


// 错误处理
// 定义错误类型：
enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}
// 使用throw关键字来抛出一个错误、使用throws关键字来表示一个可以抛出错误的函数。
// 如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码进行错误处理
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}
// 在do-catch中进行错误处理，使用try标记抛出错误的代码
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// 错误处理的另一种方法：使用try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为nil。否则的话，结果会是一个包含函数返回值的可选值
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
// 使用defer代码块表示在函数返回之前，函数中最后会执行的代码


// 泛型


// 可以使用where对参数做出一些约束，比如必须是实现了某一个协议，或者说具有一个特定的父类
