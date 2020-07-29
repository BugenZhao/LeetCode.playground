let tags: [Tag] = [.dp, .state, .dp]

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }

        var rested = prices.map { _ in 0 }
        var bought = rested
        var sold = rested

        rested[0] = 0
        bought[0] = 0 - prices[0]
        sold[0] = 0

        for i in prices.indices.dropFirst() {
            rested[i] = max(rested[i - 1], sold[i - 1])
            bought[i] = max(bought[i - 1], rested[i - 1] - prices[i])
            sold[i] = bought[i - 1] + prices[i]
        }

        return max(rested.last!, sold.last!)
    }
}

let f = Solution().maxProfit

f([1, 2, 3, 0, 2])
f([0, 5])
f([0, -5])
f([2])
f([0])
f([-5])
f([])


class SolutionBetterSpace {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }

        var rested = 0
        var bought = 0 - prices[0]
        var sold = 0

        for price in prices.dropFirst() {
            (rested,
             bought,
             sold) =
                    (max(rested, sold),
                     max(bought, rested - price),
                     bought + price)
        }

        return max(rested, sold)
    }
}

let g = Solution().maxProfit

g([1, 2, 3, 0, 2])
g([0, 5])
g([0, -5])
g([2])
g([0])
g([-5])
g([])
