//: Monotonic Stack

let tags: [Tag] = [.stack, .ON]

class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var stack = [Int]()
        var discounts = prices.map { _ in 0 }
        for (i, price) in prices.enumerated() {
            while !stack.isEmpty, price <= prices[stack.last!] {
                discounts[stack.last!] = price
                stack.removeLast()
            }
            stack.append(i)
        }
        return zip(prices, discounts).map { $0 - $1 }
    }
}


let f = Solution().finalPrices

f([8, 4, 6, 2, 3])
f([1, 2, 3, 4, 5])
