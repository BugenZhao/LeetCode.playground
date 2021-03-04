class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        return nums.count * (nums.count + 1) / 2 - nums.reduce(0, +)
    }
}
