class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var counts = [Int](repeating: 0, count: 128)
        s.forEach { counts[Int($0.asciiValue!)] += 1 }
        let sum = counts.reduce(0) { $0 + $1 / 2 * 2 }
        return sum + (counts.contains { $0 % 2 == 1 } ? 1 : 0)
    }
}

let f = Solution().longestPalindrome

f("abccccdd")
