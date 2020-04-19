class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (idx, num) in nums.enumerated() {
            if let idxo = dict[target - num] {
                return [idxo, idx]
            } else {
                dict[num] = idx
            }
        }
        return [233, 666]
    }
}

testEqual(Solution().twoSum([2, 7, 11, 15], 9), [0, 1])
