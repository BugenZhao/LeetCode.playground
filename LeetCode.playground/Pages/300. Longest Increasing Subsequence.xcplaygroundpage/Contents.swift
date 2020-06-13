let tags: [Tag] = [.dp, .marked, .binSearch]

class SolutionFP {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: nums.count)
        //: `dp[i]`: the length of LIS ending up with `nums[i]`
        for i in nums.indices {
            dp[i] = ((0..<i).filter { nums[$0] < nums[i] }.map { dp[$0] }.max() ?? 0) + 1
        }
        return dp.max() ?? 0
    }
}

var f = SolutionFP().lengthOfLIS
f([10, 9, 2, 5, 3, 7, 101, 18])
f([1, 3, 6, 7, 9, 4, 10, 5, 6])
f([])


class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: nums.count)
        for i in nums.indices {
            var m = 0
            for j in 0..<i where nums[j] < nums[i] {
                m = max(m, dp[j])
            }
            dp[i] = m + 1
        }
        return dp.max() ?? 0
    }
}

f = Solution().lengthOfLIS
f([10, 9, 2, 5, 3, 7, 101, 18])
f([1, 3, 6, 7, 9, 4, 10, 5, 6])
f([])


class SolutionNlogN {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int.min]
        //: `dp[i]`: the minimal ending of all IS's whose length is `i`, which must be increasing
        //: `nums = [10, 9, 2, 5, 3, 7, 101, 18]`
        //: `dp   = [--, 2, 3, 7, 18, x, x, x]`
        for num in nums {
            //: can `num` be a better ending?
            let index = dp.binarySearch(predicate: { $0 < num })
            if index == dp.endIndex { dp.append(num) } //: extend by 1
            else { dp[index] = num } //: a better ending for `index`-length IS
        }
        return dp.count - 1
    }
}

f = SolutionNlogN().lengthOfLIS
f([10, 9, 2, 5, 3, 7, 101, 18])
f([1, 3, 6, 7, 9, 4, 10, 5, 6])
f([])
