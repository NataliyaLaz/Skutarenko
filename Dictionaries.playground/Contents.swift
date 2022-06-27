import Foundation

var dictionary = ["Miron Rabenka": 10, "Mikita Rabenka": 10, "Ihar Darutkin": 8, "Nataliya Lazouskaya": 2, "Hanna Lazouskaya": 7]

dictionary["Hanna Lazouskaya"] = 8
dictionary.updateValue(3, forKey: "Nataliya Lazouskaya")

dictionary["Alena Navitskaya"] = 7
dictionary["Leokadiya Kurilovich"] = 8
dictionary["Petr Petrov"] = 10

//print(dictionary)

dictionary.removeValue(forKey: "Petr Petrov")
dictionary["Alena Navitskaya"] = nil

//print(dictionary)

var sum = 0
for students in dictionary {
    sum += students.value
}
let averageGrade = Double(sum) / Double(dictionary.count)

print("Sum of grades = \(sum). Average grade = \(averageGrade)")

let monthsAndDays = ["Jan": 31, "Feb": 28, "March": 31, "Apr": 30, "May": 31, "Jun": 30, "Jul": 31, "Aug": 31, "Sep": 30, "Oct": 31, "Nov": 30, "Dec": 31]

print(monthsAndDays)

for (key, value) in monthsAndDays {
    print("There are \(value) days in \(key).")
}

for key in monthsAndDays.keys {
    print("There are \(monthsAndDays[key]!) days in \(key).")
}
Array(dictionary.values)
Array(dictionary.keys)

let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let number = 8
var desk = [String: Bool]()

for i in 0..<number {
    let letter = Array(letters)[i]
    for j in 1...number {
        let stringKey = "\(letter)\(j)"
        desk[stringKey] = ((i+1) % 2 != (j) % 2 )
    }
}

print(desk)


//var arraushka = Array(repeating: false, count: 5)
//arraushka
