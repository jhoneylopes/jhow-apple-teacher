/// # Big O Notation | Using not-boring math to measure code's efficiency
/// > Reference Guide: https://www.interviewcake.com/article/python/big-o-notation-time-and-space-complexity

/*

 The idea behind big O notation
 Big O notation is the language we use for talking about how long an algorithm takes to run. It's how we compare the efficiency of different approaches to a problem.

 It's like math except it's an awesome, not-boring kind of math where you get to wave your hands through the details and just focus on what's basically happening.

 With big O notation we express the runtime in terms of—brace yourself—how quickly it grows relative to the input, as the input gets arbitrarily large.

 Let's break that down:

 how quickly the runtime grows—It's hard to pin down the exact runtime of an algorithm. It depends on the speed of the processor, what else the computer is running, etc. So instead of talking about the runtime directly, we use big O notation to talk about how quickly the runtime grows.
 relative to the input—If we were measuring our runtime directly, we could express our speed in seconds. Since we're measuring how quickly our runtime grows, we need to express our speed in terms of...something else. With Big O notation, we use the size of the input, which we call "nn." So we can say things like the runtime grows "on the order of the size of the input" (O(n)O(n)) or "on the order of the square of the size of the input" (O(n^2)O(n
 2
  )).
 as the input gets arbitrarily large—Our algorithm may have steps that seem expensive when nn is small but are eclipsed eventually by other steps as nn gets huge. For big O analysis, we care most about the stuff that grows fastest as the input grows, because everything else is quickly eclipsed as nn gets very large. (If you know what an asymptote is, you might see why "big O analysis" is sometimes called "asymptotic analysis.")
 If this seems abstract so far, that's because it is. Let's look at some examples.

 */

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
