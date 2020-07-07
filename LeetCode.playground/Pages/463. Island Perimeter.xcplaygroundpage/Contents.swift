class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        let (M, N) = (grid.count, grid[0].count)
        var ans = 0
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] == 1 {
                if j == 0 || grid[i][j - 1] == 0 { ans += 1 }
                if j == N - 1 || grid[i][j + 1] == 0 { ans += 1 }
                if i == 0 || grid[i - 1][j] == 0 { ans += 1 }
                if i == M - 1 || grid[i + 1][j] == 0 { ans += 1 }
            }
        }
        return ans
    }
}

Solution().islandPerimeter([
    [0, 1, 0, 0],
    [1, 1, 1, 0],
    [0, 1, 0, 0],
    [1, 1, 0, 0]
    ])
