let tags: [Tag] = [.dp]

class Solution {
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        let M = A.count; let N = B.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: M + 1)
        for i in 1...M {
            for j in 1...N {
                dp[i][j] = max(dp[i - 1][j - 1] + (A[i - 1] == B[j - 1] ? 1 : 0), dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[M][N]
    }
}

Solution().maxUncrossedLines([2, 5, 1, 2, 5], [10, 5, 2, 1, 5, 2])
Solution().maxUncrossedLines([1, 3, 7, 1, 7, 5], [1, 9, 2, 5, 1])
