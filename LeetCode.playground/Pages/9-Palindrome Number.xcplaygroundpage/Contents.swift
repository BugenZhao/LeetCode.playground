let tags: [Tag] = [.math]

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        if x <= 9 { return true }

        let reversed = { () -> Int in var x = x
            var ans = 0
            while x > 0 {
                ans = ans * 10 + x % 10
                x /= 10
            }
            return ans
        }()

        return x == reversed
    }
}

let f = Solution().isPalindrome
f(12321)
f(110)
