//
//  main.swift
//  Errorhandling
//
//  Created by WangJie on 2017/11/28.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

struct Item {
    let price: Int
    let count: Int
}

class VendingMachine {
    //
    var inventory = [
        "Candy Bar" : Item(price: 10, count: 2),
        "Chips" : Item(price: 10, count: 2),
        "Pretzels" : Item(price: 10, count: 2),
    ]
    var coinsDeposited = 0
}

//enum VendingMachineError: Error {
//    case invalidSelection
//    case insufficientFunds(coinsNeeded: Int)
//    case outOfStock
//}
//
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// Swift中的错误处理和其他语言中用try、catch和throw进行异常处理很想。不同的是，swift中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程，throw语句的性能特性是可以和return语句相媲美的

// * 用throwing函数传递错误
//func canThrowErrors() throws -> String {
//    // 一个throwing函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域
//    return "1"
//}
//func cannotThrowErrors() -> String {
//    return "1"
//}
/*
struct Item {
    var price: Int
    var count: Int
}

class VendingMaching {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Pretzels" : Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}
*/


