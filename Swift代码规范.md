# Swift代码规范

-  一行不要超过160个字符
- 左大括号不换行
- 运算符（ +  -  *  /  ==  !=  ->）左右加空格，

~~~swift
let myValue = 20 + (30 / 2) * 3
~~~

- 逗号、冒号的后面加空格，但遇到后面是小括号则不需要加空格

~~~swift
func insert(_ newElement: Element, atIndex i: Int) -> Int {
  
}

let myValue = [1, 2, 3, 4, 5]
~~~

- if else的else、do catch的catch，与大括号在同一行

~~~swift
if a == b {
  
} else {
  
}

do {
  
} catch {
  
}
~~~

- 跨多行函数声明要缩进

~~~swift
func myFunctionWithManyParameters(parameterOne: String,
                                  parameterTwo: String,
                                  parameterThree: String) {
    print("\(parameterOne) \(parameterTwo) \(parameterThree)")
}
~~~

- 跨多行if语句要缩进

~~~swift
if myFirstVariable > (mySecondVariable + myThirdVariable)
    && myFourthVariable == .SomeEnumValue {
    print("Hello, World!")
}
~~~

- 尽量避免多行断言，可以使用本地变量或者其他策略

~~~swift
let firstCondition = x == firstReallyReallyLongPredicateFunction()
let secondCondition = y == secondReallyReallyLongPredicateFunction()
let thirdCondition = z == thirdReallyReallyLongPredicateFunction()
if firstCondition && secondCondition && thirdCondition {

}
~~~

- 尽可能多使用let，少使用var
- 如果变量类型可以依靠推断得出，不建议声明变量时指名类型
- switch模块中不用显式使用break
- if语句左右不要使用小括号

~~~swift
if x == y {
  
}
~~~

- 不要使用as! 或 try!
- 在解析可选类型时，推荐使用 guard 语句，而不是 if 语句，因为 guard 语句可以减少不必要的嵌套缩进
- 如果需要在2个状态间做出选择，建议使用if 语句，而不是使用 guard 语句

~~~swift
// 推荐
if isFriendly {
    print("你好, 远路来的朋友！")
} else {
    print(“穷小子，哪儿来的？")
}

// 不推荐
guard isFriendly else {
    print("穷小子，哪儿来的？")
    return
}
print("你好, 远路来的朋友！")

~~~

- 即使文档注释只有一行，也要使用模块化格式 (/** */)
- 使用首字母大写的驼峰命名规则来命名枚举值

~~~swift
enum Shape {
  case Rectangle
  case Square
  case Triangle
  case Circle
}
~~~



- 尽可能的避免使用强制转换和强制解包
- 不要在 if 和 switch 条件两边或者 return 关键词上加 Objective-C 样式的圆括号
- 避免使用行尾分号，尽管这样是可以编译通过的。但是它们会让你的代码看起来很糟糕，而且用起来体验也很差。
- 版权声明应该被包含在所有源文件的顶部
- 笑脸

~~~swift
// 推荐：
:]

// 不推荐：
:)
~~~

- 用足够的空行把代码分割成合理的块
- 不要在一行结尾留下空白，也不要在空行留下缩进
- 文件结束时留一空行

