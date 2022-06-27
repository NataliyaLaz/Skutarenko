import UIKit

//1.

struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["kid1", "kid2", "kid3"]
    
    subscript(index: Int) -> String?{
        get{
            switch index{
            case 0: return father
            case 1: return mother
            case 2..<(2+kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            
            let value = newValue ?? ""
            
            switch index{
            case 0: father = value
            case 1: mother = value
            case 2..<(2+kids.count):kids[index - 2]  = value
            default: break
            }
        }
    }
    
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
}
var family = Family()
family[0]
family[2]
family[0] = "Daddy"
family.father
family[3]
family[3,"the great"]

struct Field {
    
    var dict = [String: String]()
    
    func keyForColumn(column:String, andRow row: Int) -> String{
        column + String(row)
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            dict[keyForColumn(column: column, andRow: row)]
        }
        set {
            dict[column + String(row)] = newValue
        }
    }
}

var field = Field()

field["a", 5]
field["a", 5] = "X"
field["a", 5]

//Home task

struct XOField {
    
    var x: Int = 0
    var y: Int = 0
    
    static var maxX = 3
    static var maxY = 3
    
    enum Object: String{
        case xObject = "X"
        case oObject = "O"
        case nothing = "_"
    }
    
    var dict = [String: Object]()
    
    subscript(x: Int, y: Int) -> Object{
        get {
            dict["\(x)" + "\(y)"] ?? .nothing
        }
        set {
            if (1...XOField.maxX).contains(x) && (1...XOField.maxY).contains(y) && newValue != .nothing && dict["\(x)" + "\(y)"] == .nothing {
                dict["\(x)" + "\(y)"] = newValue
            }
        }
    }
    
    func printField() {
        for i in 1...XOField.maxX{
            for j in 1...XOField.maxY{
                print(self[i,j].rawValue,terminator: "")
            }
            print("")
        }
    }
    
    mutating func makeNewField() {
        for i in 1...XOField.maxX{
            for j in 1...XOField.maxY{
                dict["\(i)" + "\(j)"] = XOField.Object.nothing
            }
        }
    }
}

var myField = XOField()
myField.makeNewField()
myField.printField()
myField[2,2] = .xObject
myField[2,2] = .oObject
myField.printField()


