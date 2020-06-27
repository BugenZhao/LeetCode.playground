let tags: [Tag] = [.dp]

class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        let N = nums.count
        //: `dp[lo][hi]`: for numbers in `nums[lo...hi]`, how many scores can the first player get **more than** the second one?
        var dp = [[Int]](repeating: .init(repeating: 0, count: N), count: N + 1)
        for lo in (0..<N).reversed() {
            for hi in (lo + 1)..<N {
                //: take `nums[lo]` or `nums[hi]`, then it becomes the second-in-action player
                dp[lo][hi] = max(nums[lo] - dp[lo + 1][hi], nums[hi] - dp[lo][hi - 1])
            }
        }
        return dp[0][N - 1] >= 0
    }
}

let f = Solution().PredictTheWinner

f([1, 5, 2])
f([1, 5, 233, 7])
