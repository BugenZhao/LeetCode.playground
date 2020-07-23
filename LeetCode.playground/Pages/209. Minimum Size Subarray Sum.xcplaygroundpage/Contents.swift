let tags: [Tag] = [.sliding, .array, .ON]

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var (i, j) = (0, 0) // [i, j)
        var sum = 0
        var ans = Int.max
        while j != nums.endIndex {
            while j < nums.endIndex, sum < s { sum += nums[j] ; j += 1 }
            while i <= j, sum >= s { sum -= nums[i]; i += 1 }
            ans = min(ans, j - i + 1)
        }
        return ans > nums.count ? 0 : ans
    }
}

let f = Solution().minSubArrayLen

f(7, [2, 3, 1, 2, 4, 3])
f(100, [1, 2, 3])
f(4, [1, 4, 4])
f(11, [1, 2, 3, 4, 5])
