let tags: [Tag] = [.hash]

class Solution {
    enum Position: Hashable {
        case row(_ n: Int, _ num: Character)
        case col(_ n: Int, _ num: Character)
        case box(_ r: Int, _ c: Int, _ num: Character)
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var set = Set<Position>()
        for i in 0..<9 {
            for j in 0..<9 {
                let num = board[i][j]
                if num == "." { continue }
                guard set.insert(.row(i, num)).inserted,
                      set.insert(.col(j, num)).inserted,
                      set.insert(.box(i / 3, j / 3, num)).inserted
                else { return false }
            }
        }
        return true
    }
}


Solution().isValidSudoku(
    [
      ["5","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","."],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".",".","7","9"]
    ]
)
