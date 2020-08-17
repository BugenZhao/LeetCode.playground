class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        let N = groupSizes.count
        var buckets = [[Int]](repeating: [], count: N + 1)
        for (i, s) in groupSizes.enumerated() { buckets[s].append(i) }
        return buckets.enumerated().dropFirst().flatMap { (i, b) -> [[Int]] in
            var pieces = [[Int]]()
            for j in 0..<b.count / i { pieces.append(Array(b[j * i..<(j + 1) * i])) }
            return pieces
        }
    }
}

let f = Solution().groupThePeople

f([3, 3, 3, 3, 3, 1, 3])
