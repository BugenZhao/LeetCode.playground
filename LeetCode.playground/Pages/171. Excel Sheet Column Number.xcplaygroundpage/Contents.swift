class Solution {
    func titleToNumber(_ s: String) -> Int {
        return s.map { Int($0.asciiValue! - Character("A").asciiValue! + 1) }
                .reduce(0) { $0 * 26 + $1 }
    }
}

let f = Solution().titleToNumber
f("A")
f("AB")
f("ZY")
f("FXSHRXW")
