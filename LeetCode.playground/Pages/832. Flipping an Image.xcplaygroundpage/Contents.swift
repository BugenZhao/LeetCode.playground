class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        return A.map { $0.reversed().map { $0 ^ 1 } }
    }
}

Solution().flipAndInvertImage([[1, 1, 0], [1, 0, 1], [0, 0, 0]])
