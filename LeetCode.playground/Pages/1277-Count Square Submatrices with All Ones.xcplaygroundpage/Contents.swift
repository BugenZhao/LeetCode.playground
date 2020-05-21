let tags: [Tag] = [.dp, .marked]

class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let M = matrix.count
        let N = matrix[0].count
        
        //: the maximum side length of a square with point `(i+1, j+1)` in the lower right corner
        //: i.e., the # of squares (1, 2, ..., k)
        var maxLength = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: M + 1)
        var count = 0

        for i in 1...M {
            for j in 1...N {
                //: prove it through `LHS<=RHS` and `RHS<=LHS`
                maxLength[i][j] =
                    matrix[i - 1][j - 1] == 1 ?
                    (min(maxLength[i - 1][j - 1], maxLength[i - 1][j], maxLength[i][j - 1]) + 1) :
                    0
                count += maxLength[i][j]
            }
        }

        return count
    }
}

let f = Solution().countSquares

f([
    [0, 1, 1, 1],
    [1, 1, 1, 1],
    [0, 1, 1, 1]
])
f([
    [0, 0, 0],
    [0, 1, 0],
    [0, 1, 0],
    [1, 1, 1],
    [1, 1, 0]
])
