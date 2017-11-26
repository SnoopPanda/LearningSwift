//
//  main.swift
//  Init
//
//  Created by WangJie on 2017/11/25.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

struct Animal {
    var color: String
    init() {
        color = "White"
    }
    init(color: String) {
        self.color = color
    }
}

let animal = Animal()
let animal2 = Animal(color: "black")

// 可选属性类型，在类实例化的时候自动赋值nil

// 构造过程中常量属性可在构造过程中的人任意时间点给常量属性指定一个值，一旦常量属性被赋值，它将永远不可更改

// 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改，不能在子类中修改

// 默认构造器 如果结构体或类的所有属性都有默认值，同时没有自定义构造器，那么swift会给这些结构体或类提供一个默认构造器材
class Shop {
    var name:String = "xxx"
    var location: String = "BJ"
}

// 结构体的逐一构造器 如果结构体没有提供自定义的构造器
struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

let size = Size(width: 10, height: 10)

// 值类型的构造器代理
struct Rect {
    var origin = Point()
    var size = Size()
    init() {
        
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY), size:size)
    }
}
// 类的继承和构造过程 : 类里面的所有存储型属性——包括所有继承自父类的属性都必须在构造过程中设置初始值
// Swift为类类型提供了两种构造器来确保实例中所有的存储类型属性都能获得初始值，它们分别是指定构造器和便利构造器

// 指定构造器是类中最主要的构造器，一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化
// 每一个类都必须拥有至少一个指定构造器
// 便利构造器是类中比较次要的、辅助性的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。

// 语法
//init(params){
//
//}
//convenience init(params) {
//
//}

/*
 指定构造器和便利构造器之间的调用关系：
 指定构造器必须调用其直接父类的指定构造器
 便利构造器必须调用同类中定义的其他构造器
 便利构造器必须最终导致一个指定构造器被调用
  指定构造器必须总是向上代理
    便利构造器必须总是横向代理
 
 swift中类的构造过程：
 第一阶段 每个存储型属性被引入它们的类指定一个初始值，当每一个存储型属性的初始值被确定后，开始第二个阶段
 第二个阶段 它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性
 
 swift编译器执行4种有效的安全检查，确保两段式构造过程中不出错完成
 安全检查一
 指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其他构造任务向上代理给父类中的构造器
 安全检查二
 指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值，如果没这么做，指定构造器赋予的新值将被父类中的构造所覆盖
 安全检查三
 便利构造器必须先代理调用同一类中的其他构造器，然后再为仁矣属性赋新值，如果不这么做，便利构造器赋予的新值将被同一类中其他指定构造器所覆盖
 安全检查四
 构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值
 
 */
// 构造器的继承和重写
// 和OC不一样，swift中的子类默认情况下不会继承父类的构造器，这样可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例。 当你在编写一个和父类中指定构造器相匹配的子类构造器时，是在重写父类的指定构造器 需要加上override
class Person {
    var age = 0
    var description: String {
        return "now \(age)"
    }
}

class Student: Person {
//    override init() {
//        super.init()
//        age = 18
//    }
}

// 构造器的自动继承： 满足特定条件父类构造器是可以被自动继承的
// 规则一 如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器
// 规则二 如果子类提供了所有父类指定构造器的实现

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unnamed")
    }
}

let namedMeet = Food(name: "xxx")
// 类类型没有默认的逐一成员构造器，

// 可失败构造器
struct Teacher {
    let color: String
    init?(color: String) {
        if color.isEmpty {
            return nil
        }
        self.color = color
    }
}

let t = Teacher(color: "")

enum Menu {
    case Menu1, Menu2, Menu3
    init?(symbol: Int) {
        switch symbol {
        case 1:
            self = .Menu1
        case 2:
            self = .Menu2
        case 3:
            self = .Menu3
        default:
            return nil
        }
    }
}

// 构造失败的传递
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class Car: Product {
    let number: Int
    init?(name: String, number: Int) {
        if number < 1 {
            return nil
        }
        self.number = number
        super.init(name: name)
    }
}

// 重写一个可失败构造器
class Document {
    var name: String?
    init() {
        
    }
    init?(name: String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}

class MyDoc: Document {
    override init() {
        super.init()
        self.name = "Unknow"
    }
    override init?(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "Unknow"
        }else {
            self.name = name
        }
    }
}

// 可失败构造器 init! 通常我们使用init?来定义一个可失败构造器，但你也可以通过init!来定义，这种方式会构建一个对应类型的隐式解包可选类型的对象

// 必要构造器 required 表明所有该类的子类都必须实现该构造器
class SomeClass {
    required init() {
        
    }
}

class SubClass: SomeClass {
    required init() { // required在重写父类中必要的指定构造器时，不需要添加override修饰符
        
    }
}

// 通过闭包或函数设置属性的默认值
// 如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其他部分还没有初始化，这意味着你不能在闭包里访问其他属性，即使这些属性有默认值，你也不能使用隐式的self属性，或者调用任何实例方法
struct Checkerboard {
    let boardColors: [Bool] = {
       var tempBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                tempBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempBoard
    }()
}






