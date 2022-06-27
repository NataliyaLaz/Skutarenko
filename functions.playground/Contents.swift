import Darwin
import Foundation

//func doSmth(_ whatToDo: () -> () ) {
//    whatToDo()
//}
//
//func saySmth() {
//    print("Hi!")
//}
//
//doSmth(saySmth)
//
//let r = doSmth
//r(saySmth)
//
//
//func calculateMoney(in wallet: Int...) -> Int {
//
//    var sum = 0
//    for element in wallet{
//        sum += element
//    }
//    return sum
//}
//
//calculateMoney(in: 1,2,10,10,30)


//1.

func heart() -> String {
    "\u{2665}"
}
func anotherHeart() -> String {
    "\u{2764}"
}
func rabbit() -> String {
    "\u{1F407}"
}

print("I " + heart() + " my little " + rabbit() + ". With " + anotherHeart() + ".")

//2.

func chessBoard(letter: String, secondIndex: Int) -> String? {
    
    let letters = "ABCDEFGH"
    var firstIndex = 0
    let range = 1...8
    
    if letters.contains(letter) && range.contains(secondIndex) {
        
        for element in letters {
            firstIndex += 1
            if String(element) == letter {
                break
            }
        }
    }
    return firstIndex % 2 == secondIndex % 2 ? "black" : "white"
}

let color = chessBoard(letter: "A", secondIndex: 3)
print(color)

//3.

func reverseArray(_ array:[Any]) -> [Any] {
    array.reversed()
}

func makeReverse(sequence: Any...) -> [Any] {
    return reverseArray(sequence)
}

makeReverse(sequence: "d", "r", "e", "a", "r")


//4.
var array: [Any] = [1, 3, 5, 7, 0]


func changeArray( array: inout [Any]){
    array.reverse()
}
array
changeArray(array: &array)
array


//5.

let vowels = "eyuoia"
let consonants = "qwrtpsdfghkjlzxcvbnm"
let symbols = "!.,':;&?"
let dict = [1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine", 0: "zero"]
dict[Int(String("2"))!]

var ourString = "What a great idea to buy 100 400 Cats!"

func changeString(string: inout String) -> String {
    var indexOfElement = 0
    
    for element in string {
        
        let currentIndex = string.index(string.startIndex, offsetBy: indexOfElement)
        
        switch element {
        case (let element) where vowels.contains(element):
            let changing = Character(string.remove(at: currentIndex).uppercased())
            string.insert(changing, at: currentIndex)
        case (let element) where consonants.uppercased().contains(element):
            let changing = Character(string.remove(at: currentIndex).lowercased())
            string.insert(changing, at: currentIndex)
        case (let element) where symbols.contains(element):
            string.remove(at: currentIndex)
            string.insert(Character(" "), at: currentIndex)
        case(let element) where element.isNumber:
            string.remove(at: currentIndex)
            let insertedString = dict[Int(String(element))!]!
            string.insert(contentsOf: insertedString, at: currentIndex)
            indexOfElement += insertedString.count - 1
        default: break
        }
        
        indexOfElement += 1
    }
    
    return string
}

changeString(string: &ourString)

//recursion

func factorial(number: Int) -> Int {
    if number <= 1 { return 1}
    return number * factorial(number: number - 1)
}

factorial(number: 3)
