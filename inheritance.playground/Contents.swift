//1.
class Artist {
    
    var name: String = ""
    var lastName: String = ""
    
    func performance() -> String {
        return ("Artist is doing smth")
    }
}

class Dancer: Artist {
    
    override func performance() -> String {
        return ("\(name) \(lastName) dances great!")
    }
}

class Singer: Artist {
    
    override func performance() -> String {
        return ("\(name) \(lastName) sings great!")
    }
}

class Musician: Artist {
    
    override func performance() -> String {
        return ("\(name) \(lastName) plays great!")
    }
}

class Painter: Artist {
    
    override var name: String {
        set{
            super.name = "Master"
        }
        get {
            return super.name
        }
    }
    
    override var lastName: String {
        set{
            super.lastName = "The gretest"
        }
        get {
            return super.lastName
        }
    }
    
    override func performance() -> String {
        return (name + " " + lastName + " paints great!")
    }
}
let dancer = Dancer()
let singer = Singer()
let musician = Musician()
let painter = Painter()
dancer.name = "Yegor"
dancer.lastName = "Sachkov"
singer.name = "Enrique"
singer.lastName = "Iglesias"
musician.name = "Ennio"
musician.lastName = "Morricone"
painter.name = "Pablo"
painter.lastName = "Picasso"

dancer.performance()
singer.performance()
musician.performance()
painter.performance()

var artists: [Artist] = [dancer, singer, musician, painter]

for person in artists {
    print(person.performance())
}

//2.
class Vehicle {
    
    var speed: Double {
        return 0
    }
    
    var capacity: Double {
        return 0
    }
    
    var priceOfOneRound: Double {
        return 0
    }
    
    func estimate(distance: Double, numberOfPeople: Double) -> (Double, Double, Double){
        let time = distance / speed
        let numberOfRounds = numberOfPeople / capacity
        let money = numberOfRounds * priceOfOneRound
        return( time, numberOfRounds, money)
    }
}

class Airplane: Vehicle {
    
    override var speed: Double {
        return 800
    }
    
    override var capacity: Double {
        return 200
    }
    
    override var priceOfOneRound: Double {
        return 10000
    }
}

class Ship: Vehicle {
    
    override var speed: Double {
        return 50
    }
    
    override var capacity: Double {
        return 2000
    }
    
    override var priceOfOneRound: Double {
        return 5000
    }
}

class Car: Vehicle {
    
    override var speed: Double {
        return 90
    }
    
    override var capacity: Double {
        return 5
    }
    
    override var priceOfOneRound: Double {
        return 100
    }
}

class Helicopter: Vehicle {
    
    override var speed: Double {
        return 300
    }
    
    override var capacity: Double {
        return 25
    }
    
    override var priceOfOneRound: Double {
        return 1000
    }
}

class Train: Vehicle {
    
    override var speed: Double {
        return 140
    }
    
    override var capacity: Double {
        return 500
    }
    
    override var priceOfOneRound: Double {
        return 5000
    }
}
let airplane = Airplane()
let ship = Ship()
let car = Car()
let helicopter = Helicopter()
let train = Train()

let vehicleArray: [Vehicle] = [airplane, ship, car, helicopter, train]

for vehicle in vehicleArray {
    print(vehicle.estimate(distance: 100, numberOfPeople: 10000) )
}

//3.
class LivingBeings {
    
}


class Animals: LivingBeings {
    
}

class Quadrupeds: Animals {
    
}

class Reptiles: Quadrupeds{
    
}



class Human: LivingBeings {
    
}

class Monkey:Quadrupeds {
    
}

class Giraffe: Quadrupeds {
    
}

class Crocodile: Reptiles{
    
}

class Dog: Quadrupeds {
    
}

let human1 = Human()
let human2 = Human()
let dog1 = Dog()
let dog2 = Dog()
let giraffe1 = Giraffe()
let giraffe2 = Giraffe()
let monkey1 = Monkey()
let monkey2 = Monkey()
let crocodile1 = Crocodile()
let crocodile2 = Crocodile()

var livingBeingsArray = [LivingBeings]()
var quadrupedsArray = [Quadrupeds]()
var animalsArray = [Animals]()
var reptilesArray = [Reptiles]()

var myArray: [LivingBeings] = [human1, human2, dog1, dog2, giraffe1, giraffe2, monkey1, monkey2, crocodile1, crocodile2]

for creature in myArray {
    
    livingBeingsArray.append(creature)
    
    if let animal = creature as? Reptiles {
        reptilesArray.append(animal)
    }
    
    if let animal = creature as? Animals {
        animalsArray.append(animal)
    }
    
    if let animal = creature as? Quadrupeds {
        quadrupedsArray.append(animal)
    }
}
livingBeingsArray.count
animalsArray.count
quadrupedsArray.count
reptilesArray.count



