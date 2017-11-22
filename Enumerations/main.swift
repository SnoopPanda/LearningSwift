//
//  main.swift
//  Enumerations
//
//  Created by WangJie on 2017/11/22.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

enum CompassPoint {
    case north
    case south
    case west
    case east
}
// tips: 与c和oc不同，swift的枚举成员在被创建时候不会被赋予一个默认的整型值。在上面的例子中，north south east west 不会被隐式转换为0 1 2 3，相反，这些枚举成员本身就是完备的值
enum Animal {
    case dog, cat, sheep, pig
}

var ani = Animal.dog
ani = .cat
print(ani)

switch ani {
    case .dog:
        print("dog")
    case .cat:
        print("cat")
    case .sheep:
        print("sheep")
    case .pig:
        print("pig")
}

var direction = CompassPoint.east
switch direction {
    case .west:
        print("west")
    default:
        print("default")
}
// tips: switch 必须穷举所有情况，少了任何一个都不能通过编译。不过当你不想写全的时候，最下面加一个default是可以的

