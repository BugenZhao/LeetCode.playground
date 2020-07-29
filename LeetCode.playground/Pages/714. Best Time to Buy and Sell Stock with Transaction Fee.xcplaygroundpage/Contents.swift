let tags: [Tag] = [.dp, .state, .ON]

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.isEmpty { return 0 }

        var (bought, sold) = (-prices[0], 0)
        for price in prices.dropFirst() {
            (bought, sold) = (max(bought, sold - price), max(sold, bought + price - fee))
        }
        return sold
    }
}

let f = Solution().maxProfit

f([1, 3, 2, 8, 4, 9], 2)
