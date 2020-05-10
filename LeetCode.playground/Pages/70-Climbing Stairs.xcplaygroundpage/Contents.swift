// Dynamic Programming

let tags: [Tag] = [.dp]

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n >= 2 else { return 1 }
        var ans = [Int](repeating: 0, count: n + 1)
        ans[0] = 1; ans[1] = 1
        for i in 2...n {
            ans[i] = ans[i - 1] + ans[i - 2]
        }
        return ans[n]
    }
}

Solution().climbStairs(1)
Solution().climbStairs(2)
Solution().climbStairs(3)
Solution().climbStairs(4)
