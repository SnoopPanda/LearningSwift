//
//  main.swift
//  TypeTransform
//
//  Created by WangJie on 2017/11/29.
//  Copyright © 2017年 SnoopPanda. All rights reserved.
//

import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley")
]// 数组library的类型被推断为[MediaItem]

// * 检查类型（is）
var movieCount = 0
var songCount = 0

for item in library {
    if item is Song {
        songCount += 1
    }else {
        movieCount += 1
    }
}

print("\(movieCount)+\(songCount)")

// * 向下转型
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    }else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

// * Any AnyObject : Any可以表示任何类型，包括函数类型 AnyObject可以表示任何类类型的实例
var things = [Any]()
things.append(100)
things.append(2.3)
things.append("str")
things.append((3.0, 5.0))
things.append(Movie(name: "G", director: "F"))

for thing in things {
    switch thing {
    case _ as Movie:
        print("an movie")
    case let x as Int:
        print("\(x)")
    default:
        print("other thing")
    }
}



