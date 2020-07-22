/// # Protocols
/// > Reference Guide: https://docs.swift.org/swift-book/LanguageGuide/Protocols.html

import UIKit

// Overall Protocols

protocol Dog {
    var name: String { get set }

    func eat()
}

struct ChowChow: Dog {
    enum HairColor {
        case black
        case brown
        case white
    }
    var name: String
    var hairColor: HairColor

    func eat() { }
}

struct Bulldog: Dog {
    var name: String

    func eat() {
    }
}

let thor: ChowChow = ChowChow(name: "Thor", hairColor: ChowChow.HairColor.brown)
let weed: Bulldog = Bulldog(name: "Weed")

let dogs: [Dog] = [thor, weed]

for dog in dogs {
    print(dog.name)
    if let chowChow = dog as? ChowChow {
        print(chowChow.hairColor)
    }
}

// Multiples Protocols

protocol Mammal { }

protocol Canine: Mammal {
    func findAGroup()
}
protocol Feline { }

struct Wolf: Canine {
    func findAGroup() {
        print("Looking for a group!")
    }
}

struct Lion: Feline, Mammal { }

class Cat: Feline, Mammal { }

// Optionals Functions Protocols

protocol Bird {
    func fly()
    func eat()
}

extension Bird {
    func fly() { }
}

struct Hawk: Bird {
    func eat() {

    }

    func fly() {
        print("Flying")
    }
}

struct Penguin: Bird {
    func eat() {

    }
}

// Exercise

protocol householdAppliance {
    var isOn: Bool { get set }
    var energyConsumptionKWH: Double { get set }
}

protocol Bluetooth {

}

protocol TV: householdAppliance {
    var size: CGSize { get set }
    var weight: Double { get set }
}

struct SamsungKU6000: TV {
    var isOn: Bool = false

    var energyConsumptionKWH: Double = 1289

    var size: CGSize = CGSize(width: 150, height: 100) // cm
    var weight: Double = 18.8
}

struct SamsungKU6200: TV {
    var isOn: Bool = false

    var energyConsumptionKWH: Double = 999

    var size: CGSize = CGSize(width: 144, height: 111) // cm
    var weight: Double = 15.2
}

let tvDoFelipe = SamsungKU6000(
    isOn: false, energyConsumptionKWH: 1111, size: CGSize(width: 111, height: 111), weight: 16.9
)
