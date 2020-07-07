let tags: [Tag] = [.math]

class Solution {
    func integerReplacement(_ n: Int) -> Int {
        var n = n
        for count in 0... {
            if n == 1 { return count }
            else if n == 3 { return count + 2 }
            else if n.isMultiple(of: 2) { n >>= 1 }
            else { n += n % 4 - 2 } //: every time there's at most one new `0 -> 1`
        }
        return -1
    }
}

let f = Solution().integerReplacement

f(8)
f(7)
f(6)
f(3)
