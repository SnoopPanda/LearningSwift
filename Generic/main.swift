//
//  main.swift
//  Generic
//
//  Created by WangJie on 2017/11/30.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

func swapTwoValues<T>(_ a:inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 6
var b = 5
swap(&a, &b)
print("\(a) + \(b)")
var str1 = "a"
var str2 = "b"
swap(&str1, &str2)

// 一般情况下，类型参数具有一个描述性名字，例如Dictionary<Key, Value>中key和value，Array<Element>中的Element。当没有任何意义的时候，通常使用单个字母来命名，例如T、U。注意驼峰命名规则

struct Stack<Element> {
    var array = [Element]()
    mutating func push(newElement: Element) {
        array.append(newElement)
    }
    
    mutating func pop() {
        array.removeLast()
    }
}

var s = Stack<String>()

// * 类型约束实践 <T: Equatable>
// * 关联类型
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
}




