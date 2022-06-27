//ARC. Homework.

class Family {
    
    var familyArray: [Family] = []
    var mumArray: [Family] = []
    var kidsArray: [Family] = []
    
    init(){

    }
    
//    deinit {
//        print("Goodbye family")
//    }
//
    func addToFamily(member: Family) {
        familyArray.append(member)
    }
    
    func printFamily() {
            print(familyArray)
    }
    
    func printMum() {
        for member in familyArray{
            if let mum = member as? Mum {
                mumArray.append(mum)
            }
        }
        print(mumArray)
    }
    
    func printKids() {
        for member in familyArray{
            if let kid = member as? Kids {
                kidsArray.append(kid)
            }
        }
        print(kidsArray)
    }
}

class Dad: Family {
    
    weak var family: Family?
    var name = "Dad"
    var mum: Mum?
    var kid1: Kid1?
    var kid2: Kid2?
    var kid3: Kid3?

    deinit {
        print("Goodbye dad")
    }

    lazy var closure1: () -> () = {[weak self] in
        self?.family?.printFamily()
    }

    lazy var closure2: () -> () = {[weak self] in
        self?.family?.printMum()
    }

    lazy var closure3: () -> () = {[weak self] in
        self?.family?.printKids()
    }

    func buyMeToy() {
        print("Dad, buy me that toy")
    }
}

class Mum: Family{
    
    var name = "Mum"
    
    var kid1: Kid1?
    var kid2: Kid2?
    var kid3: Kid3?
    weak var dad: Dad?

    deinit {
        print("Goodbye mum")
    }

    func giveMeCandy() {
        print("Mum, give me that candy")
    }
}

class Kids: Family {
    
}

class Kid1: Kids{
    
    var name = "Kid1"
    
    weak var kid2: Kid2?
    weak var kid3: Kid3?
    weak var mum: Mum?
    weak var dad: Dad?
    
    deinit {
        print("Goodbye kid1")
    }
    
    func giveMeToy() {
        print("Kid1, give me that toy")
    }
}

class Kid2: Kids{
    
    var name = "Kid2"

    weak var kid1: Kid1?
    weak var kid3: Kid3?
    weak var mum: Mum?
    weak var dad: Dad?

    deinit {
        print("Goodbye kid2")
    }

    func giveMeToy() {
        print("Kid2, give me that toy")
    }
}

class Kid3: Kids{
    
    var name = "Kid3"

    weak var kid2: Kid2?
    weak var kid1: Kid1?
    weak var mum: Mum?
    weak var dad: Dad?
    
    deinit {
        print("Goodbye kid3")
    }

    func giveMeToy() {
        print("Kid3, give me that toy")
    }
}

if true {
    
    let family = Family()
    
    let dad = Dad()
    family.addToFamily(member: dad)
    dad.family = family
    
    let mum = Mum()
    family.addToFamily(member: mum)
    mum.dad = dad
    dad.mum = mum
    
    let kid1 = Kid1()
    family.addToFamily(member: kid1)
    kid1.mum = mum
    kid1.dad = dad
    mum.kid1 = kid1
    dad.kid1 = kid1
    
    let kid2 = Kid2()
    family.addToFamily(member: kid2)
    kid2.dad = dad
    kid2.mum = mum
    kid2.kid1 = kid1
    mum.kid2 = kid2
    dad.kid2 = kid2
    kid1.kid2 = kid2
    
    
    let kid3 = Kid3()
    family.addToFamily(member: kid3)
    kid3.dad = dad
    kid3.mum = mum
    kid3.kid1 = kid1
    kid3.kid2 = kid2
    mum.kid3 = kid3
    dad.kid3 = kid3
    kid1.kid3 = kid3
    kid2.kid3 = kid3
    
    family.printFamily()
    
    kid1.mum?.giveMeCandy()
    kid1.dad?.buyMeToy()
    kid2.mum?.giveMeCandy()
    kid2.dad?.buyMeToy()
    kid3.mum?.giveMeCandy()
    kid3.dad?.buyMeToy()
    kid1.kid2?.giveMeToy()
    kid1.kid3?.giveMeToy()
    kid2.kid1?.giveMeToy()
    kid2.kid3?.giveMeToy()
    kid3.kid1?.giveMeToy()
    kid3.kid2?.giveMeToy()
    
    dad.closure1()
    dad.closure2()
    dad.closure3()
    
    
    print("exit scope")
}

print("end")

