let tags: [Tag] = [.binSearch]

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let M = nums.count / 2
        var lo = 0; var hi = M

        while lo < hi {
            let mid = (lo + hi) / 2

            let here = nums[2 * mid]
            let right = mid == M ? nil : nums[2 * mid + 1]

            if here == right {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return nums[2 * lo]
    }
}

let f = Solution().singleNonDuplicate

f([1, 1, 2, 3, 3, 4, 4, 8, 8])
f([3, 3, 7, 7, 10, 11, 11])
f([0, 1, 1])
f([1, 1, 2])
