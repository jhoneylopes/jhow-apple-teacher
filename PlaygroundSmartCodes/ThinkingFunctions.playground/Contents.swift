///
/// Thinking with Functions
///

///
/// Given a number which numbers divide that number between 0 - 999
/// Dado um número, quais são os divisores daquele número entre 0 e 999
///


// y % x == 0 => true
// x > y => false

func divisors(of number: Int, from: Int, to: Int) {
    if isAValidInterval(from, to) && isAValidNumber(number) {

        var divisors: [Int] = []

        for divisor in from...to {
            if divisor > 0 {
                if number % divisor == 0 {
                    divisors.append(divisor)
                }
            }
        }

        print("Divisores de \(number) são \(divisors)")
        return
    }
    print("Os dados fornecidos não são válidos")
}

func isAValidInterval(_ from: Int, _ to: Int) -> Bool {
    if from < 0 || to > 999 || from == to || from > to {
        return false
    }
    return true
}

func isAValidNumber(_ number: Int) -> Bool {
    return number > 0
}

// divisores(de: 245, entre: 0, ate: 999)
divisors(of: 245, from: 0, to: 999)
divisors(of: 2, from: 0, to: 999)
divisors(of: 45, from: 0, to: 999)
divisors(of: 5, from: 0, to: 999)
divisors(of: 777, from: 0, to: 999)
divisors(of: 245, from: 0, to: 999)
divisors(of: -223, from: 0, to: 999)
divisors(of: 0, from: 0, to: 999)
