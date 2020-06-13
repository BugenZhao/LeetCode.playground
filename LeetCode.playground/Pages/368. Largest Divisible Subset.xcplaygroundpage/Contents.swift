//: See also: 300
let tags: [Tag] = [.dp]

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        var dp = [[Int]](repeating: [], count: nums.count)
        for i in nums.indices {
            var m = 0
            var index: Int?
            for j in 0..<i where nums[i].isMultiple(of: nums[j]) && dp[j].count > m {
                m = dp[j].count
                index = j;
            }
            dp[i] = (index == nil ? [] : dp[index!]) + [nums[i]]
        }
        return dp.max(by: { lhs, rhs in lhs.count < rhs.count }) ?? []
    }
}

let f = Solution().largestDivisibleSubset

f([1, 2, 3])
f([1, 2, 3, 4, 6, 8])
f([])
f([2, 7])
f([8, 4, 2])
f([4, 8, 10, 240])
