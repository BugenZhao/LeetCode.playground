import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        return n == 1 || n > 0 && n.isMultiple(of: 3) && isPowerOfThree(n / 3)
    }
}

let f = Solution().isPowerOfThree
f(Int(pow(3.0, 4)))
f(Int(pow(3.0, 4)) + 1)
f(1)
f(2)
f(0)
