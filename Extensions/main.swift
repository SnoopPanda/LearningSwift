//
//  main.swift
//  Extensions
//
//  Created by WangJie on 2017/11/29.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

// * extension(扩展) 语法
class SomeType {
    
}
extension SomeType {
    
}

// * 计算型属性

extension Double {
    var km: Double {return self*1_000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
}

let oneInch = 25.4.mm
print(oneInch)

// * 构造器 使用扩展给已有类型添加新的构造器
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point(x: 0, y: 0)
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// * 方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("haha")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(123413248[2])

