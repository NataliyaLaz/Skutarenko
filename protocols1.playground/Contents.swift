import UIKit
//1.
protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable {
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

class MilkProduct: Storable, Food {
    
    var expired = false
    var kind: String!
    var name: String {
        return kind
    }
    var daysToExpire = 7
    
    init(kind: String){
        self.kind = kind
    }
    
    func taste() {
        print ("Tastes like in childhood")
    }
}

struct Bread: Food{
    
    var name  = "Croissant"

    func taste() {
        print( "The best test ever")
    }
}

enum Cake: String, Storable, Food {
    
    var daysToExpire: Int {
        return 5
    }
    
    var expired: Bool {
        return false
    }
    
    case Tiramisu = "Tiramisu"
    case CheeseCake = "CheeseCake"
    case BirdMilk = "BirdMilk"
    
    var name: String {
        return self.rawValue
    }
    
    func taste() {
        print("Soo sweet")
    }
}

let milk = MilkProduct(kind: "milk")
milk.expired = true
let cheese = MilkProduct(kind: "cheese")
let youghurt = MilkProduct(kind: "youghurt")
youghurt.daysToExpire = 1
let bread = Bread()
let cake1 = Cake.CheeseCake
let cake2 = Cake.Tiramisu
let cake3 = Cake.BirdMilk


var basket:[Food] = [milk, cheese, bread, cake1, cake2, youghurt, cake3]


func printBasket(basket: inout [Food]) {
    
    basket.sort{a, b in
        a.name.lowercased() < b.name.lowercased()}
    for product in basket {
        print(product.name)
        product.taste()
    }
}

func putInFridge(basket: inout [Food]) -> ([Storable & Food], [Food]){
    var fridge:[Storable & Food] = []
    var expired: [Storable & Food] = []
    var newBasket: [Food] = []
    
    for product in basket {
        if let frigeable = product as? Storable & Food {
            if frigeable.expired == false{
                fridge.append(frigeable)
            } else {
                expired.append(frigeable)
                continue
            }
        }
        newBasket.append(product)
    }
    fridge.sort{a, b in
       if a.daysToExpire != b.daysToExpire {
           return a.daysToExpire < b.daysToExpire
       } else {
            return a.name.lowercased() < b.name.lowercased()
        }
    }
    basket = newBasket
    return (fridge, basket)
}

printBasket(basket: &basket)
let (myFridge, myBasket ) = putInFridge(basket: &basket)

print("-----Basket-----")
for element in myBasket {
    print("\(element.name)")
}

print("-----Fridge-----")
for element in myFridge {
    print("\(element.name) + \(element.daysToExpire) ")
}




