let tags: [Tag] = [.dp]

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        let (_, n) = (A.count, B.count)

        //: `dp[i][j]`: the answer for subarrays exactly starting from `A[i]` and `B[j]`
        var dp = [Int](repeating: 0, count: n + 1)
        var ans = 0
        for (_, c1) in A.enumerated().reversed() {
            for (j, c2) in B.enumerated() {
                dp[j] = c1 == c2 ? (dp[j + 1] + 1) : 0
                ans = max(ans, dp[j])
            }
        }
        
        return ans
    }
}


let f = Solution().findLength

f([1, 2, 3, 2, 1], [3, 2, 1, 4, 7]) == 3
f([0, 1, 1, 1, 1], [1, 0, 1, 0, 1]) == 2
