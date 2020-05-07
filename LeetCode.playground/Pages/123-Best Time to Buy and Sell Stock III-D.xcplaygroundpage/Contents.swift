class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // The money we hold after we ...
        var bxxx = Int.min  // buy
        var bsxx = 0        // buy, sell
        var bsbx = Int.min  // buy, sell, buy
        var bsbs = 0        // buy, sell, buy, sell

        for price in prices {
            bsbs = max(bsbs, bsbx + price)
            bsbx = max(bsbx, bsxx - price)
            bsxx = max(bsxx, bxxx + price)
            bxxx = max(bxxx, 0 - price)
        }
        
        return max(bsbs, bsxx)
    }
}


let f = Solution().maxProfit
f([3,3,5,0,0,3,1,4])
