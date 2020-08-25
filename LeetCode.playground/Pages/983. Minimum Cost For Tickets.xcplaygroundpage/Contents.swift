let tags: [Tag] = [.dp]

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let last = days.last!
        var travel = [Bool](repeating: false, count: last + 1)
        for day in days { travel[day] = true }
        var dp = [Int](repeating: 0, count: last + 31)

        for day in (1...last).reversed() {
            if !travel[day] { dp[day] = dp[day + 1] }
            else {
                dp[day] = min(costs[0] + dp[day + 1],
                              costs[1] + dp[day + 7],
                              costs[2] + dp[day + 30])
            }
        }

        return dp[1]
    }
}


let f = Solution().mincostTickets

f([1, 4, 6, 7, 8, 20], [2, 7, 15])
f([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15])
