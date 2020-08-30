let tags: [Tag] = [.math, .union, .marked]

class Solution {
    static let primes: [Int] = {
        //: only pick primes that are `<= sqrt(100_000)` !!!
        let max = Int(Double(100_000).squareRoot())
    
        var isPrime = [Bool](repeating: true, count: max + 1)
        var primes = [Int]()
        for i in 2...max where isPrime[i] {
            primes.append(i)
            for j in stride(from: 2 * i, through: max, by: i) { isPrime[j] = false }
        }
        return primes
    }()

    func largestComponentSize(_ A: [Int]) -> Int {
        var primeToIndex = [Int: Int]()
        var uf = QuickUnionFind(A.count)
        for (this, a) in A.enumerated() {
            let tryUnion = { (prime: Int) in
                if let other = primeToIndex[prime] { uf.union(this, other) } //: the prime appeared before, union them
                else { primeToIndex[prime] = this } //: new one
            }
            var a = a
            for p in Solution.primes where a >= p {
                if a == 1 { break }
                if a.isMultiple(of: p) {
                    tryUnion(p)
                    while a.isMultiple(of: p) { a /= p }
                }
            }
            //: if `a` is not 1, then `a` must be a **prime** that is larger than `max = sqrt(100_000)`
            if a != 1 { tryUnion(a) }
        }
        return uf.sizeOf.max()!
    }
}


let f = Solution().largestComponentSize

f([4, 6, 15, 35])
f([20, 50, 9, 63])
f([2, 3, 6, 7, 4, 12, 21, 39])
f([1])
f([1, 2])
f([2, 4])

f([2, 7, 522, 526, 535, 26, 944, 35, 519, 45, 48, 567, 266, 68, 74, 591, 81, 86, 602, 93, 610, 621, 111, 114, 629, 641, 131, 651, 142, 659, 669, 161, 674, 163, 180, 187, 190, 194, 195, 206, 207, 218, 737, 229, 240, 757, 770, 260, 778, 270, 272, 785, 274, 290, 291, 292, 296, 810, 816, 314, 829, 833, 841, 349, 880, 369, 147, 897, 387, 390, 905, 405, 406, 407, 414, 416, 417, 425, 938, 429, 432, 926, 959, 960, 449, 963, 966, 929, 457, 463, 981, 985, 79, 487, 1000, 494, 508])
