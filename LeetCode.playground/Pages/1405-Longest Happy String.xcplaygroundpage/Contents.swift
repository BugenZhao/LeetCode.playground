//: An extension of 984
let tags: [Tag] = [.greedy]

class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        typealias Pair = (count: Int, char: Character)
        var pairs = [Pair(a, "a"), Pair(b, "b"), Pair(c, "c")].sorted(by: { $0.count > $1.count })

        var result = ""
        let put = { (pair: inout Pair) -> Void in result.append(pair.char); pair.count -= 1 }

        //: always put the first two characters
        while pairs[1].count + pairs[2].count > 0 {
            put(&pairs[0])
            if pairs[0].count >= pairs[1].count && pairs[0].count > 0 { put(&pairs[0]) }
            if pairs[1].count > 0 { put(&pairs[1]) }
            pairs.sort(by: { $0.count > $1.count })
        }

        //: `cca,ccb,cc` instead of `cca,ccb`
        for _ in 0..<min(pairs[0].count, 2) { put(&pairs[0]) }

        return result
    }
}

let f = Solution().longestDiverseString

f(1, 1, 7)
f(2, 2, 1)
f(7, 1, 0)
f(3, 3, 3)
