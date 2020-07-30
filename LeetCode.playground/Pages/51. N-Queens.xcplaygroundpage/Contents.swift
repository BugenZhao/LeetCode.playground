let tags: [Tag] = [.dfs, .bit]

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        if n == 0 { return [] }

        var board = [[Bool]](repeating: .init(repeating: false, count: n), count: n)
        var freeCol = [Bool](repeating: true, count: n)
        //: diagonal
        var freeMain = [Bool](repeating: true, count: 2 * n - 1)
        var freeAnti = freeMain

        var ans = [[String]]()

        func worker(_ r: Int) {
            if r == n { ans.append(board.map { line in String(line.map { $0 ? "Q" : "." }) }); return }
            for c in 0..<n where freeCol[c] && freeMain[r + (n - 1 - c)] && freeAnti[r + c] {
                freeCol[c] = false; freeMain[r + (n - 1 - c)] = false; freeAnti[r + c] = false
                board[r][c] = true
                worker(r + 1)
                board[r][c] = false
                freeCol[c] = true; freeMain[r + (n - 1 - c)] = true; freeAnti[r + c] = true
            }
        }

        worker(0)
        return ans
    }
}

(1...9).map {
    Solution().solveNQueens($0).count }
