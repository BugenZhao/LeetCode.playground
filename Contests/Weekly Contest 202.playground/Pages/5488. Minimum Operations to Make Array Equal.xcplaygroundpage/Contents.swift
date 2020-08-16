class Solution {
    func minOperations(_ n: Int) -> Int {
        let m = n / 2
        return n.isMultiple(of: 2) ? m * m : m * (m + 1)
    }
}

let f = Solution().minOperations

f(1)
f(2)
f(3)
f(4)
f(5)


