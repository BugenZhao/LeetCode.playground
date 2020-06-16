let tags: [Tag] = [.dp, .working]
//: LeetCode Swift internal error

extension Array where Element == Int {
    func minTwo() -> ((Index, Element), (Index, Element)) {
        var (first, second) = ((-1, Int.max), (-1, Int.max))
        for pair in self.enumerated() {
            if pair.1 < first.1 { (first, second) = (pair, first) }
            else if pair.1 < second.1 { second = pair }
        }
        return (first, second)
    }
}

class Solution {
    func minFallingPathSum(_ arr: [[Int]]) -> Int {
        let (R, C) = (arr.count, arr[0].count)
        var dp = arr

        for r in 1..<R {
            let (first, second) = dp[r - 1].minTwo()
            for c in 0..<C {
                //: always take the minimal one from the last row, or the second minimal one due to "falling"
                dp[r][c] += c == first.0 ? second.1 : first.1
            }
        }
        return dp.last!.min()!
    }
}

let f = Solution().minFallingPathSum
f([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
f([[1]])
f([[2, 2, 1, 2, 2],
   [2, 2, 1, 2, 2],
   [2, 2, 1, 2, 2],
   [2, 2, 1, 2, 2],
   [2, 2, 1, 2, 2]])
