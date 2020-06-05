let tags: [Tag] = [.dfs, .graph]

class Solution {
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.isEmpty { return [] }
        let (M, N) = (matrix.count, matrix[0].count)
        var pacific = [[Bool]](repeating: .init(repeating: false, count: N), count: M)
        var atlantic = pacific

        (0..<M).forEach {
            pacific[$0][0] = true
            atlantic[$0][N - 1] = true
        }
        (0..<N).forEach {
            pacific[0][$0] = true
            atlantic[M - 1][$0] = true
        }

        //: Search **from ocean to land**
        func dfs(_ x: Int, _ y: Int, _ ocean: inout [[Bool]]) {
            ocean[x][y] = true
            [(-1, 0), (1, 0), (0, -1), (0, 1)].map { (x + $0, y + $1) }.forEach { xx, yy in
                if 0..<M ~= xx, 0..<N ~= yy, matrix[xx][yy] >= matrix[x][y], !ocean[xx][yy] {
                    dfs(xx, yy, &ocean)
                }
            }
        }

        (0..<M).forEach {
            dfs($0, 0, &pacific)
            dfs($0, N - 1, &atlantic)
        }
        (0..<N).forEach {
            dfs(0, $0, &pacific)
            dfs(M - 1, $0, &atlantic)
        }

        return (0..<M).flatMap { x in (0..<N).filter { y in pacific[x][y] && atlantic[x][y] }.map { y in [x, y] } }
    }
}


let f = Solution().pacificAtlantic

f([[1, 2, 2, 3, 5], [3, 2, 3, 4, 4], [2, 4, 5, 3, 1], [6, 7, 1, 4, 5], [5, 1, 1, 2, 4]])
f([])
f([[0]])
