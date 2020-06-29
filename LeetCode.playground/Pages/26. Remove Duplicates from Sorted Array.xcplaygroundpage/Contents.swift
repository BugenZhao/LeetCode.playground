let tags: [Tag] = [.array, .twoPtrs]

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lo = nums.startIndex
        for hi in nums.indices where hi == 0 || nums[hi] != nums[hi - 1] {
            nums[lo] = nums[hi]
            //: a better approach -> using `nums[hi] != nums[lo-1]`, which can be easily extended to at most K duplicates
            //: in this problem, we are always deciding based on the very last number, so using `hi` just works
            //: refer to 80
            lo += 1
        }
        nums.removeLast(nums.count - lo)
        return lo
    }
}

var arr = [1, 1, 2, 2, 2, 2, 3, 4, 5, 5]
Solution().removeDuplicates(&arr)
arr
