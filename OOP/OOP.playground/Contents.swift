/// # OOP (Object Orientation Programming)
/// > Reference Guide: https://www.devmedia.com.br/os-4-pilares-da-programacao-orientada-a-objetos/9264

import Foundation


// ## Abstraction
class Dog {
    private var name: String
    private var size: Double
    private let breed: String
    private let age: Int

    var newName: String {
        get {
            name
        }
        set {
            if age < 1 {
                name = newValue
            } else {
                print("Too old for a new name!")
            }
        }
    }

    init(name: String, size: Double, breed: String, age: Int) {
        self.name = name
        self.size = size
        self.breed = breed
        self.age = age
    }

    func eat() {
        size += 0.1
    }

    func run() {
        size -= 0.05
    }

    func dogCollar() {
        print(name)
    }
}

let thor: Dog = Dog(name: "Thor", size: 18.5, breed: "Chow Chow", age: 8)
print(thor.dogCollar())

// ## Encapsulation

thor.newName = "Chor"
print(thor.dogCollar())

// ## Inheritance

class ChowChow: Dog {
    enum HairColor: String {
        case black
        case brown
        case white
    }
    let humor: Int
    let hairColor: HairColor

    init(humor: Int, hairColor: HairColor, name: String, size: Double, breed: String, age: Int) {
        self.humor = humor
        self.hairColor = hairColor
        super.init(name: name, size: size, breed: breed, age: age)
    }
}

let thor2: ChowChow = ChowChow(
    humor: 5, hairColor: ChowChow.HairColor.brown,
    name: "Thor", size: 18.5, breed: "ChowChow", age: 8
)

print(thor2.hairColor)
print(thor2.dogCollar())

// Polimorfism

class Bulldog: Dog {
    override func dogCollar() { }
}

let weed: Bulldog = Bulldog(name: "Weed", size: 25, breed: "Bulldog", age: 2)
print(weed.dogCollar())
