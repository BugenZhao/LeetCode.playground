let tags: [Tag] = [.dp, .greedy, .twoPtrs, .binSearch]

class SolutionDP {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let (s, t) = (Array(s), Array(t))
        var dp = [[Bool]](repeating: .init(repeating: true, count: t.count + 1), count: s.count + 1)
        (1..<s.count + 1).forEach { dp[$0][0] = false }
        for i in s.indices {
            for j in t.indices {
                dp[i + 1][j + 1] = s[i] == t[j] && dp[i][j] || dp[i + 1][j]
            }
        }
        return dp.last!.last!
    }
}

var f = SolutionDP().isSubsequence

f("abc", "ahbgdc")
f("axc", "ahbgdc")
f("acb", "ahbgdc")
f("", "")
f("", "a")
f("a", "")


class SolutionTwoPtrs {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let (s, t) = (Array(s), Array(t))
        var i = s.startIndex
        for j in t.indices {
            if i == s.endIndex { break }
            if s[i] == t[j] { i += 1 }
        }
        return i == s.endIndex
    }
}

f = SolutionTwoPtrs().isSubsequence

f("abc", "ahbgdc")
f("axc", "ahbgdc")
f("acb", "ahbgdc")
f("", "")
f("", "a")
f("a", "")


class SolutionLotsOfS {
    typealias Cache = [Character: [Int]]
    var positionCaches = [String: Cache]()

    func isSubsequence(_ s: String, _ t: String) -> Bool {
        //: store the positions where each char occurs
        let cache = positionCaches[t, default: t.enumerated().reduce(into: Cache()) {
                $0[$1.element, default: []].append($1.offset)
            }]

        var lastPosition = -1
        for c in s {
            //: is `c` in `t`?
            guard let positions = cache[c] else { return false }
            //: can we find a feasible position for `c` in `t` now?
            let index = positions.binarySearch(predicate: { $0 <= lastPosition })
            if index == positions.endIndex { return false }
            lastPosition = positions[index]
        }
        return true
    }
}

f = SolutionLotsOfS().isSubsequence

f("abc", "ahbgdc")
f("axc", "ahbgdc")
f("acb", "ahbgdc")
f("", "")
f("", "a")
f("a", "")
