let tags: [Tag] = [.dp, .ON]

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return nums.first ?? 0 }
        var dp = [Int](repeating: 0, count: nums.count + 1)
        dp[1] = nums[0]
        for i in 2...nums.count {
            dp[i] = max(nums[i - 1] + dp[i - 2], dp[i - 1])
        }
        return max(dp[nums.count], dp[nums.count - 1])
    }
}


class SolutionSpace {
    func rob(_ nums: [Int]) -> Int {
        var (include, exclude) = (0, 0)
        for num in nums { (include, exclude) = (exclude + num, max(include, exclude)) }
        return max(include, exclude)
    }
}


let f = SolutionSpace().rob
f([2, 3, 2])
f([1, 2, 3, 1])
