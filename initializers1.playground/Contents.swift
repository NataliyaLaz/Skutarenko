


class Student5 {
    let maxAge: Int
    
    init() {
        maxAge = 100
    }
}
/*
class Student6: Student5 {
    override init() {
        super.maxAge = 110
    }
}
*/

struct Student7 {
    var firstName: String
    var lastName: String
    
    init() {
        firstName = ""
        lastName = ""
    }
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}
// Inheritane of inits

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
    
    func test() {
        
    }
}

let s1 = Student5()
let h1 = Human(weight: 70, age: 25)
let h3 = Human()

class Student: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        weight = 50
        test()
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        
        test()
        self.age = 28
    }
}

let student = Student(firstName: "Bob")
let student2 = Student(firstName: "Bob", lastName: "")
