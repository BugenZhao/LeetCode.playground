/*:
 Allow multiple transactions -> *greedy*
 */

let tags: [Tag] = [.greedy]

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 1 else { return 0 }
        //: `reduce` -> slow in both compilation and running!!!!!!!
        return (1..<(prices.count)).reduce(0) { return $0 + max(prices[$1] - prices[$1 - 1], 0) }
    }
}


Solution().maxProfit([7, 1, 5, 3, 6, 4])
Solution().maxProfit([1, 2, 3, 4, 5])
Solution().maxProfit([7, 6, 4, 3, 1])
