//Optional chaining
class Person{
    var mum: Person?
    var dad: Person?
    var brothers: [Person]?
    var sisters: [Person]?
    var sons: [Person]?
    var daughters: [Person]?
    var pet: Pet?
}

class Pet {
    func say() {
        
    }
}
class Cat: Pet {
    override func say() {
        print("Meow")
    }
}
class Dog: Pet {
    override func say() {
        print("Wow")
    }
}
class Crocodile: Pet {
    override func say() {
        print("RRRR")
    }
}

class Women: Person {
    func cookPancakes() {
        print("Cooks pancakes")
    }
}

class Man: Person {
    func moveChair() {
        print("Moves chair")
    }
}
var a = Women()
var b = Man()
var c = Man()
var d = Man()
var e = Women()
var f = Man()
var g = Man()
var h = Man()
var i = Women()
var j = Man()
var k = Man()
var l = Man()
var m = Man()
var n = Man()
var o = Women()
var p = Man()
var q = Man()
var r = Man()
var s = Man()
var t = Man()
var u = Women()
var v = Man()
var w = Man()
var x = Man()
var y = Women()
var z = Man()
v.brothers = [w, x, z]
v.sisters = [y]
w.brothers = [v, x, z]
w.sisters = [y]
v.dad = t
v.mum = u
v.brothers = [r, s, t]
u.brothers = [q]
u.mum = o
u.dad = n
u.sisters = [a, e]
o.brothers = [l, k]
l.sons = [b, c, d]
a.pet = Cat()
b.pet = Dog()
c.pet = Crocodile()
t.pet = Cat()
w.pet = Cat()
z.pet = Dog()

//uncles
var count = 0



if let countUncle1 = v.mum?.brothers?.count{
    count += countUncle1
}
if let countUncle2 = v.dad?.brothers?.count{
   count += countUncle2
}
print("Uncles \(count)")

//aunts
count = 0
if let countAunt1 = v.mum?.sisters?.count{
    count += countAunt1
}
if let countAunt2 = v.dad?.brothers?.count{
   count += countAunt2
}
print("Aunts \(count)")

//cousins
count = 0
if let countCousin1 = v.mum?.sisters?[0].sons?.count{
    count += countCousin1
}
print("Cousins \(count)")


let familyArray: [Person] = [a, b, c, d, e, f, g, h, i, g, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]
var countMan = 0
var countWomen = 0
var animalArray: [Pet] = []

for member in familyArray {
    if member is Man {
        let man = member as! Man
        man.moveChair()
        countMan += 1
    }
    if let women = member as? Women {
        women.cookPancakes()
        countWomen += 1
    }
    if let pet = member.pet {
        animalArray.append(pet)
    }
}
print(countMan, countWomen)
print(animalArray)
var countCat = 0
var countDog = 0
var countCrocodile = 0

for pet in animalArray {
    switch pet{
    case let someCat as Cat:
        countCat += 1
        someCat.say()
    case let someDog as Dog:
        countDog += 1
        someDog.say()
    case let someCrocodile as Crocodile:
        countCrocodile += 1
        someCrocodile.say()
    default: pet.say()
    }
}
