let tags: [Tag] = [.math]

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}

Solution().singleNumber([4, 1, 2, 1, 2])
