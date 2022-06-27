import Foundation

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int]{
    var filtered = [Int]()
    for value in array {
        if f(value) {
            filtered.append(value)
        }
    }
    return filtered
}
/*
func compare(i:Int) -> Bool {
    return i % 2 == 1
}
*/
filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 0
})

//MARK: - simple form
//TODO: -
//FIXME: -

filterArray(array: numbers, f: {i in
    return i % 2 == 1
})

filterArray(array: numbers, f: {i in
    i % 2 == 1
})

let a =
filterArray(array: numbers, f: {$0 % 3 == 0})

let a2 =
filterArray(array: numbers){$0 % 3 == 0}


//MARK: - Example

let array = [1, 2, 3, 5, 7, 123]

var count = 0

filterArray(array: numbers){value in
    
    for include in array {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}

count

count = 0

var dict = [Int: Bool]()

for value in array {
    count += 1
    dict[value] = true
}



filterArray(array: numbers){value in
    count += 1
    return dict[value] != nil
}

count

//MARK: - Homework
//1.

func someFunc(closure: () -> ()) -> Void{
    closure()
    for i in 1...5 {
        print(i)
    }
    closure()
}


someFunc {
    print("1000")
}

//2.
let arrayToSort = [1, 2, 3, 7, 9, 4, 7]
let ar1 =
arrayToSort.sorted(by: <)
let ar2 =
arrayToSort.sorted{$0 > $1}

//3.

let arrayToTry = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

func myFunc(array: [Int], closure:(Int, Int?) -> Bool ) -> Int? {
    var opt: Int? = nil
    for number in array {
        if closure(number, opt){
            opt = number
        }
    }
    return opt
}

myFunc(array: arrayToTry) { a, b in
    guard let bUnwrapped = b else { return true}
    return a > bUnwrapped
}

let max =
myFunc(array: arrayToTry) {
    $1 == nil || $1! < $0
}

//3a

var stringArray = "Hello World!"


func myFuncString(array: String, closure:(_ a: String, _ b: String?) -> Bool ) -> String? {
    var opt: String? = nil
    for letter in Array(array) {
        if closure(String(letter), opt){
            opt = String(letter)
        }
    }
    return opt
}

myFuncString(array: stringArray) { a, b in
    guard let bUnwrapped = b else { return true}
    return a > bUnwrapped
}


//4
let vowels1 = "aeyuioAEUYIO"
let consonants1 = "qwrtpsdfghjklzxcvbnmQWRTPSDFGHJKLZXCVBNM"
let numbers1 = "0123456789"
let anyString = "HeyHey! Baby Number54!"
var arrayString: [String] = []

for character in anyString{
    arrayString.append(String(character))
}


let firstArray = arrayString.filter { vowels1.contains($0)}.sorted(by:<).joined(separator: "")
firstArray
let secondArray = arrayString.filter { consonants1.contains($0)}.sorted(by:<).joined(separator: "")
secondArray
let thirdArray = arrayString.filter { numbers1.contains($0)}.sorted(by:<).joined(separator: "")
thirdArray
let fourthArray = arrayString.filter { !numbers1.contains($0) && !consonants1.contains($0) && !numbers1.contains($0)}.sorted(by:<).joined(separator: "")
fourthArray

let result = firstArray + secondArray + thirdArray + fourthArray


//4 right variant

func priority(string: String) -> Int {
    switch string.lowercased(){
    case "a","e","y","u","i","o": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
    
    
}
let string = "asdfnmyTTv/m"
var arrayOfString = [String]()
for char in string {
    arrayOfString.append(String(char))
}

let x = "1"
let y = "."

switch(priority(string: x), priority(string: y)){
case let(x1, y1) where x1 > y1: print(y)
case let(x1, y1) where x1 < y1: print(x)
default: print(x <= y ? x : y)
}

let sorted = arrayOfString.sorted {
    switch(priority(string: $0), priority(string: $1)){
    case let(x, y) where x < y: return true
    case let(x, y) where x > y: return false
    default: return $0.lowercased() <= $1.lowercased()
    }
}

let sorted2 = arrayOfString.sorted {
    priority(string: $0) < priority(string: $1)
}
