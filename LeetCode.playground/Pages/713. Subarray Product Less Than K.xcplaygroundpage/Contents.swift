let tags: [Tag] = [.ON, .twoPtrs]

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var prod = 1
        var lo = nums.startIndex
        for hi in nums.indices {
            prod *= nums[hi]
            while lo <= hi, prod >= k {
                prod /= nums[lo]
                lo += 1
            }
            ans += hi - lo + 1 //: `[i...hi], i in [lo...hi]`
        }
        return ans
    }
}
