let tags: [Tag] = [.math]

class Solution {
    func addDigits(_ num: Int) -> Int {
        return 1 + (num - 1) % 9 // num == 0 ? 0 : num % 9 == 0 ? 9 : num % 9
    }
}

let f = Solution().addDigits

f(38)
f(0)
f(1)
f(9)
f(10)
