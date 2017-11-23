//
//  main.swift
//  Class&Struct
//
//  Created by WangJie on 2017/11/23.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

/*
    Swift中类和结构体的共同点：
    定义属性用于存储值
    定义方法用来提供功能
    定义下标操作使得可以通过下标语法来访问实例所包含的值
    定义构造器用来生成初始值
    通过扩展以增加默认实现的功能
    实现协议以提供某种标准功能
 
    类比结构体更强大：
    允许继承
    类型转换允许在运行时检查和解释一个类实例的类型
    析构器允许一个类实例释放任何其所被分配的资源
    引用计数允许对一个类的多次引用
 
    结构体没有引用计数
 */

// * 定义语法
class SomeClass {
    
}

struct SomeStruc {
    
}
// 每次定义一个新类和结构体的时候，实际上你是定义了一个新的swift类型，所以命名的时候注意首字母大写 -> Stirng Bool Int

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var frameRate = 0.0
    var name: String = ""
}

let reso = Resolution()
let vidm = VideoMode()
reso.width
reso.height

let re = Resolution(width: 10, height: 8)
// 结构体有逐一构造器，类没有

/* 结构体枚举和类的本质不同
    结构体和枚举是值类型：值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝，很多基本数据类型Integer Boolean String都是值类型并且底层都是以结构体的形式实现的
 
    类是引用类型：引用类型在被赋予给一个变量、常量或者被传递到一个函数时，其值不会被拷贝。引用的是已存在的实力本身而不是其拷贝

*/
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // 因为是结构体，cinema的值其实是hd的一个拷贝副本
cinema.width = 2048
print("cinema:\(cinema)...hd:\(hd)") // 可以看到改变cinema 并不会影响到hd

let vm = VideoMode()
vm.resolution = hd
vm.frameRate = 1.1
vm.name = "xxx"

let vm1 = vm
vm1.name = "ccc"

print(vm.name) // 改变vm1的名字同时改变了vm的名字
// tips: vm 和 vm1 都是常量类型，但你仍然可以改变类属性的值。这是因为vm 和 vm1并不存储类的实例，仅仅是类的引用

// * 恒等运算符 等价于=== 不等价于!== 运用这两个运算符检测两个常量或者变量是否引用同一个实例。=== 表示两个类类型的常量或者变量引用同一个类实例。 == 表示两个实例的值相等

if vm === vm1 {
    print("yes")
}

// 在Swift中许多基本数据类型，String Array Dictionary都是结构体而不是对象，







