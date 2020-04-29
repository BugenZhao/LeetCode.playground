// Dynamic Programming

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let count = cost.count
        var dp = [Int](repeating: 0, count: count)
        dp[0] = cost[0]; dp[1] = cost[1]
        for i in 2..<count {
            dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
        }
        return min(dp[count - 1], dp[count - 2]) // the last step does not cost
    }
}

Solution().minCostClimbingStairs([10, 15, 20])
Solution().minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
Solution().minCostClimbingStairs([1, 999])
Solution().minCostClimbingStairs([999, 1])
