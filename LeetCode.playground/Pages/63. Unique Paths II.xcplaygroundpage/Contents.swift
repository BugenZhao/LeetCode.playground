let tags: [Tag] = [.dp]

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let (m, n) = (obstacleGrid.count, obstacleGrid[0].count)
        var dp = [Int](repeating: 0, count: n)
        for i in dp.indices {
            if obstacleGrid[0][i] == 1 { break }
            dp[i] = 1
        }

        for i in 1..<m {
            if obstacleGrid[i][0] == 1 { dp[0] = 0 }
            for j in 1..<n { dp[j] = obstacleGrid[i][j] == 1 ? 0 : dp[j] + dp[j - 1] }
        }
        return dp.last!
    }
}



let f = Solution().uniquePathsWithObstacles

f([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
f([[1, 0, 0], [0, 1, 0], [0, 0, 0]])
f([[0, 0, 0], [0, 1, 0], [0, 0, 1]])
f([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
