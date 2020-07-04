//: See 153 first
let tags: [Tag] = [.binSearch]

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        var lo = nums.startIndex
        var hi = nums.endIndex - 1
        while lo != hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] > nums[hi] {
                if target > nums[mid] || target <= nums[hi] { lo = mid + 1 }
                else { hi = mid }
            } else {
                if target <= nums[mid] || target > nums[hi] { hi = mid }
                else { lo = mid + 1 }
            }
        }
        return nums[lo] == target ? lo : -1
    }
}

let f = Solution().search

f([4, 5, 6, 7, 0, 1, 2], 4)
f([4, 5, 6, 7, 0, 1, 2], 5)
f([4, 5, 6, 7, 0, 1, 2], 6)
f([4, 5, 6, 7, 0, 1, 2], 7)
f([4, 5, 6, 7, 0, 1, 2], 0)
f([4, 5, 6, 7, 0, 1, 2], 1)
f([4, 5, 6, 7, 0, 1, 2], 2)
f([4, 5, 6, 7, 0, 1, 2], 3)
f([], 5)
f([2], 5)
f([5], 5)
