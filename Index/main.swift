//
//  main.swift
//  Index
//
//  Created by WangJie on 2017/11/25.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

// 下标语法：允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取

// 语法
//subscript(index: Int) -> Int {
//    get {
//
//    }
//    set(newValue) {
//
//    }
//}

//struct TimesTable {
//    let multiplier: Int
//    subscript(index: Int) -> Int{
//        return multiplier * index // 只读下标
//    }
//}
//
//let threeTimesTable = TimesTable(multiplier: 10)
//print(threeTimesTable[6])

// * 下标选项 可以接受任意数量的入参

// * 继承
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

let someVehicle = Vehicle()
let someBike = Bicycle()
someBike.hasBasket = true


// * 重写 如果要重写某个特性，加上关键字override
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

class AutoCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

// 防止重写 final

