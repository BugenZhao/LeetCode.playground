let tags: [Tag] = [.binSearch, .array]

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = nums.startIndex
        var hi = nums.endIndex
        while lo != hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] < target {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo == nums.endIndex || nums[lo] != target ? -1 : lo
    }
}
