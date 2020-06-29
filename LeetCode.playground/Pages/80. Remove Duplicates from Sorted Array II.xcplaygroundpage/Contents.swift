let tags: [Tag] = [.array, .twoPtrs]

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lo = nums.startIndex
        for num in nums where lo <= 1 || num != nums[lo - 2] { //: use `lo` instead of `hi`! See 26
            nums[lo] = num
            lo += 1
        }
        nums.removeLast(nums.count - lo)
        return lo
    }
}

var arr = [1, 1, 1, 2, 2, 3]
Solution().removeDuplicates(&arr)
arr
