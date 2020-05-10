import Foundation

let tags: [Tag] = [.dp]

class Solution {
    struct Pair: Equatable, Hashable {
        let f1: Int
        let t1: Int
        let f2: Int
        let t2: Int
    }

    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)
        guard s1.count == s2.count else { return false }
        guard s1.count > 0 else { return true }
        let N = s1.count

        var memo = [Pair: Bool]()
        func worker(_ pair: Pair) -> Bool {
            guard memo[pair] == nil else { return memo[pair]! }
            guard pair.f1 != pair.t1 else { return s1[pair.f1] == s2[pair.f2] }
            guard s1[pair.f1...pair.t1].sorted() == s2[pair.f2...pair.t2].sorted() else { memo[pair] = false; return false }

            var ok = false
            let count = pair.t1 - pair.f1 + 1

            for len in 1...count - 1 {
                if ok { break }
                let left = worker(Pair(f1: pair.f1, t1: pair.f1 + len - 1, f2: pair.f2, t2: pair.f2 + len - 1))
                let right = worker(Pair(f1: pair.f1 + len, t1: pair.t1, f2: pair.f2 + len, t2: pair.t2))
                ok = ok || (left && right)
            }

            for len in 1...count - 1 {
                if ok { break }
                let left = worker(Pair(f1: pair.f1, t1: pair.f1 + len - 1, f2: pair.t2 - len + 1, t2: pair.t2))
                let right = worker(Pair(f1: pair.f1 + len, t1: pair.t1, f2: pair.f2, t2: pair.t2 - len))
                ok = ok || (left && right)
            }

            memo[pair] = ok
            return ok
        }

        return worker(Pair(f1: 0, t1: N - 1, f2: 0, t2: N - 1))
    }
}

let f = Solution().isScramble

f("great", "rgeat")
f("abc", "acb")
f("eeeee", "dddddd")
f("abcde", "caebd")
