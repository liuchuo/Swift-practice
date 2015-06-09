//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//在switch中使用范围匹配
let testscore = 80
var grade: Character
switch testscore {
case 90...100:
    grade = "优"
case 80..<90:
    grade = "良"
case 60..<80:
    grade = "中"
case 0..<60:
    grade = "差"
default:
    grade = "无"
}
println("Grade = \(grade)")

//在switch中比较元组类型
//var student = (id:"1002",name:"李四",age:32,ChineseScore:80,EnglishScore:89)
//var desc: String
//switch student {
//case(_,_,_,90...100,90...100):
//    desc = "优秀"
//case(_,_,_,80..<90,80..<90):
//    desc = "良"
//case(_,_,_,60..<80,60..<80):
//    desc = "中"
//case(_,_,_,60..<80,90...100),(_,_,_,90...100,60..<80):
//    desc = "偏科诶"
//case(_,_,_,0..<60,90...100),(_,_,_,90...100,60..<80):
//    desc = "严重偏科"
//default:
//    desc = "无"
//}
//println("\(desc)")
//这么反人类的设计，竟然不可以左开右闭和两边都是开区间


//值绑定
//var student = (id:"1002",name:"李四",age:32,ChineseScore:80,EnglishScore:89)
//var desc: String
//switch student {
//case(_,_,let age,90...100,90...100):
//    if(age > 30){
//        desc = "老优~"
//    } else {
//        desc = "小优~"
//    }
//case(_,_,_,80..<90,80..<90):
//    desc = "良~~！！~~"
//case(_,_,_,60..<80,60..<80):
//    desc = "中"
//case(_,_,_,60..<80,90...100),(_,_,_,90...100,60..<80):
//    desc = "偏科诶"
//case(_,_,_,0..<60,90...100),(_,_,_,90...100,60..<80):
//    desc = "严重偏科"
//default:
//    desc = "无"
//}
//println("\(desc)")

//where语句
var student = (id:"1002",name:"李四",age:32,ChineseScore:90,EnglishScore:99)
var desc: String
switch student {
case(_,_,let age,90...100,90...100) where age > 31:
    if(age > 30){
        desc = "老优~"
    } else {
        desc = "小优~"
    }
case(_,_,_,80..<90,80..<90):
    desc = "良~~！！~~"
case(_,_,_,60..<80,60..<80):
    desc = "中"
case(_,_,_,60..<80,90...100),(_,_,_,90...100,60..<80):
    desc = "偏科诶"
case(_,_,_,0..<60,90...100),(_,_,_,90...100,60..<80):
    desc = "严重偏科"
default:
    desc = "无"
}
println("\(desc)")
