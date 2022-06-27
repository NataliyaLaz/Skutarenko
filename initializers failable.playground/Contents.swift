import Foundation
import CoreGraphics

class Human {
    
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int){
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int){
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {}
}

enum Color: Int {
    case Black
    case White
    
    init?(_ value: Int){
        switch value {
        case 0: self = .Black
        case 1: self = .White
        default: return nil
        }
    }
}

let a = Color(20)
let b = Color(rawValue: 0)

struct Size{
    var width: Int
    var height: Int
    
    init? (width: Int, height: Int){
        self.width = width
        self.height = height
        if height < 0 || width < 0 {
            return nil
        }
    }
}

class Friend: Human{
    
    var name: String!
    
    var skinColor: Color = {
        let color = Color(rawValue: Int.random(in: 0...1))
        return color!
    }()
    
    init?(name: String){
        self.name = name
        super.init(weight: 0, age: 0)
        if name.isEmpty {
            return nil
        }
    }
    
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
}
let f = Friend(name: "a")
f?.name
let f1 = Friend(name: "b")
f1!.skinColor
let f2 = Friend(name: "c")
f2!.skinColor
let f3 = Friend(name: "d")
f3!.skinColor
let f4 = Friend(name: "e")
f4!.skinColor
let f5 = Friend(name: "f")
f5!.skinColor

class BestFriend: Friend {
    
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
        super.init()
    }
    
    deinit {
        
    }
}

//let random = arc4random_uniform(2)
