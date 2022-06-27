//extensions

//1, 2, 3
extension Int {
    
    var isPositive: Bool {
        return self > 0
    }
    
    var isNegative: Bool {
        return self < 0
    }
    
    func returnBool() -> Bool {
        return self == 0 ? false : true
    }
    
    var numberOfSigns: Int {
        return self.isNegative ? String(self).count - 1 : String(self).count
    }
    
    subscript(number: Int) -> Int? {
        
        if number > self.numberOfSigns - 1 { return nil }
        let myNumber = self
        var times = 1
        if number > 0 {
            for _ in 1...number {
                times *= 10
            }
        }
        return (myNumber % (10 * times)) / times
    }
}

5.isPositive
5.isNegative
0.isPositive
0.isNegative
5.returnBool()
0.returnBool()
(-5).returnBool()
5.numberOfSigns
(78809).numberOfSigns
78809[5]

//2.

let myNumber = 126
var number0 = myNumber % 10
var number1 = (myNumber % 100) / 10
var number3 = (myNumber % 1000) / 100

extension String {

    subscript(someRange: ClosedRange<Int>) -> String {
        
        get{
            let myArray = Array(self)
            var myNewArray: [String.Element] = []

            for i in someRange {
                myNewArray.append(myArray[i])
            }
            return String(myNewArray)
        }
        
        set {
            let myArray = Array(self)
            var stringArray = myArray.map{"\($0)"}
            stringArray[someRange] = [newValue]
            self = stringArray.reduce("", +)
        }
    }
    
    subscript(someRange: Range<Int>) -> String {
        
        get{
            let stringArray = Array(self)
            var myNewArray: [String.Element] = []

            for i in someRange {
                myNewArray.append(stringArray[i])
            }
            return String(myNewArray)
        }
        
        set {
            let myArray = Array(self)
            var stringArray = myArray.map{"\($0)"}
            stringArray[someRange] = [newValue]
            self = stringArray.reduce("", +)
        }
    }
    
    func truncate(numberOfSigns: Int) -> String? {
        
        if numberOfSigns <= 0 {
            return nil
        }
        
        let stringArray = Array(self)
        var myNewArray: [String.Element] = []
        
        if numberOfSigns >= stringArray.count {
            return self
        } else {
    
            for i in 0...numberOfSigns - 1 {
                myNewArray.append(stringArray[i])
            }
            return String(myNewArray) + "..."
        }
    }
}

var mystr = "abcdefghi"
mystr[0..<5]
mystr[0...5]
mystr[0..<3] = "rrr"
mystr

//var myArray = Array(mystr)
//var myStringArray = myArray.map{"\($0)"}
//myStringArray[0..<5] = ["aaa"]
//myStringArray.reduce("", +)

var myNewString = "I want to eat ice-cream"
myNewString.truncate(numberOfSigns: 6)




