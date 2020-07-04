class Solution {
    func isUgly(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        var num = num
        for k in [2, 3, 5] {
            while num.isMultiple(of: k) { num /= k }
        }
        return num == 1
    }
}

let f = Solution().isUgly

f(1)
f(0)
f(-1)
f(10)
f(14)
