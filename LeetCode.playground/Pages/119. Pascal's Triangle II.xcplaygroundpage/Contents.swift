class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        var row = [1]
        for i in 1...rowIndex {
            row.append(row.last! * (rowIndex + 1 - i) / i)
        }
        return row
    }
}

(0...5).map {
    Solution().getRow($0)
}
