import UIKit

func moveDisk(from: String, to: String) {
    print("\(from) - \(to)")
}

func hanoi(_ N: Int,
           from firstPeg: String = "A",
           to secondPeg: String = "B",
           using thirdPeg: String = "C") {
    if N == 1 {
        moveDisk(from: firstPeg, to: secondPeg)
    } else {
        hanoi(N - 1, from: firstPeg, to: thirdPeg, using: secondPeg)
        moveDisk(from: firstPeg, to: secondPeg)
        hanoi(N - 1, from: thirdPeg, to: secondPeg, using: firstPeg)
    }
}

hanoi(3)
