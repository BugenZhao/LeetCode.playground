let tags: [Tag] = [.graph, .bfs]

class Solution {
    let ds = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        let (M, N) = (grid.count, grid[0].count)

        var grid = grid
        var queue = [(Int, Int)]()
        var fresh = 0
        for x in grid.indices {
            for y in grid[x].indices {
                if grid[x][y] == 2 { queue.append((x, y)) }
                else if grid[x][y] == 1 { fresh += 1 }
            }
        }

        var turn = -1
        while !queue.isEmpty {
            var next = [(Int, Int)]()
            for (x, y) in queue {
                for (xx, yy) in ds.map({ ($0 + x, $1 + y) })
                where 0..<M ~= xx && 0..<N ~= yy && grid[xx][yy] == 1 {
                    grid[xx][yy] = 2; fresh -= 1
                    next.append((xx, yy))
                }
            }
            queue = next
            turn += 1
        }

        return fresh == 0 ? max(turn, 0) : -1
    }
}

let f = Solution().orangesRotting

f([[2, 1, 1], [1, 1, 0], [0, 1, 1]])
f([[2, 1, 1], [0, 1, 1], [1, 0, 1]])
f([[0, 2]])
f([])
f([[0]])
