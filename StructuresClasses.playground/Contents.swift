//1. Structures
struct Student {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var grade: Float
}

var student1 = Student(name: "Petr", lastName: "Ivanov", yearOfBirth: 1984, grade: 4.5)
var student2 = Student(name: "Ivan", lastName: "Petrov", yearOfBirth: 1986, grade: 5.0)
var student3 = Student(name: "Olga", lastName: "Zaiceva", yearOfBirth: 1986, grade: 3.0)
var student4 = Student(name: "Alex", lastName: "Petrov", yearOfBirth: 1984, grade: 4.0)
var student5 = Student(name: "Roman", lastName: "Petrov", yearOfBirth: 1983, grade: 3.5)
var student6 = Student(name: "Ivanka", lastName: "Petrova", yearOfBirth: 1983, grade: 4.8)

var classOfStudents = [student1, student2, student3, student4, student5, student6]

func printStudents(array: [Student]) {
    for i in 0...array.count - 1 {
        print("\(i + 1). \(array[i].name) \(array[i].lastName). Year of birth is \(array[i].yearOfBirth). Average grade is \(array[i].grade)")
    }
}
//printStudents(array: classOfStudents)


func printStudentsGrade(array: [Student]) {
    let sortedArray = array.sorted {
        $0.grade > $1.grade
    }
    for i in 0...sortedArray.count - 1 {
        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
    }
}

//printStudentsGrade(array: classOfStudents)

func printStudentsLastName(array: [Student]) {
    let sortedArray = array.sorted {
        $0.lastName < $1.lastName
    }
    for i in 0...sortedArray.count - 1 {
        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
    }
}

//printStudentsLastName(array: classOfStudents)

func printStudentsLastAndName(array: [Student]) {
    let sortedArray = array.sorted {
        if $0.lastName != $1.lastName {
            return $0.lastName < $1.lastName
        } else {
            return $0.name < $1.name
        }
    }
   
    for i in 0...sortedArray.count - 1 {
        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
    }
}
//printStudentsLastAndName(array: classOfStudents)

var anotherClass = classOfStudents


for i in 0...anotherClass.count - 1 {
    anotherClass[i].grade = 0
}

//print(anotherClass)
//print(classOfStudents)

//2.

class StudentClass {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var grade: Float
    
    init(name: String, lastName: String, yearOfBirth: Int, grade: Float) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.grade = grade
    }
}

var student1Class = Student(name: "Petr", lastName: "Ivanov", yearOfBirth: 1984, grade: 4.5)
var student2Class = Student(name: "Ivan", lastName: "Petrov", yearOfBirth: 1986, grade: 5.0)
var student3Class = Student(name: "Olga", lastName: "Zaiceva", yearOfBirth: 1986, grade: 3.0)
var student4Class = Student(name: "Alex", lastName: "Petrov", yearOfBirth: 1984, grade: 4.0)
var student5Class = Student(name: "Roman", lastName: "Petrov", yearOfBirth: 1983, grade: 3.5)
var student6Class = Student(name: "Ivanka", lastName: "Petrova", yearOfBirth: 1983, grade: 4.8)

var classOfStudentsClass = [student1Class, student2Class, student3Class, student4Class, student5Class, student6Class]

//func printStudentsClass(array: [Student]) {
//    for i in 0...array.count - 1 {
//        print("\(i + 1). \(array[i].name) \(array[i].lastName). Year of birth is \(array[i].yearOfBirth). Average grade is \(array[i].grade)")
//    }
//}
//printStudentsClass(array: classOfStudentsClass)


//func printStudentsGradeClass(array: [Student]) {
//    let sortedArray = array.sorted {
//        $0.grade > $1.grade
//    }
//    for i in 0...sortedArray.count - 1 {
//        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
//    }
//}
//
//printStudentsGradeClass(array: classOfStudents)

//func printStudentsLastNameClass(array: [Student]) {
//    let sortedArray = array.sorted {
//        $0.lastName < $1.lastName
//    }
//    for i in 0...sortedArray.count - 1 {
//        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
//    }
//}
//
//printStudentsLastNameClass(array: classOfStudentsClass)

//func printStudentsLastAndNameClass(array: [Student]) {
//    let sortedArray = array.sorted {
//        if $0.lastName != $1.lastName {
//            return $0.lastName < $1.lastName
//        } else {
//            return $0.name < $1.name
//        }
//    }
//
//    for i in 0...sortedArray.count - 1 {
//        print("\(i + 1). \(sortedArray[i].name) \(sortedArray[i].lastName). Year of birth is \(sortedArray[i].yearOfBirth). Average grade is \(sortedArray[i].grade)")
//    }
//}
//printStudentsLastAndNameClass(array: classOfStudentsClass)

var anotherClassClass = classOfStudentsClass


for i in 0...anotherClassClass.count - 1 {
    anotherClassClass[i].grade = 0
}
print(anotherClassClass)
print(classOfStudentsClass)

