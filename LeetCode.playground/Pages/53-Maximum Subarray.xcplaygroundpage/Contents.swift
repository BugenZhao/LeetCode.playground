let tags: [Tag] = [.dp]

class SolutionDP {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var dp = [Int](repeating: 0, count: nums.count)
        // dp[i] represents the maximal sum of subarray ending up with the i-th char
        dp[0] = nums[0]

        for i in 1..<nums.count {
            // append nums[i], or drop all
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
        }
        return dp.max()!
    }
}

SolutionDP().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
