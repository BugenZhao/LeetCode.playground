//: Only one transaction: Dynamic Programming || State Machine
let tags: [Tag] = [.dp, .state]

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


class SolutionStateMachine {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }

        let initial = 0; var (bought, sold) = (-prices[0], 0)
        for price in prices.dropFirst() {
            (bought, sold) = (max(bought, initial - price), max(sold, bought + price))
        }
        return sold
    }
}
