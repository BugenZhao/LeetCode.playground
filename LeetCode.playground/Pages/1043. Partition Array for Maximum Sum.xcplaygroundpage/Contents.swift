let tags: [Tag] = [.dp]

class Solution {
    func maxSumAfterPartitioning(_ A: [Int], _ K: Int) -> Int {
        var dp = A.map { _ in 0 }
        for i in A.indices {
            var curMax = 0
            //: consider how many numbers to take this time
            for k in 1...min(K, i + 1) {
                curMax = max(A[i - k + 1], curMax)
                dp[i] = max((i - k >= 0 ? dp[i - k] : 0) + curMax * k, dp[i])
            }
        }
        return dp.last!
    }
}

Solution().maxSumAfterPartitioning([1, 15, 7, 9, 2, 5, 10], 3)
