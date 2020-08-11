class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 { return [] }
        if numRows == 1 { return [[1]] }

        var results = [[1], [1, 1]]
        while results.count < numRows {
            let last = results.last!
            results.append([1] + last.indices.dropLast().map { last[$0] + last[$0 + 1] } + [1])
        }
        return results
    }
}

Solution().generate(5)
