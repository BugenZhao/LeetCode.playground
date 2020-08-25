let tags: [Tag] = [.binSearch]

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let i = nums.binarySearch { $0 < target }
        let j = nums.binarySearch { $0 <= target } - 1
        return nums.indices ~= i && nums[i] == target ? [i, j] : [-1, -1]
    }
}


let f = Solution().searchRange

f([5, 7, 7, 8, 8, 10], 8)
f([8, 8, 8, 8, 8], 8)
f([5, 7, 7, 8, 10], 8)
f([5, 7, 7, 9, 10], 8)
