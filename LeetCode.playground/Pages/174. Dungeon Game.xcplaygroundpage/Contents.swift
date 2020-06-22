//: Backtracking Dynamic Programming
let tags: [Tag] = [.dp, .marked]

class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let (M, N) = (dungeon.count, dungeon[0].count)
        var dp = dungeon //: `dp[m][n]`: the minimum HP on `(m,n)`, which is up to `dp[m+1][n]` and `dp[m][n+1]`
        for i in (0..<M).reversed() {
            for j in (0..<N).reversed() {
                if i == M - 1, j == N - 1 { dp[i][j] = max(1, 1 - dungeon[i][j]) }
                else if i == M - 1 { dp[i][j] = max(1, dp[i][j + 1] - dungeon[i][j]) }
                else if j == N - 1 { dp[i][j] = max(1, dp[i + 1][j] - dungeon[i][j]) }
                else { dp[i][j] = max(1, min(dp[i][j + 1], dp[i + 1][j]) - dungeon[i][j]) }
            }
        }
        return dp[0][0]
    }
}

let f = Solution().calculateMinimumHP
f([[-2, -3, 3], [-5, -10, 1], [10, 30, -5]])
f([[-5]])
