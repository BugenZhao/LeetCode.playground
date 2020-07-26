let tags: [Tag] = [.math]

class Solution {
    func romanToInt(_ s: String) -> Int {
        let valueOf: [Character: Int] =
            ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
        let values = s.map { valueOf[$0]! }
        
        var ans = 0
        for i in values.indices {
            if i == values.endIndex - 1 || values[i] >= values[i + 1] { ans += values[i] }
            else { ans -= values[i] }
        }
        return ans
    }
}

let f = Solution().romanToInt

f("XIV")
f("XVII")
