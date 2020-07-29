let tags: [Tag] = [.greedy, .dp, .state]

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.isEmpty || k == 0 { return 0 }

        if k >= prices.count / 2 { //: full enough limitation, greedy!
            var profit = 0
            for i in prices.indices.dropFirst() {
                profit += max(prices[i] - prices[i - 1], 0)
            }
            return profit
        }

        var bought = [Int](repeating: Int.min, count: k)
        var sold = [Int](repeating: 0, count: k + 1)
        bought[0] = -prices[0]

        for price in prices.dropFirst() {
            var (boughtNew, soldNew) = (bought, sold)
            for i in bought.indices {
                boughtNew[i] = max(bought[i], sold[i] - price)
            }
            for i in sold.indices.dropFirst() {
                soldNew[i] = max(sold[i], bought[i - 1] + price)
            }

            bought = boughtNew
            sold = soldNew
        }

        return sold.max()!
    }
}

let f = Solution().maxProfit

f(2, [2, 4, 1])
f(2, [1, 8, 1, 3, 1, 5])
f(0, [1, 2])
f(1, [8, 1])
f(2, [3, 2, 6, 5, 0, 3])

let huge = TestCase("huge.in")!
f(huge.next()!, huge.next()!)
