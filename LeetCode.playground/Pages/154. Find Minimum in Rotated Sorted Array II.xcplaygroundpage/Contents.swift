//: Allow duplicates. See 153 first.
let tags: [Tag] = [.binSearch]

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var lo = nums.startIndex
        var hi = nums.endIndex - 1
        while lo != hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] > nums[hi] {
                lo = mid + 1
            } else if nums[mid] < nums[hi] {
                hi = mid
            } else { //: `nums[mid] == nums[hi]`, can only exclude the rightmost one
                hi = hi - 1
            }
        }
        return nums[lo]
    }
}

let f = Solution().findMin

f([4, 5, 6, 7, 1, 2, 3])
f([3, 3, 3, 4, 1, 2, 2])
