import Foundation

let tags: [Tag] = [.math]

class SolutionEratosthenes {
    func countPrimes(_ n: Int) -> Int {
        guard n >= 3 else { return 0 }

        var isPrime = [Bool](repeating: true, count: n)
        var count = 0

        for i in 2..<n {
            guard isPrime[i] else { continue }
            count += 1

            var k = i * i
            while k < n {
                isPrime[k] = false
                k += i
            }
        }

        return count
    }
}

class SolutionEuler {
    func countPrimes(_ n: Int) -> Int {
        guard n >= 3 else { return 0 }

        var isPrime = [Bool](repeating: true, count: n)
        var primes = [Int]()
        primes.reserveCapacity(Int(Double(n).squareRoot()))

        for i in 2..<n {
            if isPrime[i] { primes.append(i) }
            for prime in primes {
                let toSieve = prime * i
                if toSieve >= n { break }
                isPrime[toSieve] = false

                //: When we first get here, it implies that
                //: we have sieved all composite nums whose least factor is `prime`
                if i.isMultiple(of: prime) { break }
            }
        }

        return primes.count
    }
}


let f = SolutionEratosthenes().countPrimes

f(2) == 0
f(10) == 4
f(100) == 25
