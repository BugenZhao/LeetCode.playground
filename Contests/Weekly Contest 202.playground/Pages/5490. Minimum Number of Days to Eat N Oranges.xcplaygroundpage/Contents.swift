class Solution {
    func minDays(_ n: Int) -> Int {
        var best = [Int: Int]()
        let l = (n.bitWidth - n.leadingZeroBitCount) + n.nonzeroBitCount - 1

        func worker(_ m: Int, _ curr: Int) -> Int {
            if m == 1 { return 1 }
            if let b = best[m] { return b }

            if curr > l + 128 { return m } //: casual pruning...

            var ans = Int.max
            if m.isMultiple(of: 3) { ans = min(ans, worker(m / 3, curr + 1) + 1) }
            if m.isMultiple(of: 2) { ans = min(ans, worker(m / 2, curr + 1) + 1) }
            ans = min(ans, worker(m - 1, curr + 1) + 1)

            best[m] = ans
            return ans
        }

        return worker(n, 0)
    }
}

let f = Solution().minDays

f(10)
f(6)
f(1)
f(56)
f(28)
f(280)
f(2800)
f(28000)
f(3196)
f(6044)
f(2338692)



class SolutionBetter {
    var memo = [0: 0, 1: 1, 2: 2]

    func minDays(_ n: Int) -> Int {
        if let m = memo[n] { return m }
        let ans = min(minDays(n / 2) + n % 2 + 1, minDays(n / 3) + n % 3 + 1)
        memo[n] = ans
        return ans
    }
}

let g = SolutionBetter().minDays

g(10)
g(6)
g(1)
g(56)
g(28)
g(280)
g(2800)
g(28000)
g(3196)
g(6044)
g(2338692)
