let tags: [Tag] = [.graph, .dfs]

class Solution {
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty { return }
        
        let (M, N) = (board.count, board[0].count)
        let ds = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var visited = [[Bool]](repeating: .init(repeating: false, count: N), count: M)

        func dfs(_ x: Int, _ y: Int) {
            visited[x][y] = true
            for (xx, yy) in ds.map({ (x + $0, y + $1) }) {
                if 0..<M ~= xx, 0..<N ~= yy, board[xx][yy] == "O", !visited[xx][yy] {
                    dfs(xx, yy)
                }
            }
        }

        for r in 0..<M {
            if board[r][0] == "O", !visited[r][0] { dfs(r, 0) }
            if board[r][N - 1] == "O", !visited[r][N - 1] { dfs(r, N - 1) }
        }
        for c in 0..<N {
            if board[0][c] == "O", !visited[0][c] { dfs(0, c) }
            if board[M - 1][c] == "O", !visited[M - 1][c] { dfs(M - 1, c) }
        }

        for x in 0..<M {
            for y in 0..<N {
                if !visited[x][y] { board[x][y] = "X" }
            }
        }
    }
}

var board: [[Character]] =
    [["X", "X", "X", "X"],
     ["X", "O", "O", "X"],
     ["X", "X", "O", "X"],
     ["X", "O", "X", "X"]]

Solution().solve(&board)
