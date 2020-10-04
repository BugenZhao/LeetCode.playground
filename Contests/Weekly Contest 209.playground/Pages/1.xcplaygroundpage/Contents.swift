class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        return (0...nums.count).first { i in nums.filter { $0 >= i }.count == i } ?? -1
    }
}
