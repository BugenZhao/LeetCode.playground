let tags: [Tag] = [.dp]

class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        let (R, C) = (A.count, A[0].count)
        var dp = A

        for r in 1..<R {
            for c in 0..<C {
                var last = dp[r - 1][c]
                if c >= 1 { last = min(last, dp[r - 1][c - 1]) }
                if c < C - 1 { last = min(last, dp[r - 1][c + 1]) }

                dp[r][c] += last
            }
        }
        return dp.last!.min()!
    }
}

Solution().minFallingPathSum([[1, 2], [1, 2]])
Solution().minFallingPathSum([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
