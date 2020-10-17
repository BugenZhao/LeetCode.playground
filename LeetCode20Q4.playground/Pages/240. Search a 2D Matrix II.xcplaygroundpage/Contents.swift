let tags: [Tag] = [.ON, .marked]

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let (M, N) = (matrix.count, matrix.first?.count ?? 0)
        var (r, c) = (M - 1, 0) //: start searching for the left-down corner
        while 0..<M ~= r, 0..<N ~= c {
            if target == matrix[r][c] { return true }
            else if target > matrix[r][c] { c += 1 } //: only if we move right we can get a larger number
            else { r -= 1 }
        }
        return false
    }
}
