let tags: [Tag] = [.twoPtrs]

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var (ans, minDiff) = (0x1018, Int.max)
        for first in nums.indices {
            var second = first + 1
            var third = nums.endIndex - 1
            while second < third {
                let sum = nums[first] + nums[second] + nums[third]
                if sum == target { return target }
                let diff = abs(sum - target)
                if diff < minDiff { ans = sum; minDiff = diff }
                if sum > target { third -= 1 }
                else { second += 1 }
            }
        }
        return ans
    }
}

Solution().threeSumClosest([-1, 2, 1, -4], 1)
