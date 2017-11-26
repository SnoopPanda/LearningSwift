//
//  main.swift
//  Deinit
//
//  Created by WangJie on 2017/11/26.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

// deinit只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit来标识

// 析构过程原理：swift通过自动引用计数arc处理内存管理
// 在类的定义中，每个类最多只能有一个析构器，而且析构器不能带任何参数
// 析构器是在实例释放发生前被自动调用，你不能主动调用析构器

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
