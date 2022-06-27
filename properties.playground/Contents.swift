import Foundation

//1.

struct Student {
    
    struct DateOfBirth {
        var day: Int
        var month: Int
        var year: Int
    }
    var dateOfBirth = DateOfBirth(day: 01, month: 01, year: 2020)
    
    var firstName: String {
        willSet {
            print("\(newValue) will replace \(firstName)")
        }
        didSet {
            print("\(oldValue) was replaced by \(firstName)")
            firstName = firstName.capitalized
        }
    }
    
    var secondName: String {
        willSet {
            print("\(newValue) will replace \(secondName)")
        }
        didSet {
            print("\(oldValue) was replaced by \(secondName)")
            secondName = secondName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + secondName
        }
        set {
            let array = newValue.components(separatedBy: " ")
            firstName = array[0]
            secondName = array[1]
        }
    }
    
    var age: Int {
        if dateOfBirth.month <= 6 && dateOfBirth.day <= 6 {
            return 2022 - dateOfBirth.year
        } else {
            return 2022 - dateOfBirth.year - 1
        }
    }
    
    var numbersOfYearsOfStudies: Int {
        age <= 6 ? 0 : age - 6
    }
}
var student = Student(firstName: "Bob", secondName: "Marley")
student.firstName
student.secondName
student.firstName = "Mike"
student.firstName = "jOHN"
student.firstName
student.fullName = "bobby nortot"
student.firstName
student.secondName

student.dateOfBirth = Student.DateOfBirth(day: 7, month: 6, year: 1984)
student.dateOfBirth
student.age
student.numbersOfYearsOfStudies

//2.

struct LineSegment {
    
    struct Point {
        var x: Double
        var y: Double
    }
    
    var pointA = Point(x: 0, y: 0)
    var pointB = Point(x: 1, y: 1)
    
    var midPoint: Point {
        get {
            return Point(x: (pointA.x + pointB.x) / 2, y: (pointA.y + pointB.y) / 2)
        }
        set {
            let diffX = newValue.x - midPoint.x
            let diffY = newValue.y - midPoint.y
            pointA.x += diffX
            pointA.y += diffY
            pointB.x += diffX
            pointB.y += diffY
        }
    }
    
    var length: Double {
        get {
            return sqrt( pow((pointB.x - pointA.x), 2.0) + pow((pointB.y - pointA.y), 2.0))
        }
        set {
            let katet = abs(pointB.y - pointA.y)
            let gippo = length
            let angle = katet / gippo
            pointB.x = pointA.x + (newValue * sin(angle))
            pointB.y = pointA.y + (newValue * sin(1 - angle))
        }
    }
}

var lineSegment = LineSegment()
lineSegment.midPoint
lineSegment.length
//lineSegment.midPoint = LineSegment.Point(x: 1, y: 1)
lineSegment.pointA
lineSegment.pointB
lineSegment.length = 2.82842
lineSegment.pointA
lineSegment.pointB
lineSegment.length

