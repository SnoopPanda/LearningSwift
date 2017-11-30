//
//  main.swift
//  Protocal
//
//  Created by WangJie on 2017/11/29.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

// 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性
// 协议不指定属性是存储型属性还是计算型属性，只指定属性的名称和类型
/*
protocol SomeProtocol {
    var mustBeSettable: Int {
        get set //可读 可写
    }
    var doesNotNeedToBeSettable: Int {
        get
    }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int {
        get set
    }
}
*/
// * 属性要求
protocol FullyNamed { // fullyNamed协议除了要求遵循协议的类型提供fullname属性 并没有其他要求
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person(fullName: "John")

// * 方法要求
//protocol SomeProtocol {
//    static func someTypeMethod() // 在协议中定义类方法的时候，总是使用static关键字作为前缀，当类类型遵守协议时候，除了static关键字，还可以使用class关键字作为前缀
//}

protocol RandomNumberGenerator {
    func random() -> Double
}
// * mutating方法
protocol Togglable { // 实现协议中的mutating方法时，若是类类类型，则不用写mutating关键字。而对于结构体和枚举，则必须写mutating关键字
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
// * 构造器要求
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass {
    init(someParameter: Int) { // 遵守协议的类中实现构造器，必须加上required

    }
}

class SomeSubClass: SomeClass, SomeProtocol {
    required override init(someParameter: Int) {
        super.init(someParameter: someParameter)
    }
}
// 如果类已经被标记为final，那么不需要在协议构造器的实现中使用required修饰符

// * 协议作为类型
/*
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random()*Double(sides))+1
    }
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

var d6 = Dice(sides: 5, generator: LinearCongruentialGenerator() as RandomNumberGenerator)
*/

protocol DiceGame {
//    var dice: Dice {get}
    func play()
}









