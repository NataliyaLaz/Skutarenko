import UIKit

let array:[CustomStringConvertible] = [6, 5.5, Float(6.6)]

switch array[2]{
case _ as Int:
    print("Int")
case _ as Double:
    print("Double")
case _ as Float:
    print("Float")
default:
    "I dont know"
}
//1.

let string = "It's a hard day today. I need to make a plan for my future studies. I need someone to help me to be sure in tomorrow. It's really hard to have really nobody to stimulate me. And 15th of July is soon.."
string.count

var numberOfVowels = 0
var numberOfConsonants = 0
var numberOfNumbers = 0
var numberOfSymbols = 0
var differentOtherSigns = 0
let vowels = "eyuioa"
let symbols = "!.,?:;'\'"


for char in string {
    switch char{
    case (let char) where char.isLetter && vowels.contains(char):
        numberOfVowels += 1
    case (let char) where char.isLetter && !vowels.contains(char):
        numberOfConsonants += 1
    case( let char) where char.isNumber:
        numberOfNumbers += 1
    case (let char) where symbols.contains(char):
        numberOfSymbols += 1
    default:
        differentOtherSigns += 1
    }
}
numberOfVowels
numberOfConsonants
numberOfNumbers
numberOfSymbols
differentOtherSigns

//2.

let age = 37

switch age{
case 0...6:
    print("Kindergarten")
case 7...16:
    print("school")
case 17...22:
    print("uni")
case 23...30:
    print("young specialist")
case 31...40:
    print("specialist")
case 41...60:
    print("senior")
case 60...:
    print("retired")
default:
    print("Strange age")
}

//3.
let name = "Nataliya"
let lastName = "Lazouskaya"
let parentName = "Dmitrievna"

switch (name, lastName, parentName){
case (let name, _, _) where "OA".contains(name[name.startIndex]):
    print(name)
case ( _, _, let parentName) where "VD".contains(parentName[parentName.startIndex]):
    print("\(name)"+" "+"\(parentName)")
case ( _, let lastName, _) where "EZ".contains(lastName[lastName.startIndex]):
    print(lastName)
//case (let name, _, _) where name.hasPrefix("A"):
//    print(name)
default:
    print("\(name)"+" "+"\(parentName)"+" "+"\(lastName)")
}

//4.
var desk = [String: Bool]()

for i in 1...10 {
    for j in 1...10 {
        desk["\(i)\(j)"] = false
        
    }
}

//print(desk)

var point = (1, 4)

switch point{
case (1, 4):
print("killed")
desk["14"] = true
case (5, 4) where desk["55"] == true:
print("killed")
desk["54"] = true
case (5, 4):
print("injured")
desk["54"] = true
case (5, 5) where desk["54"] == true:
print("killed")
desk["55"] = true
case (5, 5):
print("injured")
desk["55"] = true
case (8, 2):
print("killed")
desk["82"] = true
case (8, 5) where desk["95"] == true:
print("killed")
desk["855"] = true
case (8, 5):
print("injured")
desk["85"] = true
case (4, 8) where desk["58"] == true && desk["68"] == true:
print("killed")
desk["48"] = true
case (4, 8):
print("injured")
desk["48"] = true
case (5, 8) where desk["48"] == true && desk["68"] == true:
print("killed")
desk["58"] = true
case (5, 8):
print("injured")
desk["58"] = true
case (6, 8) where desk["48"] == true && desk["58"] == true:
print("killed")
desk["68"] = true
case (6, 8):
print("injured")
desk["68"] = true
default:
print("past")
}

//4. redone

let ship1 = (x: 1, y: 4, w: 1, h: 1)
let ship2 = (x: 5, y: 4, w: 1, h: 2)

switch point{
case (ship1.x...(ship1.x + ship1.w - 1), ship1.y...(ship1.y + ship1.h - 1)):
print("great")
case (ship2.x...(ship2.x + ship2.w - 1), ship2.y...(ship2.y + ship2.h - 1)):
print("great")
default:
    print("sorry")
}



switch point{
case (0...5,1...7):
    print("range is ok")
default:
    break
}


mainLoop: for i in 1...10 {
    for j in 1...10 {
        desk["\(i)\(j)"] = false
        if j == 2 { break mainLoop}
    }
}
