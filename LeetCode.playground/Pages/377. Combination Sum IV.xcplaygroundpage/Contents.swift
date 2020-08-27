let tags: [Tag] = [.dfs, .dp]

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var memo = [Int: Int]()
        func worker(_ target: Int) -> Int {
            if let a = memo[target] { return a }
            if target == 0 { return 1 }
            let ans = nums.filter { target - $0 >= 0 }.map { worker(target - $0) }.reduce(0, +)
            memo[target] = ans
            return ans
        }
        return worker(target)
    }
}

let f = Solution().combinationSum4

f([1, 2, 3], 4)
f([3, 33, 333], 10000)


class SolutionBottomUp {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = [1]
        //: not that good, since we never use some of the `dp` values, and it may even overflow
        for t in 1...target { dp.append(nums.map { t >= $0 ? dp[t - $0] : 0 }.reduce(0, &+)) }
        return dp.last!
    }
}

let g = SolutionBottomUp().combinationSum4

g([1, 2, 3], 4)
g([3, 33, 333], 10000)
