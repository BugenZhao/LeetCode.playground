let tags: [Tag] = [.math]

class Solution {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a > b { return gcd(b, a) }
        return a == 0 ? b : gcd(b % a, a)
    }

    func isGoodArray(_ nums: [Int]) -> Bool {
        return nums.reduce(0) { gcd($0, $1) } == 1
    }
}


let f = Solution().isGoodArray

f([12, 5, 7, 23])
f([29, 6, 10])
f([3, 6])
f([6, 10, 15])
