
var playground = true

class Student {
    
    unowned let teacher: Teacher
    
    deinit {
        print("Goodbye student")
    }
    
    init(teacher: Teacher) {
        self.teacher = teacher
    }
}


class Teacher {
    
    var student: Student!
    
    var test: (() -> ())?
    
    lazy var test2 : (Bool) -> () = {[unowned self](a: Bool) in
        print(self.student)
        //print(self)
    }
    
    init(){
        self.student = Student(teacher: self)
    }
    
    deinit {
        print("Goodbye teacher")
    }
}

var closure: (() -> ())?

if playground {
    
   // var t: Teacher?
    
    var teacher = Teacher()
    
    teacher.test2(true)
    
    /*
    teacher.test = {[unowned teacher] in
        print(teacher)
    }
     */
    
    /*
    if playground {
        
        var student = Student(teacher: teacher)
        teacher.student = student
    }
    */
    
    /*
    var student = teacher.student
    
    closure = {[weak student] in
        print(student)
    }*/
        
    print("exit playground")
}




//closures

var x = 10
var y = 20

class Human {
    var name = "a"
}

var h = Human()

var closure3: () -> () =  {[x] in
    print("\(x) \(y)")
}

var closure2: (Int) -> Int = {[x, y, h] (a: Int) -> Int in
    
    print("\(x) \(y) \(h.name)")
    return a
}

closure2(5)

x = 30
y = 40
h = Human()
h.name = "b"

closure2(5)
print("end")

