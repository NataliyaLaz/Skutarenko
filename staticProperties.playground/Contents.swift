import UIKit

//1.

struct File {
    
    static var maxSize = 10.0
    
    enum FileType {
        case hidden
        case visible
    }
    
    var name: String
    var size: Double {
        didSet {
            if size > File.maxSize {
                size = oldValue
            }
        }
    }
    var folderPath: String
    var path: String {
        folderPath + "/" + name
    }
    var fileType:FileType
    
    lazy var content = "Some content"
}

var firstFile = File(name: "first.doc", size: 8, folderPath: "Documents",fileType: .visible)

firstFile.size = 10

firstFile.content
firstFile.path

//2.

enum ColorPalette: Int, CaseIterable{
    case first = 0x9FA8DA
    case second = 0x5C6BC0
    case third = 0x303F9F
    
    static var quantity: Int {
        return ColorPalette.allCases.count
    }
    
    static var firstColor: Int {
        return first.rawValue
    }
    
    static var lastColor: Int {
        return third.rawValue
    }
}
ColorPalette.quantity
ColorPalette.firstColor
ColorPalette.lastColor

//3.

class Human {
    static var count = 0
    
    static let maxAge = 100
    static let maxWeight = 300
    static let maxHeight = 250
    static let minAge = 0
    static let minHeight = 20
    static let minWeight = 1
    
    var name: String{
        didSet{
            name = name.capitalized
        }
    }
    var lastName: String
    var age: Int {
        didSet{
            if age > Human.maxAge || age < Human.minAge {
                age = oldValue
            }
        }
    }
    var height: Int
    var weight: Int
    

    
    init(name: String, lastName: String, age: Int, height: Int, weight: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.count += 1
    }
}
let firstMan = Human(name: "Bob", lastName: "Marley", age: 34, height: 159, weight: 77)
let secondMan = Human(name: "Norton", lastName: "Me", age: 65, height: 187, weight: 78)

Human.count
secondMan.name = "NOR"
secondMan.name
