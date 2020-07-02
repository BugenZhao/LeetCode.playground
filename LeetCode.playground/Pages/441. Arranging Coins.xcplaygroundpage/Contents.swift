let tags: [Tag] = [.math]

class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        return Int((Double(8 * n + 1).squareRoot() - 1) / 2.0)
    }
}

let f = Solution().arrangeCoins

f(8)
f(9)
f(10)
