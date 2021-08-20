/// # SOLID (Object Orientation Programming)
/// > Reference Guide: https://www.devmedia.com.br/os-4-pilares-da-programacao-orientada-a-objetos/9264

/// Single Responsibility Principle
/// Open/Closed Principle
/// Liskov Substitution Principle
/// Interface Segregation Principle
/// Dependency Inversion

import Foundation
import UIKit

/// S — Single Responsibility
///     A class should have a single responsibility

class SquareView {
    static func makeSquare() -> UIView {
        return UIView()
    }
}

class AnimateSquareView: UIView {
    func translateSquare() {

    }
}

/// O — Open-Closed Principle
///     Classes should be open for extension, but closed for modification
///     OCP is about locking the working code down but still keep it open somehow with some kind of extension points.

protocol Engine {
    func showType()
}

final class OffRoad: Engine {
    func showType() {
        print("OffRoad")
    }
}

final class OnRoad: Engine {
    func showType() {
        print("Road")
    }
}

public class Car {
    private let engineModel: Engine // OCP here

    init(model: Engine) {
        self.engineModel = model
    }

    func showType() {
        engineModel.showType()
    }
}

let car1 = Car(model: OffRoad())
car1.showType()
let car2 = Car(model: OnRoad())
car2.showType()


/// L — Liskov Substitution
///     If S is a subtype of T, then objects of type T in a program may be replaced with objects of type S without altering any of the desirable properties of that program.

protocol CarModel {
    func showType()
}

final class Audi: CarModel {
    func showType() {
        print("Audi")
    }
}

final class Jeep: CarModel {
    func showType() {
        print("Jeep")
    }
}

let carAudi: CarModel = Audi()
carAudi.showType()
let carJeep: CarModel = Jeep()
carJeep.showType()

/// I — Interface Segregation
///     Clients should not be forced to depend on methods that they do not use.

protocol Mammal {
    func hasHairandFur()
}
protocol Poisonous {
    func hasPoison()
}

class Lion: Mammal {
    func hasHairandFur() {}
}
class Ornithorhynchus: Mammal & Poisonous {
    func hasHairandFur() {}
    func hasPoison() {}
}
