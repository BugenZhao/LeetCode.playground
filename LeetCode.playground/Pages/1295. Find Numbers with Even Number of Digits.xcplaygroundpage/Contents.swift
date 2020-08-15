class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.filter { "\($0)".count.isMultiple(of: 2) }.count
    }
}

Solution().findNumbers([12, 345, 2, 6, 7896])
