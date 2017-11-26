//
//  main.swift
//  ARCAutomaticReferenceCounting
//
//  Created by WangJie on 2017/11/26.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name)is being init")
    }
    deinit {
        print("\(name) is deinit")
    }
}

var person1: Person? = Person(name: "xxx")
var person2: Person?
var person3: Person?

person2 = person1
person3 = person1

person1 = nil
person2 = nil
person3 = nil

// 类实例之间的循环强引用
/*
class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Student?
    deinit {
        print("\(unit) is being deinit")
    }
}

class Student {
    let name: String
    init(name: String) {
        self.name = name
    }
    weak var apartment: Apartment? // 在循环引用的一端加上weak关键字
    deinit {
        print("\(name) is being deinit")
    }
}

var panda: Student?
var unit4A: Apartment?

panda = Student(name: "panda")
unit4A = Apartment(unit: "4A")
panda?.apartment = unit4A
unit4A?.tenant = panda
panda = nil
unit4A = nil
*/
// Swift提供了两种方法：weak reference 和 unowned reference 弱引用和无主引用
// 当ARC 设置弱引用为nil时，属性观察不会被触发
// 在使用垃圾收集的系统里，弱指针有时用来实现简单的缓冲机制，因为没有强引用的对象只会在内存压力触发垃圾收集时才被销毁，但是在ARC里，一旦值的最后一个强引用被移除，就会被立即销毁，这导致弱引用并不适合上面的用途

// 无主引用和weak类似，不同的是，无主引用在其他实例有相同或者更长的生命周期使用
/*
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var john: Customer?
john = Customer(name: "xxx")
john!.card = CreditCard(number: 10, customer: john!)
john = nil
*/
/*
Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。

Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。”
 */
// 两个属性的值都不允许为nil
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

var country = Country(name:"canada", capitalName: "ottawa")

// 闭包引起的循环引用
/*
class HTMLClass {
    let name: String
    let text: String?
    
    var asHTML: Void -> String {
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
}
*/
class HTMLElement {
    
    let name: String
    let text: String?
    
//    lazy var asHTML: () -> String = {
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }

    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
}
// Swift 只要在闭包内使用self的成员，就必须加上关键字

// 解决闭包引起的循环强引用
// 定义捕获列表 捕获列表中的每一项都由一对元素组成，一个元素是weak 或 unowned 关键字，另一个元素是类实例的引用，
// 如果被捕获的引用绝对不会变成nil，应该用无主引用， 而不是弱引用
