//Binary operations. Bitwise. Unsigned.

extension UInt8 {
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}


var a: UInt8 = 57
a.binary()

/*
0b11111111
0xff
255
*/

a = 0b00111001
a.binary()
(5 as UInt8).binary()

a = a + 0b00000101
a.binary()
(4 as UInt8).binary()

a = a - 0b00000100
a.binary()

//a = a << 1// * 2
//a = a >> 1 // /2
//a = a * 8//умножение не говорит свифту, что мы работаем с битами, переполнили числo
a = a &* 4 // подтверждение, что мы понимаем, что делаем
a = a &* 2
a.binary()

a = 0b11111111
a = a &+ 1 // 9й бит отсекается

a = 0b00000000
a = a &- 1
a.binary()



// Signed
/*
extension Int8 {
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}


var a: Int8 = 57
a.binary()

a = 0b01111111
a = a &+ 1
a.binary()
a = a &- 1
a.binary()

a = 0
a = a - 1
a.binary()
a = a - 1
a.binary()

a = 0b00100001
a = a << 2
a.binary()

a = 0b00100001
a = a &* 4
a.binary()
*/

//Operations

var c: UInt8 = 0b00110011
var b: UInt8 = 0b11100001

c.binary()
b.binary()
(c | b).binary()

c.binary()
b.binary()
(c & b).binary()

c.binary()
b.binary()
(c ^ b).binary()

c.binary()
(~c).binary()


// установлен ли бит (yes - результат д.б. > 0)
// установлены ли 2 бита ( yes - результат д.б. = b, если != b, но > 0, то установлен только один)
c.binary()
b = 0b00010001
c.binary()
b.binary()
(c & b).binary()

//хотим установить бит, не важно, установлен ли он уже
c.binary()
b = 0b00000100
c.binary()
b.binary()
(c | b).binary()

//если бит установлен, сбросить, иначе установить
c.binary()
b = 0b00000110
c.binary()
b.binary()
(c ^ b).binary()

//сбросить бит
c.binary()
b = 0b00000010
c.binary()
b.binary()
(c & ~b).binary()

enum CheckList: UInt8 {
    case Bread = 0b00000001
    case Chicken = 0b00000010
    case Apples = 0b00000100
    case Pears = 0b00001000
}

let checkList: UInt8 = 0b00001001

let bread = checkList & CheckList.Bread.rawValue
let chicken = checkList & CheckList.Chicken.rawValue

// Homework

extension CheckList{
    
    func set(checkList: UInt8) -> UInt8{
        return (self.rawValue | checkList)
    }
    
    func check(checkList: UInt8) -> Bool {
        return (self.rawValue & checkList) > 0 ? true : false
    }
    
}

CheckList.Bread.set(checkList: 0b00000000).binary()
CheckList.Pears.set(checkList: 0b00000001).binary()
CheckList.Pears.check(checkList: 0b00001001)
CheckList.Apples.check(checkList: 0b00001001)

//2.
/*
for _ in 1...3 {
    var i = 0
    while i < 8 {
        let mask: UInt8 = 1 << i
        let result = mask.binary()
        print(result)
        i = i + 1
    }
    i = i - 2
    while i > 0 {
        let mask: UInt8 = 1 << i
        let result = mask.binary()
        print(result)
        i = i - 1
    }
}
 */

//3.
extension Int {
    
    func binary() -> String {
        var result = ""
        for i in 0..<64 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}
var emptyDesk: Int = 0b0000000000000000000000000000000000000000000000000000000000000000
var myDesk  = emptyDesk

for j in 0...7 {
    if j % 2 == 0 {
        for i in stride(from: 0, to: 8, by: 2){
            
            let mask: Int = 1 << (i + j * 8)
            myDesk = (myDesk | mask)
            //print(myDesk.binary())
            //print((emptyDesk | mask).binary())
        }
    } else {
        for i in stride(from: 1, to: 8, by: 2){
            
            let mask: Int = 1 << (i + j * 8)
            myDesk = (myDesk | mask)
            //print(myDesk.binary())
            //print((emptyDesk | mask).binary())
        }
    }
}
print(myDesk.binary())

enum Color {
    case White
    case Black
}

let letterDictionary = [ "A": 1,
                         "B": 2,
                         "C": 3,
                         "D": 4,
                         "E": 5,
                         "F": 6,
                         "G": 7,
                         "H": 8]

func checkColor(letter: String, number: Int) -> Color? {
    if (1...8).contains(number) {
        if let a = letterDictionary[letter] {
            let mask: Int = 1 << ((a - 1) + (number - 1) * 8)
            print(mask.binary())
            if (myDesk & mask) > 0 {
                return .Black
            } else { return .White}
        }
    }
    return nil
}
checkColor(letter: "B", number: 1)
