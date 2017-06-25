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
1. 通过枚举类型表示错误
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

2. 抛出一个错误表明有意外情况发生 使用throw关键字
throw VendingMachineError. insufficientFunds(coinsNeed: 5)

3.某个错误被抛出时，附近的某部分代码必须负责处理这个错误
swift有4种错误处理方式：
- 把函数抛出的错误传递给调用此函数的代码
- 用do-catch语句处理错误
- 将错误作为可选类型处理
- 断言此错误根本不会发生

为了表示一个函数、方法或者构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数叫做throwing函数。
func canThrowErrors() throws -> String

一个throwing函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域
只有throwing函数可以传递错误。任何在某个非throwing函数内部抛出的错误只能在函数内部处理


-+ 把函数抛出的错误传递给调用此函数的代码
 struct Item {
     var price: Int
     var count: Int
 }
 class VendingMachine {
     var inventory = [
         "Candy Bar": Item(price: 12, count: 7),
         "Chips": Item(price: 10, count: 4),
         "Pretzels": Item(price: 7, count: 11)
     ]
     var coinsDeposited = 0
     func dispenseSnack(snack: String) {
         print("Dispensing \(snack)")
     }
     func vend(itemNamed name: String) throws {
         guard let item = inventory[name] else {
             throw VendingMachineError.InvalidSelection
         }
         guard item.count > 0 else {
             throw VendingMachineError.OutOfStock
}
         guard item.price <= coinsDeposited else {
             throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
}
         coinsDeposited -= item.price
         var newItem = item
         newItem.count -= 1
         inventory[name] = newItem
         print("Dispensing \(name)")
     }
}

在 vend(itemNamed:) 方法的实现中使用了 guard 语句来提前退出方法，确保在购买某个物品所需的条件中，有任 一条件不满足时，能提前退出方法并抛出相应的错误。由于 throw 语句会立即退出方法，所以物品只有在所有条 件都满足时才会被售出。

throwing 构造器能像 throwing 函数一样传递错误.例如下面代码中的 PurchasedSnack 构造器在构造过程中调用 了throwing函数,并且通过传递到它的调用者来处理这些错误。
 struct PurchasedSnack {
     let name: String
     init(name: String, vendingMachine: VendingMachine) throws {
         try vendingMachine.vend(itemNamed: name)
         self.name = name
     }
}


-+ 用do-catch处理错误
var vendingMachine = VendingMachine()
 vendingMachine.coinsDeposited = 8
 do {
     try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
 } catch VendingMachineError.InvalidSelection {
     print("Invalid Selection.")
 } catch VendingMachineError.OutOfStock {
     print("Out of Stock.")
 } catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
     print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
 }
// 打印 “Insufficient funds. Please insert an additional 2 coins.”

buyFavoriteSnack(person:vendingMachine:) 函数在一个 try 表达式中调用，因为它能抛出错 误。如果错误被抛出，相应的执行会马上转移到 catch 子句中，并判断这个错误是否要被继续传递下去。如果没 有错误抛出， do 子句中余下的语句就会被执行。


-+将错误转换成可选值
可以使用 try? 通过将错误转换成一个可选值来处理错误。如果在评估 try? 表达式时一个错误被抛出，那么表达 式的值就是 nil 。例如,在下面的代码中, x 和 y 有着相同的数值和等价的含义:
func someThrowingFunction() throws -> Int {
     // ...
}
let x = try? someThrowingFunction()
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil 
}
如果 someThrowingFunction() 抛出一个错误， x 和 y 的值是 nil 。否则 x 和 y 的值就是该函数的返回值。注 意，无论 someThrowingFunction() 的返回值类型是什么类型， x 和 y 都是这个类型的可选类型。例子中此函数返 回一个整型，所以 x 和 y 是可选整型。


-+禁用错误传递（保证这个错误不会发生）
有时你知道某个 throwing 函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写 tr
y! 来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一 个运行时错误。
例如：
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")



// 指定清理操作
使用defer语句在即将离开当前代码块时候执行一系列语句，该语句让你能执行一些必要的清理操作，不管是 以何种方式离开当前代码块的——无论是由于抛出错误而离开，还是由于诸如 return 或者 break 的语句。例如，你可以用 defer 语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。
延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条 defer 语句中的代码会在第二条 defer 语句中的代码被执行之后才执行，以此类推。
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() { 
            // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。 
    }
}

注意：即使没有涉及到错误处理，你也可以使用 defer 语句。


//类型转换
-+ 检查类型：用类型检查操作符( is )来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回
true ，否则返回 false 。
for item in library {
     if item is Movie {
         movieCount += 1
     } else if item is Song {
         songCount += 1
     }
}

某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类
型，用类型转换操作符(as? 或 as!)。
条件形式as? 返回一个你试图向下转成的类型的
可选值。强制形式 as! 把试图向下转型和强制解包转换结果结合为一个操作。
当你不确定向下转型可以成功时，用类型转换的条件形式( as? )。条件形式的类型转换总是返回一个可选
值，并且若下转是不可能的，可选值将是 nil 。这使你能够检查向下转型是否成功。 只有你可以确定向下转型一定会成功时，才使用强制形式( as! )。当你试图向下转型为一个不正确的类型
时，强制形式的类型转换会触发一个运行时错误。

在这个示例中，数组中的每一个 item 可能是 Movie 或 Song 。事前你不知道每个 item 的真实类型，所以 这里使用条件形式的类型转换( as? )去检查循环里的每次下转:
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}
注意：转换没有真的改变实例或它的值。根本的实例保持不变;只是简单地把它作为它被转换成的类型来使用。

Swift 为不确定类型提供了两种特殊的类型别名:
• Any 可以表示任何类型，包括函数类型。 
• AnyObject 可以表示任何类类型的实例。

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

注意:
Any 类型可以表示所有类型的值，包括可选类型。Swift 会在你用 Any 类型来表示一个可选值的时候，给你一
个警告。如果你确实想使用 Any 类型来承载可选值，你可以使用 as 操作符显示转换为 Any ，如下所示:
let optionalNumber: Int? = 3 things.append(optionalNumber) // 警告 
things.append(optionalNumber as Any) // 没有警告



