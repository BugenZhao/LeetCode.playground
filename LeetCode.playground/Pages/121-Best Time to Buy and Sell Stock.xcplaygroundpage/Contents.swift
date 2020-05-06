/*:
 Only one transaction -> Dynamic programming
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }

        let N = prices.count
        var dp = [Int](repeating: 0, count: N)
        var lowest = prices[0]

        for i in 1..<N {
            dp[i] = max(
                dp[i - 1], //: Have a break
                prices[i] - lowest //: Sell just today!
            )
            lowest = min(lowest, prices[i])
        }

        return dp.last!
    }
}


let f = Solution().maxProfit

f([7, 1, 5, 3, 6, 4])
f([1, 2, 3])
f([1])
f([5, 4, 3, 2, 1, -10, -20])
