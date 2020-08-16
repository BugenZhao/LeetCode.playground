class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let counts = grid.map { line in
            line.last! >= 0 ?
                0:
                line.count - line.binarySearch(predicate: { $0 >= 0 })
        }
        return counts.reduce(0, +)
    }
}

Solution().countNegatives([[4, 3, 2, -1], [3, 2, 1, -1], [1, 1, -1, -2], [-1, -1, -2, -3]])
