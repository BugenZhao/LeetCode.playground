// Dynamic Programming

let tags: [Tag] = [.dp]

class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: max(3, n + 1))
        dp[0] = 1 ; dp[1] = 1; dp[2] = 2
        guard n >= 3 else { return dp[n] }

        for i in 3...n {
            (0...i - 1).forEach { dp[i] += dp[$0] * dp[i - 1 - $0] }
        }
        return dp[n]
    }
}

let f = Solution().numTrees

f(2)
f(3)
f(4)
f(0)
