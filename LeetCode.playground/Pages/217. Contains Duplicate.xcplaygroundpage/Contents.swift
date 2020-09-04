let tags: [Tag] = [.hash]

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count != Set(nums).count
    }
}
