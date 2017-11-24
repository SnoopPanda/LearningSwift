//
//  main.swift
//  Methods
//
//  Created by WangJie on 2017/11/24.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

/*
 swift方法： 实例方法和类型方法。 类型方法与类方法相似。
 结构体和枚举也能够定义方法
 */

// * 实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

// * self属性
// 类型的每一个实例都有一个隐含属性self，完全等同于该实例本身
struct P {
    var x = 0.0, y = 0.0
    func rightX(x: Double) -> Bool {
        return self.x > x
    }
}

// * 在实例方法中修改值类型
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByx(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.2, y: 2.2)
somePoint.moveByx(deltaX: 2.2, deltaY: 3.3)

// 结构体和枚举是值类型，默认情况下值类型的属性不能在它的实例方法中被修改
// 注意不能在结构体类型的常量上调用可变方法

// * 在可变方法中给self赋值
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

// * 类型方法: 在方法的func关键字之前加上关键字static来指定类型方法，还可以用关键词class来允许子类重写父类的方法实现
class SomeClass {
    static func someTypeMethod() {
        //
    }
    class func otherTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()
SomeClass.otherTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}



class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "zs")
//player.complete(level: 1)
//print(LevelTracker.highestUnlockedLevel)

if player.tracker.advance(to: 6) {
    print("now 6")
}
