//
//  main.swift
//  Properties
//
//  Created by WangJie on 2017/11/23.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

/*
 属性分为存储属性和计算属性
 计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。
 
 一个存储属性就是存储在特定类和结构体实例里面的一个常量或变量
 */

struct Dog {
    var name: String
    let age: Int
}

let dog = Dog(name: "hasaki", age: 10)
//dog.name = "ccc"
// 如果创建了一个结构体实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被生命为变量也不行。
// 这种行为是由于结构体属于值类型，当值类型的实例被声明为常量的时候，它的所有属性也就是常量了

// * 延迟存储属性
class DataImporter {
    
}

class DataManager {
    lazy var importer = DataImporter()
    // 只有在第一次被访问的时候才被创建
}

// * 计算属性
// 除存储属性外，类、结构体和枚举可以定义计算属性，不直接存储值，而是提供一个getter和一个可选的setter
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centery = origin.y + (size.height/2)
            return Point(x: centerX, y: centery)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width/2)
//            origin.y = newCenter.y - (size.height/2)
//        }
        set {
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

let rect = Rect(origin: Point(x: 1, y: 1), size: Size(width: 10, height: 11))
let center = rect.center

// * 只读属性 必须使用var定义计算属性，包括只读计算属性，因为它们的值不是固定的

struct Cuboid {
    var width = 0, height = 0, depth = 0
    var volume: Double {
        return Double(width*height*depth)
    } // 只读属性可以省略get关键字
}

// * 属性观察器 willSet didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("about to set totalsteps to\(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue)")
            }
        }
    }
}

let step = StepCounter()
step.totalSteps = 6

// * 全局变量和局部变量
// 全局的常量或变量都是延迟计算的，跟延迟存储属性相似但是不需要标记lazy

// * 类型属性
struct SomeStruct {
    static var p1 = "somevalue"
    static var p2: Int {
        return 1
    }
}

class SomeClass {
    static var p1 = "somevalue"
    static var p2: Int {
        return 10
    }
    
    class var overrideableP2: Int {
        return 108
    }
}

print(SomeStruct.p1)
SomeStruct.p1 = "anot"
print(SomeStruct.p1)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
