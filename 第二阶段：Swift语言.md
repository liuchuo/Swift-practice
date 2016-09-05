# 第二阶段：Swift语言

## Swift简介

- 借鉴了python、Ruby、C#语言的高级语言
- Swift是在Objective-C的基础之上，借鉴了许多现代高级语言，发展而成的一门安全、高效、支持多种编程范式的编译性语言。
- 与Cocoa和Cocoa Touch框架高度集成，支持开发Mac OS X、iOS、watch OS应用
- 基于Objective-C运行时，支持与Objective-C语言双向互操作
- LLVM：编译器框架，包含：编译器、调试器、JIT、优化、静态分析系统等，是GCC之外开源编译架构的一支重要力量
- Clang：支持C、C++、Objective-C的轻量级编译器

#### 三种开发方式

- Playground

  - 交互式编写代码（自动的在右边显示出每一句的结果，和控制台Console Output的输出结果）
  - 适合快速学习、测试、可视化观察
- REPL命令行

  - PEPL（Read-Eval-Print-Loop）
  - xcrun swiftc HelloWorld.swift
    - swiftc是swift compile的意思
  - 适合调试、研究、微观探查
- XCode项目

  - 构建正规工程项目
  - 使用大型框架，追求设计质量和代码组织

#### 类型系统

- 值类型 value type
  - 基础数值类型
    - Int8
    - UInt8
    - Int16
    - Uint16
    - Int32
    - UInt32
    - Int（在32位平台表示的是Int32，64位平台表示的是Int64）
    - UInt（在32位平台表示的是UInt32，64位平台表示的是UInt64）
    - Int64
    - UInt64
    - Float
    - Double
    - Bool（在现代计算机系统中因为不存在1bit的位置，所以布尔类型实际占用的是1Byte，即8个bit位置）
    - Character（16位字符，Unicode编码，所以可以写emoji表情，可以写中文字）
  - 结构 struct
  - 枚举 enum
  - 元组 tuple
  - 特殊类型：
    - String
    - Array
    - Dictionary
    - Set
- 引用类型 reference type
  - 类 class
  - 闭包 closure
- 类型装饰
  - 协议 protocol
  - 扩展 extension
  - 泛型 generics

## 值类型与引用类型

#### 类型成员

- 属性 property
  - 数据成员 data member，描述对象状态
- 方法 method
  - 函数成员 function member，描述对象行为
- 初始化器 init
- 析构器 deinit
- 下标 subscript

~~~swift
class MyClass {
	var x:Int
	var y:Int
	var datas:[Int] = [1, 2, 3, 4, 5]

	init(x:Int, y:Int) {
  		self.x = x
  		self.y = y
	}

	func print() {
  		print("\(x), \(y), \(datas)")
	}

// 下标：实际上是一组函数，看上去很像数组的访问形式
	subscript(index: Int) -> Int {
 		get {
    		return datas[index]
  		}
  		set(newValue) {
    		datas[index] = newValue
  		}
	}

// 析构器，清除某些资源
	deinit {
  		print("clear up resources")
	}
}

// 调用方法
var myObject = MyClass(x:10, y:20)
myObject.print()
myObject.x++
myObject[0] = 100
~~~

#### 类与结构（都叫类型 Type）

- swift中的struct比Objective-C里面的struct使用的频繁地多
- 类型与实例
  - 类与对象（class的实例是对象）
  - 结构与值（struct的实例是值）
- 类——引用类型
  - 位于栈上的指针（引用）
  - 位于堆上的实体对象
- 结构——值类型
  - 实例直接位于栈中
- 空间分析
  - 运行时内存图

## 类型成员：属性

- 属性表达实例状态或类型状态

- 属性类别

  - 存储属性
  - 计算属性

- 可变性

  - 变量属性
  - 常量属性

- 归属权

  - 实例属性
  - 类型属性（静态属性static）
    - 静态属性是类的属性，只可以用类名.来调用，而不能用对象.来调用

- ~~~swift
  class Rectangle {
    // 存储属性
    let height:Double = 0 // 常量属性
    var width:Double = 0 // 变量属性
    
    // 计算属性
    var area:Double {
      get {
        return height*width
      }
      set{
        width = newValue / weight
      }
    }
    
    // 静态属性
    static var max:Double = 10000
  }
  ~~~

- 类与结构体都具有这些属性

- 存储属性的本质

  - 一个存储变量
  - 两个访问器方法：get和set

- 计算属性

  - 两个访问器方法：get和set（自己手工写的）
  - 可以简化为get（这样就变成了只读属性get-only）

- 静态属性存储在静态数据区，既不在堆上也不在栈上

#### 存储属性的生存周期

- 实例存储属性跟随实例存储（值类型在栈上，引用类型在堆上），生存周期跟随实例
- 静态存储属性（无论值类型或引用类型）的值存储在静态存储区，生存周期从类型加载开始，到类型卸载结束。
- 值存储属性直接“内嵌”在实例中
- 引用存储属性通过指针“强引用”堆上的引用类型实例，ARC针对强引用进行计数管理

#### 更多属性功能

- lazy存储属性：延迟初值计算到访问时（让用到这个属性的时候再初始化，如果不调用到这个属性，就不要初始化）lazy var myData = LargeData()

- 存储属性初始化：默认值 或者 构造器初始化（计算属性不用初始化）

  - 默认值： var height:Double = 0
  - 构造器初始化 

  ~~~swift
  var center:RPoint
  var radius:Int
  init(center:RPoint, radius:Int) {
    self.center = center
    self.radius = radius
  }
  ~~~

  必须要初始化，默认值或者写init进行构造器初始化，这是swift的规定

  结构体不用写，因为结构体背后会默认帮你生成一个对所有存储属性init初始化方法，不用自己写

- 属性观察者：检测改变

  - willSet在改变前调用
  - didSet在改变后调用

~~~swift
var data:Int = 0 {
  var data:Int = 0 {
    willSet {
      print("About to set data to \(newValue)") // 直接用newValue这个关键词
    }
    didSet {
      print("Changed from \(oldValue) to \(data)") // 直接用oldValue这个关键词
    }
  }
}
~~~

## 类型成员：方法

#### 认识方法

- 函数：代码段上的可执行指令序列
  - 全局函数
  - 成员函数
- 方法是类型的成员函数，表达行为，方法可以定义于一下类型：
  - class
  - struct
  - enum
- 归属权
  - 实例方法——表达实例的行为，只能用实例对象来调用，内部可以访问实例方法与属性、以及类型方法与属性（如果调用的是类型方法，就要在前面加上本类名再加.方法）
  - 类型方法（也就是static静态方法）——表达类型的行为，只能用类名来调用，内部只能访问类型方法与属性（绝对不能调用实例属性，因为实例属性必须要有一个实例变量支撑来调用，实例方法同理，也不能调用）

#### 方法参数

~~~swift
func(参数1, 参数2, ...) -> 返回值 {
  
}
~~~

- 参数形式：外部参数名 本地参数名 : 类型

~~~swift
func sayGreeting(person name:String, greeting words:String) -> String {
  return words + "! " + name
}
sayGreeting(person:"jason", greeting:"hello")
~~~

- 声明时可以省略外部参数名，这时外部参数名使用本地参数名

~~~swift
func sayGreeting(name:String, word:String) -> String {
  return words + "!" + name
}
sayGreeting(name:"jack", word:"hello")
~~~

- 调用时，第一个参数名可以忽略，但后面的参数名必须显式标明。如果在声明时加_ ，调用时也可以忽略参数明

~~~swift
//调用时，第一个参数名可以忽略，但后面的参数名必须显式标明。
func sayGreeting(name:String, word:String) -> String {
  return words + "!" + name
}
sayGreeting("jack", word:"hello")

//如果在声明时加_ ，调用时也可以忽略参数明
func sayGreeting(name:String,_ word:String) -> String {
  return words + "!" +name
}
sayGreeting("jack", "hello")
~~~

- 方法可以没有参数，也可以没有返回值

~~~swift
func sayGreeting() {
  print("hello")
}
~~~

- 参数传递默认为传值方式

#### 更多参数和返回值功能

- 可以主动提供参数默认值，提供了之后可以不传参数，那么就会变成使用那个默认值来进行方法调用

~~~swift
func sayGreeting(name:String, word:String = "hello") -> String {
  return name + "!" + word
}
~~~

- 参数可以是常量参数也可以是变量参数，默认情况下是常量参数，不可以在方法内部修改它的值

~~~swift
func func1(data1:Int, var data2:Int) {
  //data2可以更改，data1不可以更改，如果想更改只能
  var datatemp = data1
  datatemp++
}
~~~

- 可变数目参数，可以通过在类型后面加三个点表示可以传入多个当前类型的参数，本质上是传入了一个该类型的数组

~~~swift
func averageNumber(numbers:Double) -> Double {
  var sum = 0.0
  for item in numbers {
    sum += item
  }
  return sum / Double(numbers.count)
}
//调用
myObject.averageNumber(10,11,45,66,12)
~~~

- inout参数，可以改变外部实参，注意这时候默认的实参就是变量可更改的了，调用的时候在前面加上取地址符

~~~Swift
func swap(inout a:Int, inout b:Int) {
  let tempA = a
  a = b
  b = tempA
}

// 第一个参数可以不提供名字，第二个参数必须提供名字
swap(&data1, b:data2)
~~~

- 可以有多个返回值：返回的是Tuple类型（元组）

~~~swift
func minMax(array: [Int]) -> (min: Int, max:Int) {
  var tempmax = array[0]
  var tempmin = array[0]
  // 此处代码取数组里面的最大最小值
  return (tempmin, tempmax)
}

// 调用
let range = myObject.minMax([2,-9,2,0,11])
print("min = \(range.min), max = \(range.max)")
~~~

## 类型成员：初始化器

- 一个类可以有多个初始化器，可以有参数也可以没有参数，虽然init也是个方法，但是无需写func关键字。
- init不可以有返回值
- init调用的时候，参数名都不可以省略，包括第一个也不可以省略
- 初始化器用于初始化类型实例，是一个特殊的函数，无返回值
- 类型实例的初始化过程
  - 1.分配内存
  - 2.调用初始化器初始化内存
- 初始化器可以定义于以下类型：
  - class
  - struct
  - enum
- 归属权：只有实例初始化器，没有类型初始化器
  - 类型的存储属性必须在定义的时候提供初值 `static var min:Int = 1000`
  - 而实例的存储属性可以提供初值也可以不提供，通过init来初始化

#### 初始化实例属性

- 初始化器主要用于初始化实例存储属性，两种初始化形式：
  - 指定默认值
  - 自定义初始化器
- 所有存储属性必须被初始化
  - 实例存储属性或者指定默认值，或者在初始化器内初始化
  - 类型存储属性必须指定默认值（因为没有类型初始化器）
- 可选属性类型可以不初始化（加个问号）
- 存储属性被初始化时，不会调用属性观察者

#### 默认初始化器

- 一个类可以有多个初始化器，但至少需要一个初始化器
- 如果一个类没有提供初始化器，那么编译器会自动生成一个默认初始化器
- 默认初始化器，无参形式init()
- 如果在刚定义变量名的时候初始化了值a = 1，在init里面又初始化了值a = 2，事实上这个a = 1的初始化步骤会被编译器塞到init函数里面，在a = 2之前，所以说执行了init 才开始a被初始化为1，然后被初始化为2（从使用swiftc里面生成的sil文件的代码里面可以看出）

#### 指定初始化器和便捷初始化器

- 指定初始化器(Designated Initializer)为类的主初始化器，负责初始化所有属性。必须调用其父类的主初始化器

  - 自己写的init
  - 系统自动生成的init

- 边界初始化器(Convenience Initializer)为类的辅助初始化器，必须调用本类的指定初始化器（self.init(...)）

  - ~~~swift
    convenience init(x:Int, y:Int) {
      self.init(x:x, y:y, z:0)
    }
    // 在类里面调用本类的init函数，在函数前面添加convenience关键字
    // 可以为了避免重复代码
    ~~~

  - 便捷初始化器只能调用本类的初始化器，而不能调用父类的初始化器。而指定初始化器可以调用其父类的主初始化器

## 类型成员：析构器

- 析构器（deinit）（有的人叫做反初始化器）在实例内存中被释放前调用，用于释放实例使用的非内存资源
- 析构器仅仅可以用于定义class，且只能定义一个。struct和enum不能定义析构器。因为struct和enum里面不能定义析构器，所以编译器在设计swift的时候，不推荐struct和enum使用资源，如果想要使用资源还是应该使用class。

~~~swift
class myClass {
  deinit {
    //...
  }
}
~~~

- 析构器是没有参数的，不能加括号（初始化器可以有参数，也可以手动调用）

- 归属权：只有实例析构器，没有类型析构器（也没有类型初始化器~~~）

- 析构器由运行时根据ARC的释放规则，自动调用，程序员无法手工调用

- `var myObject:myClass?`  如果希望myObject支持nil赋值，所以可以定义myObject为可选类型，也就是在结尾加个问号

  - 在调用的时候要加感叹号，表示强制拆封，`myObject!.func1()`，表示我确定这个对象不是nil，如果是nil，那么会抛异常

- ~~~swift
  var myObject:myClass?
  myObject!.func1()
  myObject = nil //此时，这句话触发了系统自动调用deinit方法，因为这个时候myObject的引用计数为0，在堆上的对象就会因为ARC机制而可以被释放，系统自动执行了deinit(deinit不可以手工调用，只能由系统调用！！)
  ~~~

- swift语言全程默认使用ARC，没有autoreleasepool

- 析构器用来释放非内存资源，比如打开了文件需要关闭，它不参与内存资源的释放，内存资源的释放是系统ARC的时候调用的，不需要在里面写置属性为nil之类的，因为当ARC释放它之后，属性那些会自己变成nil

#### ARC简介

- Objective-C可以选择ARC机制，也可以选择手工调用机制，而swift是没有手工调用机制的，全程自动默认为使用ARC
- ARC的作用：自动引用计数，用于管理堆上的对象实例所分配的动态内存
- ARC不负责负责管理栈上的内存。栈上面的内存是由内存时根据函数生存周期来自动管理栈的创建和销毁
- ARC通过追踪“对象被引用的计数”来确定对象是否还需要被访问，如果对象引用计数为0，ARC会立即调用析构器，并随后释放对象内存

#### 引用计数管理

- 对象引用计数增1：
  - 新创建对象并赋值为变量，引用计数加1
  - 将对象引用拷贝给其他变量或常量
  - 将对象赋值给其他属性（无论实例属性，还是类型属性）
  - 将对象传递给函数参数（非inout函数），或者返回值
- 对象引用计数减1：
  - 将变量赋值为nil
  - 将属性赋值为nil，或者属性所在的对象被释放（实例属性）
  - 传值参数离开函数
- 引用计数变为0，析构器被调用，内存释放

## 下标与操作符

#### 认识下标Subscripts

- 下标支持使用索引的方式访问“集合式”实例，例如vector[index]

- 下标可以定义于以下类型：（init也是，但是deinit只能定义于class中，因为不推荐在struct和enum中使用资源然后释放资源）

  - class
  - struct
  - enum（用的比较少）

- 下标可以类比为“含有参数的计算属性”，其本质是一对带索引参数的访问器方法（get/set）

- ~~~swift
  class Vector {
    var datas = [Int](count:100, repeatedValue:0)
    
    subscript(index:Int)->Int {
      get {
        return datas[index]
      }
      set { //其实是set(newValue:Int)，只不过是可以省略掉的
        datas[index] = newValue
      }
    }
    
  }

  var datas = Vector() 
  for i in 0..<10 {
    data[i] = i
  }
  ~~~

#### 访问下标

- 只能定义实例下标，不能定义类型下标。（就是subscript前面不能加static）（init、deinit、subscript都是这样，都只能定义实例的，不能定义类型的，就是说不能定义为静态方法的init、deinit或者subscript）

- 可以定义读写下标（get和set都存在），也可以只定义只读下标（只有get，这样就不能用下标赋值了，只能访问）——不能只写，就是说不能只有set没有get（只往里面写不读取不符合逻辑、、）

- subscript实际上是依赖于存储属性的一个数组存在的，没有那个存储属性的数组（比如说上面代码里面的datas），就不能用下标了

- 下标的参数可以是任何类型的，String、Double...

- 一个类型(class, struct, enum)可以提供多个下标的重载版本（参数不同），比如可以定义两个索引参数

- ~~~swift
  struct Matrix {
    let rows:Int
    let columns:Int
    var grid:[Double]

    init(row:Int, columns:10) {
      self.rows = rows
      self.columns = columns
      gird = Array(count: rows * columns, repeatedValue: 0.0)
    }
    subscript(row:Int, column:Int) -> Double {
      get {
        return grid[(row * columns) + column]
      }
      set {
        grid[(row * columns) + column] = newValue
      }
    }
  }

  var data = Matrix(row:10, columns:100)
  data[0, 0] = 100
  print(data[0, 0])
  ~~~

- 下标是没有名字的

- 自己定义下标的时候不是很多，因为这个类要符合集合式的要求，但是经常用下标set、dictionary、map这些类库里面定义好的下标直接用来用

#### 标准操作符

- 范围操作符
  - `a..<b`包含a，不包含b
  - `a…b`包含a和b
- 值相等：
  - `==`
  - `!=`
- 引用相等
  - `===`
  - `!==`

#### 重载操作符

- 除了标准操作符之外，还可以针对自定义类型重载标准操作符。重载操作符又称“操作符函数”，其本质是全局函数（C#、C++里面重载操作符很多时候是成员函数，属于类型的成员）

~~~swift
class Complex {
  var real = 0.0
  var imag = 0.0
  
  init(real:Double, imag:Double) {
    self.real = real
    self.imag = imag
  }
}

func + (left: Complex, right: Complex) -> Complex {
  return Complex(real: left.real + right.real, imag: left.imag + right.imag)
}

var c1 = Complex(real: 10, imag: 20)
var c2 = Complex(real: 10, imag: 200)
var c3 = c1 + c2
~~~

- 可以重载前缀（prefix）、中缀（infix）、后缀（postfix）操作符。前缀和后缀操作符需要加关键词prefix或postfix
- 也可以通过将参数设置为inout参数，重载复合赋值操作符，例如+=，-=
- 除了重载Swift标准操作符，也可以自定义新的操作符，并重载（很少见，基本标准操作符够用了）

#### 相等操作符

- 引用相等
  - 判断对象地址是否相等，仅仅针对引用类型，不适用于值类型
  - 值类型虽然也有地址，但是是无法得知的，取不到的，在swift里面没有语言语法机制提供去取值类型的地址（认为没有意义而且不安全）
- 值相等
  - 判断实例值是否相等，自定义类型默认不支持!=和==的，需要重载提供值比较的语义
  - 一般情况下来说，重载了==号的同时也要重载!=操作符

## 结构与枚举

#### 认识结构struct

- struct属于值类型，具有值拷贝语义（赋值与传参）
- struct不支持面向对象（即继承与多态），主要用于定义轻量级数值类型，class支持面向对象，主要用于设计有丰富关系的组件系统
- struct有传参拷贝成本，不要定义尺寸过大的结构；class有ARC内存管理成本
- 不要在struct内定义引用类型属性（会改变struct的值拷贝语义，变成了两个指针指向同一块内存）

#### struct 和 class 的异同

- 相同点
  - 都可以定义以下成员：属性、方法、下标、初始化器
  - 都支持类型扩展、协议
- 不同点
  - 类支持继承和多态，结构不支持
  - 类必须自己定义初始化器，结构会有默认的按成员初始化器
  - 类支持析构器，结构不支持
  - 类的实例在堆上，由ARC负责释放；结构的实例在栈上，栈结束自动释放，不参与ARC管理
  - 类支持引用相等比较（===和!==），结构不支持

### 认识枚举

- enum用于定义一组相关的值成员，enum同属于值类型，具有值拷贝语义（赋值与传参）


~~~swift
enum Color {
  case Red
  case Bule
  case Green
  case Black
}

// 或者
enum Color {
  case Red, Bule, Green, Black
}
~~~

- 可以使用switch-case语句处理enum，但case必须包含所有的枚举值，否则需要用default
- 可以为enum指定原始值，即rawValue，类型可以是字符、字符串、整数或者浮点数。数值默认从0开始，字符串与枚举值名称相同


~~~swift
enum WeekDay: Int {
  case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday 
}

// 只有定义了原始值类型才能使用rawValue
var day: WeekDay? // 有可能是nil
day = WeekDay(rawValue: 7)

var data - WeekDay.Saturday.rawValue
~~~

- enum支持关联值，可以设置不同类型的值成员，类似联合数据结构


~~~swift
enum Position {
  case Number(Point)
  case Name(String)
}

var p1 = Position.Number(Point(x: 123, y: 588))
var p2 - Position.Name("Shanghai People’s Square")

func print(position: Position) {
  switch position {
    case .Number(let number):
    	print("[\(number.x), \(number.y)]")
    case .Name(let name):
    	print(name)
  }
}
~~~

- enum还可以定义以下成员：计算属性、方法、初始化器(用的不多，和struct一样也是轻量级的小类型，一般都是放在class里面使用的，单独使用的情况不多)


~~~swift
enum Sex {
  case Male, Female
  
  init?(symbol: Character) {
    switch symbol {
      case "M":
      	self = .Male
      case "F":
        self = .Famale
      default:
      	return nil
    }
  }
  
  func show() {
    switch self {
      case Male:
      	print("I am Male!")
      case Female:
      	print("I am Female!")
    }
  }
}

var sex = Sex.Female
var defaultSex = Sex.Default
var newSex = Sex(symbol: "F")
~~~

- class 中的self是只读的，而enum中的self是可以修改枚举值的


## 继承与多态

- 面向对象三大特征：封装、继承、多态
- Swift没有默认的基类，不像Objective-C有NSObject

#### 认识继承 Inheritance

- 继承：子类自动继承基类的属性，方法和下标
- 只有类支持继承，结构和枚举不支持继承
- 继承同时支持实例成员和类型成员
- 继承的两层含义
  - 成员复用：子类复用基类成员
  - 类型抽象：将子类当做父类来使用（面向基类编程，面向抽象类编程）
- 用IS-A判断是否满足一个子类与父类的关系（长方形是一个形状，三角形是一个形状，苹果是一个水果）
- 父类里面的静态变量a，子类继承父类后，子类里面也有a，指向的是静态全局区的同一个a，子类不再为继承下来的静态变量再单独开辟一份空间


~~~swift
// 对于类ClassA的方法来说
func invoke() {
  print("~~~")
}
// 在编译器中会被自动转成ClassA
func invoke(self: ClassA) {
  print("~~~")
}

// 所以在ClassB继承之后调用会变成
var a = ClassA()
var b = ClassB()
a.invoke() // 编译器编译后会变成invoke(self: ClassA)
b.invoke() // 编译器编译后会变成invoke(self: ClassB)
~~~

#### 认识多态 Polymorphism

- 多态：子类在同一行为接口下，表现不同的实现

- override 重写（覆盖、改写），要在前面加上关键词override

  - 可以重写方法、属性、下标，包括实例成员和类型成员（在经典的面向对象里面是不支持类型成员重写的，swift支持，但是一般情况下不需要用到类型成员的重写（即static成员的重写））
  - 属性的重写是指重写父类里面的属性的get和set方法（C++只能重写方法，不能重写属性）

  ~~~swift
  // 父类里面：
  func move() {
    
  }

  // 子类里面：
  override func move() {
    
  }
  ~~~

- overload 重载，是指方法名相同参数不同，不需要在前面加上关键词

~~~swift
// 同一个类里面
func move() {
  
}

func move(data: Int) {
  
}
~~~

- 在子类的代码中，可以使用super来调用基类的实现

~~~swift
override func move() {
  super.move()
}
~~~

- 多态背后所带来一种现象：变量有双重身份，1.声明类型 2.实际类型。调用的永远是它实际的对象类型的方法，而不是它声明的类型的方法
- 在成员上使用final阻止子类override该成员，在类上使用final阻止该类被继承（实现非多态）
- 在某些语言里面，方法和属性必须被写成虚方法、虚属性才能被override，但是在swift里面默认所有的方法和属性都是虚方法、虚属性，都可以被override
- 对象除了方法和属性的内存空间，前面有一块灰色部分，保存的信息有很多，其中包括该对象的虚函数表（Virtual Method），里面有所有函数的地址（一般是存放表的首地址），函数调用的时候，会找到对象的虚函数表的对应的函数地址，是一种两次指针间接运算的过程。而对于final函数，调用的时候无需这么麻烦，只需要直接跳转到final函数的地址就可以（C++、Java、C#差不多都是这样）
- 生成sil中间文件：`xcrun swiftc -emit-silgen a.swift -o a.sil`

#### 继承中的初始化器和析构器

- 初始化器 init

  - 如果子类没有定义初始化器，子类将自动继承基类的初始化器
  - 如果子类定义了初始化器，则不再继承，此时子类初始化器必须调用基类的一个初始化器，如果手工不调用，编译器会自动生成调用

  ~~~swift
  override init() {
    super.init() // 如果不写，会编译器自动帮写
    // ...
  }
  ~~~

  - 如果子类的初始化器与基类初始化器原型一致，必须使用override关键字
  - 在子类中使用基类属性，必须确保首先调用基类初始化器（手工前置，不要依赖编译器自动生成）

- 析构器 deinit

  - 如果子类没有定义析构器，会自动继承基类析构器
  - 如果子类定义了析构器，子类析构器执行完毕之后，会自动调用基类析构器（无法手工调用！！不要自己写super.deinit！！！）
  - 子类析构器自动具有多态性（析构器会根据实际类型来调用，而不是根据声明类型来调用）


## 协议

#### 认识协议 protocol

- 协议：类型的合同约定，只描述外部接口，不提供具体实现（在java中称为interface接口）


- 协议可以包含以下成员：
  - 属性
  - 方法（可以static，但是协议定义为类方法用的比较少，java直接不允许）
  - 初始化器
  - 下标
  - 操作符

  ~~~swift
  protocol Drawable {
    var discription: String { // 属性
      get
    }
    
    func draw() // 方法
    
    init() // 初始化器
   
    subscript(index: Int) -> Int { // 下标
      get
    }
    
    func == (lhs: Self, rhs: Self) -> Bool // 还可以定义操作符，全局函数要实现在类花括号外面
  }
  ~~~

- 一个类型可以实现多个协议（也叫做遵守协议），协议可以应用在如下类型上。但可以添加class关键字表明协议只能应用在类上：
  - 类class
  - 结构struct
  - 枚举enum（很少用到枚举实现协议）

#### 使用协议

- 协议本质上是一种类型，可以作为声明类型，但是不能创建实例（只可以`var a : Sharpe`不可以`a = Sharpe()`）

- 协议变量的内存模型遵从实际类型的内存模型（在java和C#里面会强行把协议变量的值类型转换为引用类型）
  - 引用类型（比如class）传参、拷贝采用传引用方式
  - 值类型（比如struct 、enum）传参，拷贝采用传值方式

- 检查协议类型
  - 使用is检查类型是否实现了协议

  ~~~swift
  class ClassB : ClassA, AProtocol {
    func display() {
      print("display")
    }
  }
  // Compile-time 编译时类型，也叫声明类型
  var ObjectA, ObjecitB : ClassA
  // Runtime Type 运行时类型，也叫实际类型
  ObjectA = ClassA()
  ObjectB = ClassB()
  //用is判断是否实现了某协议，是根据ObjectA的实际类型而非声明类型判断的
  if(ObjectB is AProtocol) {
    
  }
  ~~~

  - 使用as？和as! 将类型下溯转型为协议（动态转型/多态转型）

  ~~~swift
  var ObjectC : AProtocol
  //as? 允许会失败，失败了为nil   as! 不允许失败，失败了会报错
  ObjectC = ObjectA as? AProtocol // 结果为nil
  ObjectC = ObjectA as? AProtocol // 结果为ClassB

  var ObjectD = ClassB()
  ObjectD = ObjectC // 此时不需要as转型，因为ObjectC已经实现了AProtocol
  ~~~

#### 协议中的属性

- 协议中可以定义只读属性（只有get），也可以定义读写属性（要写get和set）
- 协议中可以定义实例属性，也可以定义类型属性（属性前面加static）
- 协议中只能定义变量属性，不能定义常量属性（不能写let常量属性）
- 实现协议时，并不要求实现为存储属性、还是计算属性（两个都可）

~~~swift
// 协议里面的定义
var discription : String {
  get
}

// 实现可以为计算属性，也可以为存储属性
var discription : String {
  return "[\(x), \(y)]"
}

var discription : String = ""
~~~

- 协议的实现只多不少，要求实现的都要实现，多实现没关系

#### 协议中的方法

- 协议可以定义实例方法、也可以定义类型方法（static方法）
- 协议中的方法不能定义参数的默认值（  不能func darw(`data : Int`)  ）
- 针对值类型的mutating协议方法：
  - 值类型（struct和enum）实现的**实例方法**如果要更改实例本身，需要在协议方法的定义中表明mutating关键字，同时在方法实现时也添加mutating关键字（mutating可变方法体）
  - 在类内实现mutating协议方法时，无需添加mutating关键字（意思是mutating只用于struct和enum）
- tips: 在类里面self是不可以改变的，只可以改变self指向的东西，比如self.x  self.y。。这些属性

#### 协议中的初始化器

- 协议中可以定义初始化器，但是**不可以定义析构器**
- 当class中实现协议定义的初始化器时，需要在实现的时候在init前面添加required关键字（这个required是为子类考虑的）
  - 表明子类也需要提供该初始化器
  - 但是如果定义为final类，则不需要required关键字
- 父类需要实现的协议，子类也必须实现，默认的，无需再重复写一遍（在有的语言里面认为写不写都一样，但是在swift语言里面默认不需要写，如果写了会提示错误，认为这是一种冗余的做法）
- 协议可以定义可失败的初始化器init? ，具体实现时可以失败、也可以非失败

#### 更多协议形式

- 协议继承
  - 一个协议可以继承一个或者多个协议（协议只能继承协议，协议不能继承类）（比较常见）
  - 实现子协议的类型，也必须实现父协议中约定的成员

- 协议组合

  - ~~~swift
    func process(item : protocol<AProtocol, BProtocol>) {
      item.display()
      item.excute()
    }
    ~~~

  - 可以使用`protocol<A, B,…>`来组合多个协议

  - 实现组合协议的类型，必须实现组合协议中的每一个协议

  - 组合协议是一个临时类型

- 可选协议
  - 协议中的某些成员可以定义为optional，不必实现
  - 可选协议只能应用于class，不能定义于struct和enum
  - 可选协议必须标明@objc属性（这是为了满足能够和Objective-C互操作的要求，即使不需要和Objective-C互操作）(只要协议里面有一个optional，就必须在前面加@objc)

  ~~~swift
  @objc protocol DProtocol {
    optional var discription : String { get }
    func move()
  }

  class ClassC : DProtocol {
    @objc func move() {
      
    }
  }
  ~~~

  ​



## 字符串

- String是一个Unicode编码、16位字符的字符序列。
- String与NSString支持无缝互操作
- String被定义为struct，值类型，拷贝时，拷贝时候具有值语义
- String是一个struct，但内部包含一个指向堆上的“内容指针”，其指向的对象存放真正的字符串内容
- sizeofValue(str1) 能够看到str1这个结构体所占用的内存大小


#### 使用字符串

- 使用var和let来控制字符串的可变性

~~~swift
var str1 = "Hello"
let str2 = ", Swift"
~~~

- 获取字符串中的字符

~~~swift
// 枚举字符
for item in str1.characters {
  print(item)
}

for index in str1.characters.indices {
  print(str1[index])
}

print(str1.startIndex.successor()) // 第一个字符下标的下一个字符
print(str1.endIndex.predecessor()) // 最后一个字符下标的下一个下标的 前一个下标(也就是最后一个字符)
let index = str1.startIndex.advancedBy(4) // 第一个字符下标开始前进4个字符下标
print(str1[index])
~~~

- 输出字符串的长度

~~~swift
print(str1.characters.count)
~~~

- startIndex 和 endIndex
  - startIndex是第一个字符的下标，endIndex是最后一个字符下标的下一个
  - `print(str1[str1.startIndex])` 


- 使用append和+链接字符串

~~~swift
str1.appendCountentsOf(", World")

var str3 = str1 + str2

str1 += str2

var char : Character = "!"
str1.append(char)
~~~

- 使用字符转义

~~~swift
let heart = "\u{2665}"
print(heart) // "❤"
let words = "\tHello"
print(words) // "	Hello"
~~~

- 字符串插值（String Interpolation）

~~~swift
var x = 100
var y = 200.0
var text = "[\(x), \(y)]"
~~~

- 字符串比较

~~~swift
==  !=
~~~

#### copy-on-write 共享技术

- 同一个字符串内容拷贝到不同的变量中时，“内容指针”不变，即不同变量“共享”同一份堆内存。从而实现“节省内存”
- 如果同一个变量的字符串内容改变时，先将原来堆内存拷贝一份，“内容指针”指向新的拷贝，然后再更改新的拷贝。从而确保“正确性”
- copy-on-write的目的是实现“内容相同的字符串共享内存，同时又支持字符串随时改变”。
- 最佳实践：尽量不改变字符串，尽量使用常量字符串let

#### 缓存容量与增长

- 字符串初始化后，会分配一个缓存容量capacity，其长度一般大于实际的字符数量
- 当字符串增长时，如果实际需求大于capacity，其capacity会以2倍的方式指数增长。伴随代价：
  - 分配新的堆内存 2 * capacity
  - 将原来堆内存上的内容拷贝到新内存
  - 释放原来堆内存
- 最佳实践：估计好capacity，预先分配好一定容量，避免以后capacity的增长


## 集合类型

- 包含三类
  - Array、Set、Dictionary

#### 认识数组Array

~~~swift
// 数组声明与实例化
var array1 = [1, 2, 3, 4, 5]
var array2: [Int]
var array3: Array<Int>

array2 = [Int](count: 5, repeatedValue: 10)
array3 = [Int]()
~~~

- Array是一个有序的元素序列，支持随机存取，支持动态更新长度
- 索引从0开始，索引访问越界会抛出异常
- Array被定义为struct，值类型，拷贝时具有值语义
- Array是一个struct，但内部包含一个指向堆上的“元素指针”，其指向的**堆上**存放真正的数组元素
  - 如果数组元素为值类型，拷贝数组时，元素包含值本身
  - 如果数组元素为引用类型，拷贝数组时，元素引用指向相同的对象
- 所以说输出print(sizeofValue(array1)) 是 8，（size是以byte为单位，64位机器下指针是8byte）是指针的大小
- 释放引用类型数组，使用`objectArray.removeAll()`只会释放掉数组结构体里面的指针，和堆上所有引用对象的指针断开


#### 使用数组

- 使用var和let来控制数组的常量性：数组长度和元素内容都不能更改

- 数组遍历
  - 使用for循环访问array[index]需要检查索引越界，具有性能代价
  - 尽可能使用for-in遍历数组元素；或使用Array.enumerate()遍历索引；二者编译器会优化掉索引检查

  ~~~swift
  // 下面两种不需要进行索引检查
  for item in array5 {
    print(item)
  }

  for(index, value) in array5.enumerate() {
    print("\(index): \(value)")
  }
  // 下面两种需要索引检查
  for index in 0..<array5.count {
    print(array5[index])
  }

  for var index = 0; index < array5.count; index++ {
    print(array5[index])
  }
  ~~~

- 尽量避免使用insert和remove操作，因为会改变数组元素序列，涉及到大量的内存拷贝操作，代价较高

~~~swift
var array7 = array5 + array6
array5 += [5, 6, 7]
array5[4...6] = [6, 7, 8]

array5.insert(5, atIndex: 4) // 代价较高
array.removeAtIndex(7) // 代价较高
~~~

#### 缓存容量增长

- 可以使用array1.capacity检查array1有多少缓存容量
- 使用array1.reverseCapacity(100)预先分配一定容量，或者array1 =` [Int](count: 100, repeateValue: 0)`预先分配容量


- 数组初始化后，会分配一个缓存容量capacity，其长度一般大于实际的元素数量
- 当数组长度增长时，如果实际需求大于capacity，其capacity会以近似2倍的方式指数增长，伴随代价：
  - 分配新的堆内存 2 * capacity
  - 将原来堆内存上的元素拷贝到新内存
  - 释放原来堆内存
- 最佳实践：估计好capacity，预先分配好一定容量，避免以后capacity的增长


~~~swift
array1.removeAll(true) //保留容量写true，不保留容量写false
~~~

#### copy-on-write共享技术

- 同一个数组拷贝到不同的变量中时，“元素指针”不变，即不同变量“共享”同一份堆内存。从而实现“节省内存”。
- 如果某一个变量的元素内容改变时，先将原来堆内存拷贝一份，“元素指针”指向新的拷贝，然后再更改新的拷贝。从而确保“正确性”
- copy-on-write的目的是实现“元素内容相同的数组共享内存，同时又支持元素随时改变”
- 最佳实践：尽量不改变数组元素和长度，尽量使用常量数组

#### 认识集合 Set

~~~swift
var words = Set<String>()

words.insert("Hello")

words.count

words = [] // 把集合设置为空

var cities1: Set<string>
cities1 = ["ShangHai", "Beijing", "New York"]

for city in cities1 { // 无序
  print(city) 
}

for city in cities1.sort() { // 有序，按照字母排序
  print(city)
}

cities1.contains("New York") // 判断是否包含某个元素，返回bool值 true or false

print(cities1.isSupersetOf(cities2)) // 判断一个集合是不是一个集合的超集

print(cities1 == cities2)

cities1.remove("Beijing")
~~~

- Set是一个无序的集合，其存储的值不能重复
- Set中的元素必须有哈希值，即支持Hashable协议
- Set被定义为struct，值类型，拷贝时具有值语义
- Set也是一个struct，但内部包含一个指向堆上的“元素指针”，其指向的对象存放真正的元素
- Set为了效率考量。同样采取了copy-on-write的技术

### 认识字典 Dictionary

~~~swift
var dictionary1 = [String: Int]()
var dictionary2 = Dictionary<String, Int>
dictionary2 = ["Jason": 36, "Tom": 31, "Marty": 44]

for(name, age) in dictionary2 {
  print("\(name), \(age)")
}

for name in dictionary2.keys {
  print(name)
}

for value in dictionary2.values {
  print(value)
}

dictionary1.count
dictionary1["Tom"] = 21
dictionary1["Julie"] = 22
dictionary1.updateValue(33, forKey: "Tom")

dictionary2["Marty"] = nil
dictionary2.removeValueForKey("Tom")
~~~

- Dictionary是一个存储key-value的无序集合，key唯一，value可重复
- Dictionary中的key必须有哈希值，即支持Hashable协议
- Dictionary被定义为struct，值类型，拷贝时具有值语义
- Dictionary也是一个struct，但内部包含一个指向堆上的“元素指针”，其指向的对象存放真正的元素

## 泛型编程

#### 认识泛型 Generics(一般化，泛化)

- Objective-C不支持泛型
- 泛型：把一些不同的类型用一个统一的单词表示，比如T，比如Element，为了增加代码的复用性

~~~swift
class Stack<T> {
  var items = [T]()
  
  func push(item: T) {
    items.append(item)
  }
  
  func pop() -> T {
    return items.removeLast()
  }
}

var stack1 = Stack<Int>()
stack1.push(10)
stack2.push(20)

var stack2 = Stack<String>()
var stack3 = Stack<Double>()
~~~

- 泛型是一种参数化类型的机制（类型占位符placeholder），为算法和类型的实现提供了：

  - 更高的复用性：
    - 避免了很多重复的代码，现在能够用一个类型占位符T来表示支持多种类型
  - 更强的安全性：
    - 如果不用泛型，用基类对象，比如Object，要不断检查放入的类型是否安全，是否符合标准
  - 更好的性能：
    - 如果基类对象，那么如果传入的是Int，还需要把Int包装为对象才能使用

- 泛型支持包括：

  - 函数
  - 类
  - 结构
  - 枚举

  ~~~swift
  // 泛型函数
  func swap<T>(inout first: T, inout second: T) {
    let temp = first
    first = second
    second = temp
  }

  var data1 = 100
  var data2 = 200
  swap(&data1, &data2) // 如果系统可以自动推断出，可以不用指定泛型的具体类型，只需交给编译器自动判断
  ~~~

#### 类型参数实例化

- “泛型类型的实例化”即用实际类型替换占位符。泛型类型参数实例化的过程可以采用自动类型推断
  - 也就是说把泛型T替换成Int的这个过程叫做泛型类型的实例化，不是对象的实例化
- Swift采用编译时泛型模型，即在编译时进行泛型类型的实例化，（C#是在runtime运行时实例化），产生新的类型码或者函数码
  - 如果类型参数是值类型，泛型实例化会为不同的值类型生成不同的类型码（尺寸不同）
  - 如果类型参数是引用类型，泛型实例化会为所有不同的引用类型生成同一份类型码（基于同等尺寸的指针）
- Java其实是一种假的泛型，它本质上还是一种基类Object的形式，只是在编译的时候进行了检查，检查是否满足该类型，如果遇到Int还是会把它包装成类。C++的泛型叫模板，和Swift类似，是在编译的时候进行泛型类型实例化的过程

~~~swift
// 查看一个泛型实例的动态类型
print(stack1.dynamicType) // 会输出“Stack<Int>”
~~~

~~~swift
// 以下三种合法
class ExStack1<T>: Stack<T> {
  
}

class ExStack2: Stack<Int> {
  
}

class ExStack<T>: Stack<Int> {
  
}
// 以下这种不合法
class ExStack<T>: Stack<U> {
  
}
~~~

#### 协议的关联类型

- Swift不支持泛型的协议（也就是java里面说的接口），但是可以通过关联类型实现：

~~~swift
protocol Container {
  typealias ItemType
  
  func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}

class Stack<T>: Container {
  typealias ItemType = T
  var items = [T]()
  
  func push(item: T) {
    items.append(item)
  }
}
~~~

- 通过typealias可以为protocol定义一到多个关联类型
- 在实现协议时，可将关联类型设置为泛型类型参数（或自动类型推断）
- 协议的关联类型可以看作是支持“泛型版的协议”

#### 泛型约束

~~~swift
func max<T: Comparable>(array: [T]) -> T {
  var value = array[0]
  
  for index in 1..< array.count {
    if array[index] > vaslue {
      value = array[index]
    }
  }
  return value
}
~~~

Comparable就是泛型类型参数的约束，告诉编译器T类型是支持比较的，这样就能够用比较运算符了

- 类型约束为泛型类型参数提供了更多的功能约定
- Swift要求**显式的类型约束**，编译器在泛型类型参数实例化时会检查约束的有效性（会看你具体使用的类型是不是支持你加上去的约束，不支持的话会报错）
- 泛型类型约束支持两类约束：
  - 基类约束（就是类，自己定义的或者系统的）
  - 协议约束（Comparable就是协议约束）
- Where子句约束：指定关联类型必须符合某种协议、或者和其他关联类型相等

~~~swift
func find<T: Container where T.ItemType: Equatable>(sequence: T, item: T.ItemType) -> Bool {
 for index 0..< sequence.count {
   if(sequence[index] == item) {
     return true
   }
 }
 return false
}
~~~

## 函数类型与闭包

#### 函数类型

- 函数类型定义：（参数类型1， 参数类型2， …）-> 返回值类型

~~~swift
// 函数类型
(Double, Double) -> Double
// 声明一个函数类型的变量
var compute: (Double, Double) -> Double

func add(x: Double, y: Double) -> Double {
  return x + y
}

func divide(x: Double, y: Double) -> Double {
  return x / y
}
compute = add
let result1 = compute(100, 200)

compute = divide
let result2 = compute(100, 200)
~~~



- 函数类型是一种引用类型，类似于函数指针。可以将函数类型应用于任何使用类型的地方：变量、参数、返回值

  ~~~swift
  // 声明一个函数类型的变量
  var compute: (Double, Double) -> Double
  // 函数类型的参数
  func process(math: (Double, Double) -> Double, x: Double, y: Double) {
    let result = math(x, y)
    print("result: \(result)")
  }
  process(multiply, x: 30, y: 50) // 传入一个函数名，只要函数类型相同
  // 函数类型的返回值
  func calculateFunction(symbol: String) -> (Double, Double) -> Double {
    
  }
  ~~~

- 函数类型实例化支持：

  - 全局函数
  - 嵌套函数

  ~~~swift
  func calculateFunction(symbol: String) -> (Double, Double) -> Double {
    func add(x: Double, y:Double) -> Double {
      return x + y
    }
    return add
  }
  ~~~

  - 成员函数（实例方法和静态方法）（就是类里面的静态方法成员和实例方法成员）
    - `compute = Matrix.invoke`

- 内存模型：函数指针p，存储在栈上是一个指针p，指向堆上的一个对象。对象分为两个部分，一个是对象指针，一个是函数指针q。如果这个函数指针p指向的是一个函数f，那么q就会指向这个函数f。如果p指向的是一个实例方法，那么对象指针指向实例对象，q指向实例方法。如果指向的是静态方法或者函数，那么对象指针就不用，为0~

  - `compute = matrix.process`
    - compute.object = matrix
    - compute.method = &process

#### 认识闭包 Closure

~~~swift
func compare(first: Rectangle, second: Rectangle) -> Bool {
  return first.width * first.length <= second.width * second.length
}
var rects = [Rectangle(width: 6, length: 7)
			Rectangle(width: 5, length: 8)
			Rectangle(width: 9, length: 6)]
			
rects.sort(compare) // compare是一个接受两个参数返回一个参数的函数的地址

// 上面这样写有些麻烦，可以转换成闭包表达式
rects.sort({ (first: Rectangle, second: Rectangle) -> Bool in 
	return first.width * first.length <= second.width * second.length
})
//整个闭包表达式构成了一个函数类型的实例
~~~



- 闭包，类似于Objective-C里面的block，C++/C#里面的Lambda表达式。Lambda表达式是一个匿名函数，即没有函数名的函数。Lambda表达式可以表示闭包。


- 闭包是函数类型的实例，一段自包含的代码块，可被用于函数类型的变量、参数或返回值
- 三种闭包方式：
  - 全局函数：具名函数，但不捕获任何值
  - 嵌套函数：在函数内部嵌套定义具名函数，可捕获包含函数中的值
  - 闭包表达式：匿名函数类型实例，不具名的代码块，可捕获上下文中的值（一般情况下我们所说的闭包就是闭包表达式）
- 闭包是引用类型，闭包变量拷贝具有引用语义。
- 闭包和函数类型实例拥有同样的内存模型（闭包和函数类型事实上就是同样的东西）

#### 闭包表达式

~~~swift
{ (参数1， 参数2...) -> 返回值类型 in
	语句块
}
~~~

- 完整型：

~~~swift
rects.sort({ (first: Rectangle, second: Rectangle) -> Bool in 
	return first.width * first.length <= second.width * second.length
})
~~~

- 几种简化缩写形式：

  - 自动类型判断：省略参数类型和返回值类型

  ~~~swift
  rects.sort({ first, second in
  	return first.width * first.length <= second.width * second.length
  })
  ~~~

  - 单表达式闭包可以省去return关键词(单表达式的意思是就是return语句只有一句话)——比较普遍

  ~~~swift
  rects.sort({ first, second in
  	first.width * first.length <= second.width * second.length
  })
  ~~~

  - 使用参数缩略形式$0, $1...省略参数声明和in（$0表示第一个参数，￥1表示第二个参数）——比较普遍

  ~~~swift
  rects.sort({ $0.width * $0.length <= $1.width * $1.length})
  ~~~

  - 将操作符函数自动推导为函数类型——用的不多

  ~~~swift
  rects.sort( <= )
  ~~~

  - 尾随闭包：当闭包表达式为函数最后一个参数，可将其写在括号后（为了代码的干净整洁）——比较常见

  ~~~swift
  rects.sort{
    first, second in
    first.width * first.length <= second.width * second.length
  }
  ~~~

  - 自动闭包：不接受任何参数，直接返回表达式的值。允许延迟计算。
    - 允许延迟计算的意思是本来filter是会立即计算的，这样可以延迟计算，到之后才去执行filter()

  ~~~swift
  var cities = ["Beijing", "Shanghai", "New York"]
  let filter = { cities.removeLast() } // filter的类型为无参数返回值为string的闭包的实例对象
  filter() // 这样表示执行了这个函数
  ~~~

#### 函数类型与闭包的变量捕获

- 函数类型和闭包可以捕获其所在上下文的任何值：

  - 函数参数
  - 局部变量

  ~~~swift
  func addHandler(step: Int) -> () -> Int {
    var sum = 0
    return {
      sum += step //捕获了函数参数和局部变量
      return sum
    }
  }
  ~~~

  - 对象实例属性
  - 全局变量
  - 类的实例属性

- 如果捕获值生存周期小于闭包对象（参数和局部变量），系统会将被捕获的值封装在一个临时对象里，然后在闭包对象上创建一个对象指针，指向该临时对象

- 临时对象和闭包对象之间是强引用关系，生存周期跟随闭包对象



## 类型扩展

#### 扩展 Extension

- Objective-C里面的扩展和Swift里面的扩展不一样，Swift里面的扩展相当于Objective-C里面的类别

- Objective-C里面：

  - #### 类别与扩展的区别

    - 类别是对外的，扩展是对内的
    - 类别只能添加方法，不能加属性和实例变量，因为这样会改变类的内存模型，扩展什么都可以加，可以改变一个类的内存模型的，它相当于实现类的时候的一个小技巧，相当于类的信息隐藏功能


- 扩展支持为现有类型增加功能（可以没有源代码），支持一下类型：
  - 类
  - 结构
  - 枚举
  - 协议

~~~swift
class Rectangle {
  
}

extension Rectangle {
  static var max = 100
  var z = 0// 错误的，不允许存放实例属性
  deinit { // 错误的，不允许增加析构器
    
  }
}
~~~

- 除了不能增加实例存储属性和析构器外，使用扩展可以增加：
  - 计算属性（实例属性和类型属性）
  - 类型存储属性
  - 方法（实例方法和类型方法）
  - 初始化器
  - 下标
  - 为类型实现协议
  - 内嵌类型

#### 使用扩展的注意点

- 扩展不可以增加实例存储属性，但可以增加类型存储属性。换言之，**扩展不能更改实例对象的内存模型**
- 扩展只能增加便捷初始化器，不能增加指定初始化器（只能调用基类或者原类的一个初始化器）

~~~swift
extension Rectangle {
  convenience init(x1: Int, x2: Int, y1: Int, y2: Int) {
  	let l = abs(x2 - x1)
  	let w = abs(y2 - y1)
    self.init(x: x1, y: y1, length: l, width: w)
  }
}
~~~

- 扩展中可以添加新的方法，但不可以override基类方法
- 结构和枚举的扩展，如果实例方法更改self，需要声明mutating

~~~swift
extension Point {
  mutating func moveTo(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}
~~~

#### 协议与扩展

- 扩展实现协议：在为类型实现扩展时，增加实现某些协议

  - 实现过程中必须实现协议的所有成员
  - 也可以添加实现非协议的成员

  ~~~swift
  extension Rectangle: Drawable { // 表示了一种对Rectangle类进行扩展，并且实现了协议Drawable
    
  }
  ~~~

- 扩展协议类型：可以扩展协议来提高方法和属性的默认实现

  - 协议扩展内的成员都必须提供默认实现，可以调用原协议内的成员
  - 所有遵守协议的类型自动继承这些默认实现，但可以提供自己独特的实现（不需要写override，直接再写一遍协议里面的方法并自己实现它）
  - 扩展协议时，也可以添加where子句约束（和泛型里面一样）

  ~~~swift
  extension Drawable {
    // 实现协议..
  }
  ~~~

#### 使用扩展协议

- 使用场景
  - 适合在没有源代码的情况下，向已经封装的类中添加方法或属性
  - 为一个类在某些特殊场景下**增加功能**
  - 对于复杂的大型文件分割实现（比如说系统类内的String就是这样，分割成了不同的很多个String的extension）
- 添加扩展
  - 自己创建的类
  - 系统的类
  - 第三方库

## 内存管理

#### 内存管理

- ARC是Swift默认的内存管理机制，其针对堆上的对象，由编译器自动生成操作引用计数的指令（retain或release）来管理对象的引用计数增加或减少。程序员无法手工控制
- 哪些类型的对象受ARC管理
  - 类 class
  - 闭包 closure（系统会为闭包创建一个不具名的引用类型的堆上的对象）
- 哪些对象不受ARC管理
  - 基础数值类型
  - 结构 struct
  - 枚举 enum
  - 元组 tuple

#### 关于Auto Release

- Swift远程对象不支持autorelease消息，也就没有必要使用Autorelease Pool来管理内存峰值
- 如果Swift调用Objective-C函数返回autorelease对象，那么如果出现内存峰值过高的风险，仍然需要使用Autorelease Pool来管理
- Autorelease Pool在Swift中使用尾随闭包形式实现

#### 循环引用与内存泄露

~~~swift
// 循环引用
class Computer {
  var name: String
  var display: Monitor?
  init(name: String) {
    self.name = name
  }
  deinit {
    
  }
}
class Mointor {
  var no: Int
  var device: Computer?
  init(no: Int) {
    self.no
  }
  deinit {
    
  }
}

var imac: Computer?
var screen: Monitor?
imac = Computer(name: "myiMac")
screen = Monitor(no: 29)

// A和B两个对象互指
imac!.display = screen 
screen!.device = imac

// 即使
imac = nil
screen = nil

// 堆上的两个对象依然循环引用
// 虽然栈上已经没有指针指向对象了
~~~

- 对象间的循环引用会造成ARC引用计数无法释放被引用的任何一个对象，从而造成内存泄露
- 解决循环引用造成的内存泄露有三种方式：
  - 在合适的地方，手动将循环引用解除`imac!.display = nil`或者`screen!.device = nil`
  - 如果允许对象引用为nil，课将引用声明为弱引用（weak）`weak var device: Computer?`
    - 弱引用ARC不计数这个弱引用指针
  - 如果不允许对象引用为nil ，可将对象声明为无主引用（unowned）`unowned var car: Car`
    - 无主引用也不参与ARC的引用计数
- 弱引用在对象被释放后，ARC会将引用置为nil。无主引用在对象被释放后，ARC不会设置nil，那么这个指针就指向一个空悬的（因为对象A已经被释放）区域，访问时会抛出运行时错误（空悬指针、僵尸指针）

#### 闭包的内存管理

- 如果闭包满足以下两个条件，将产生循环引用，造成内存泄露：

  - 闭包内使用实例成员，会捕获self，产生“从闭包对象 -> self 的引用”
  - 将闭包对象设置为self的属性，产生“从self -> 闭包对象的引用”

- 解决闭包产生的循环引用，有以下方式：

  - 手工解除循环引用`objectA?.printer = nil`——如果可以用手工方式解决，尽量用手工的方式
    - `lazy var printer: () -> () `lazy是推迟初始化，不是编译的时候初始化，而是等到执行的时候再初始化
  - 在捕获列表中指定[weak self]弱引用

  ~~~swift
  [weak self] in 
  self?.process("~~~")
  ~~~

  - 在捕获列表中指定[unowned self]无主引用

  ~~~swift
  [unowned self] in
  self?.process("~~~")
  ~~~

#### Weak-Strong Dance(弱引用与强引用之间的转换/跳转)

- 对象在弱引用或无主引用期间，随时“有可能”被释放，从而（如果是弱引用）导致弱引用为nil，或者（如果是无主引用）抛运行时错误

- 为了避免对象在弱引用使用期间，对象被释放可能导致nil的问题，可以使用weak-strong dance来解决，其核心是延长对象生存周期，确保对象不被释放，有两种方式：

  - 将弱引用临时转换为“强引用局部变量”

  ~~~swift
  if let strongRef = self {
    
  }
  ~~~

  - 使用withExtendedLifetime函数来延长弱引用对象生存周期

  ~~~swift
  withExtendedLifetime(self) {
    
  }
  ~~~

  ​























