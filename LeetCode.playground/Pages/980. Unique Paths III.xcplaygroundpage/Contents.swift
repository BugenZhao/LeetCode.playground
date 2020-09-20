let tags: [Tag] = [.graph, .dfs]

class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        let M = grid.count
        guard let N = grid.first?.count else { return 0 }

        var start = (0, 0)
        var count = M * N
        for (i, row) in grid.enumerated() {
            for (j, sq) in row.enumerated() {
                if sq == 1 { start = (i, j) }
                else if sq == -1 { count -= 1 }
            }
        }

        var grid = grid
        var ans = 0
        func dfs(_ x: Int, _ y: Int, _ rem: Int) {
            guard 0..<M ~= x, 0..<N ~= y, grid[x][y] >= 0, rem >= 0 else { return }
            if grid[x][y] == 2 {
                if rem == 0 { ans += 1 }
                return
            }

            grid[x][y] = -1
            for (dx, dy) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
                dfs(x + dx, y + dy, rem - 1)
            }
            grid[x][y] = 0
        }

        dfs(start.0, start.1, count - 1)
        return ans
    }
}


Solution().uniquePathsIII([[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 2, -1]])
