let tags: [Tag] = [.bit]

class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        let m = n ^ (n >> 1)
        return m & (m + 1) == 0
    }
}

let f = Solution().hasAlternatingBits
f(0b101)
f(0b1010)
f(0b1011)
f(0b111)
f(0b1)
f(0b0)
