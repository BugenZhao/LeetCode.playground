//: Allow multiple transactions : Greedy || State Machine
let tags: [Tag] = [.greedy]

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 1 else { return 0 }
        //: `reduce` -> slow in both compilation and running!!!!!!!
        return (1..<(prices.count)).reduce(0) { return $0 + max(prices[$1] - prices[$1 - 1], 0) }
    }
}

let f = Solution().maxProfit
f([7, 1, 5, 3, 6, 4])
f([1, 2, 3, 4, 5])
f([7, 6, 4, 3, 1])


class SolutionStateMachine {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }
        
        var (bought, sold) = (-prices[0], 0)
        for price in prices.dropFirst() {
            (bought, sold) = (max(bought, sold - price), max(sold, bought + price))
        }
        return sold
    }
}

let g = SolutionStateMachine().maxProfit
g([7, 1, 5, 3, 6, 4])
g([1, 2, 3, 4, 5])
g([7, 6, 4, 3, 1])
