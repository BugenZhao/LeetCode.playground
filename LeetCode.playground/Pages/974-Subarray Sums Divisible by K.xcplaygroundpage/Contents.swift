let tags: [Tag] = [.hash]

class Solution {
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        var prefixSum = [0] //: using first `i` elements
        var remCount = [Int](repeating: 0, count: K)
        remCount[0] = 1 //: no elements => 0

        A.forEach {
            let new = ((prefixSum.last! + $0) % K + K) % K
            remCount[new] += 1
            prefixSum.append(new)
        }

        return remCount.reduce(0) { $0 + $1 * ($1 - 1) / 2 }
    }
}

Solution().subarraysDivByK([4, 5, 0, -2, -3, 1], 5)
Solution().subarraysDivByK([2, 4, 6], 2)
Solution().subarraysDivByK([-10, 5], 5)
