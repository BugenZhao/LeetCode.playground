class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        let piles = piles.sorted(by: >)
        var ans = 0
        for i in (0..<piles.count / 3) {
            ans += piles[2 * i + 1]
        }
        return ans
    }
}


let f = Solution().maxCoins

f([2, 4, 1, 2, 7, 8])
f([2, 4, 5])
f([1, 2, 3, 4, 5, 6, 7, 8, 9])
