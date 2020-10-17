let tags: [Tag] = [.binSearch]

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix.first!.isEmpty { return false }
        let M = matrix.count
        let N = matrix.first!.count

        let index = (0..<M * N).binarySearch { i in
            let (x, y) = (i / N, i % N)
            return matrix[x][y] < target
        }
        return index != M * N && matrix[index / N][index % N] == target
    }
}


Solution().searchMatrix([[1]], 1)
