let tags: [Tag] = [.graph, .bfs]

class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let d = [
            [],
            [(0, -1), (0, 1)],
            [(-1, 0), (1, 0)],
            [(0, -1), (1, 0)],
            [(0, 1), (1, 0)],
            [(0, -1), (-1, 0)],
            [(0, 1), (-1, 0)]
        ]
        let (M, N) = (grid.count, grid[0].count)

        var visited = [[Bool]](repeating: .init(repeating: false, count: N), count: M)
        var queue = [(0, 0)]
        var head = queue.startIndex
        var ok = false

        while head < queue.endIndex {
            let (x, y) = queue[head]; head += 1
            if (x, y) == (M - 1, N - 1) { ok = true; break }
            visited[x][y] = true
            for (dx, dy) in d[grid[x][y]] {
                let (xx, yy) = (x + dx, y + dy)
                if 0..<M ~= xx, 0..<N ~= yy, !visited[xx][yy],
                    d[grid[xx][yy]].contains(where: { $0 == (-dx, -dy) }) { //: we can go back
                    queue.append((xx, yy))
                }
            }
        }

        return ok
    }
}


let f = Solution().hasValidPath
f([[2, 4, 3], [6, 5, 2]])
f([[1, 2, 1], [1, 2, 1]])
