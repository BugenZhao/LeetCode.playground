let tags: [Tag] = [.array, .twoPtrs]

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var lo = nums.startIndex
        for num in nums where num != val { nums[lo] = num; lo += 1 }
        return lo
    }
}

var arr = [0, 1, 2, 2, 3, 0, 4, 2]
Solution().removeElement(&arr, 2)
arr
