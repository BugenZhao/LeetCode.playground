import Foundation

let tags: [Tag] = [.graph]

class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        let M = matrix.count
        let N = matrix[0].count

        let dirs: [(r: Int, c: Int)] = [(0, -1), (0, 1), (-1, 0), (1, 0)]
        var results = [[Int]](repeating: [Int](repeating: -1, count: N), count: M)

        func worker(r: Int, c: Int) -> Int {
            guard results[r][c] == -1 else { return results[r][c] }

            let val = matrix[r][c]
            let result = dirs.map { dir -> Int in
                let nr = r + dir.r; let nc = c + dir.c
                if 0..<M ~= nr && 0..<N ~= nc && matrix[nr][nc] > val {
                    return worker(r: nr, c: nc) + 1
                } else { return 1 }
            }.max()!

            results[r][c] = result
            return result
        }

        var result = 0
        for r in 0..<M {
            for c in 0..<N {
                result = max(result, worker(r: r, c: c))
            }
        }

        return result
    }
}


let f = Solution().longestIncreasingPath

f([
    [9, 9, 4],
    [6, 6, 8],
    [2, 1, 1]
    ])

f([
    [3, 4, 5],
    [3, 2, 6],
    [2, 2, 1]
    ])

f([
    [1, 2, 3],
    [8, 9, 4],
    [7, 6, 5]
    ])

f([[1, 2]])
