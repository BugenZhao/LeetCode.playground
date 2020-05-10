import Foundation

let tags: [Tag] = [.graph]

class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        guard N >= 2 else { return 1 }
        var dd = [Int](repeating: 0, count: N + 1)
        trust.forEach { e in dd[e[0]] -= 1 ; dd[e[1]] += 1 }

        if let first = dd.firstIndex(of: N - 1) {
            let last = dd.lastIndex(of: N - 1)!
            return first == last ? first : -1
        } else {
            return -1
        }
    }
}

let f = Solution().findJudge

f(4, [[1, 3], [1, 4], [2, 3], [2, 4], [4, 3]])
f(3, [[1, 2], [2, 3]])
f(3, [[1, 2], [1, 3]])
