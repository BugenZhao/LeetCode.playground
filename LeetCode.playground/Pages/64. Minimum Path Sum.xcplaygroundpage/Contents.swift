let tags: [Tag] = [.dp]

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid.first!.isEmpty { return 0 }
        var dp = grid
        for i in grid.indices {
            for j in grid[i].indices {
                var result = Int.max
                if i > 0 { result = min(result, dp[i - 1][j]) }
                if j > 0 { result = min(result, dp[i][j - 1]) }
                dp[i][j] += result == Int.max ? 0 : result
            }
        }
        return dp.last!.last!
    }
}

Solution().minPathSum([
    [1, 3, 1],
    [1, 5, 1],
    [4, 2, 1]
    ])
