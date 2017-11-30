//
//  main.swift
//  OptionalChaining
//
//  Created by WangJie on 2017/11/26.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

// 可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法
//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
//let roomCount = john.residence?.numberOfRooms
//
//if let roomCount = john.residence?.numberOfRooms {
//
//}elsle {
//
//}

//
class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numbersOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("\(numbersOfRooms)")
    }
    var address: Adress?
}

class Adress {
    
}

class Room {
    
}

let john = Person()

