//
//  main.swift
//  Closures
//
//  Created by WangJie on 2017/11/22.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

/*
 闭包表达式
 语法：
    {(parameters) -> returnType in
        statements
    }
 */

/*1. sorted函数的进化
let names = ["ab", "dc", "pd", "la"];

func backward(str1: String, Str2: String) -> Bool {
    return str1 > Str2;
}

//var sortedNames = names.sorted(by: backward)
//var sortedNames = names.sorted { (str1, str2) -> Bool in
//    return str1 > str2
//}
//var sortedNames = names.sorted { (str1, str2) in
//    return str1 > str2
//}
var sortedNames = names.sorted(by: >);

print(sortedNames)
 */

/*2. 尾随闭包
 当你需要将一个很长的闭包表达式作为参数传递给函数的时候，可以使用尾随闭包来增强函数的可读性
func someFunctionThatTakesAClosure(closure:() -> Void) {

}

someFunctionThatTakesAClosure(closure: {
    
})

someFunctionThatTakesAClosure() {
    
}

someFunctionThatTakesAClosure {
    
}
*/
/*3. 值捕获
 闭包可以在其被定义的上下文中捕获常量或变量，即使定义这些常量和变量的原作用域已经不存在
 
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementerByTen = makeIncrementer(forIncrement: 10)
print(incrementerByTen())
print(incrementerByTen())
print(incrementerByTen())
let incrementerBySeven = makeIncrementer(forIncrement: 7)
print(incrementerBySeven())
print(incrementerBySeven())
print(incrementerBySeven())

闭包是引用类型，let 命名的虽然是常量但是下面的值可以变化奇怪吗？不奇怪，引用类型地址并没有发生变化
 */
/*4. 逃逸闭包
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，这个闭包叫做逃逸闭包

var completionHandlers: [() -> Void] = []
func escapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func noescapingClosure(closure: () -> Void) {
    closure()
}

class Dog {
    var x = 10
    func somFunc() {
        escapingClosure {
            self.x = 100
        }
        noescapingClosure {
            x = 200
        }
    }
}

let d = Dog()
d.somFunc()
print(d.x)
completionHandlers.first?()
print(d.x)
 */
/*
 5. 自动闭包
 自动闭包是一种自动创建的闭包，用来包装传递给函数作为参数的表达式。
 */
var animals = ["dog", "cat", "pig", "sheep"]
print(animals.count)

let animalsFunc = {
    animals.remove(at: 0)
}
print(animals.count)
print(animalsFunc())
print(animals.count)

func someFunc(animalsFunc: () -> String) {
    print("Now \(animalsFunc())!")
}

someFunc { () -> String in
    animals.remove(at: 0)
}

func someFunc2(animalsFunc: @autoclosure() -> String) {
    print("now \(animalsFunc())!")
}

someFunc2(animalsFunc: animals.remove(at: 0))
