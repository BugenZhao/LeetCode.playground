let tags: [Tag] = [.math, .dp]

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for j in 1..<n { dp[j] += dp[j - 1] }
        }
        return dp.last!
    }
}

class SolutionC {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result = 1
        for i in 0 ..< min(m - 1, n - 1) {
            result = (result * (m + n - 2 - i)) / (i + 1)
        }
        return result
    }
}


let f = SolutionC().uniquePaths

f(7, 3)
f(3, 7)
f(1, 1)
f(30, 30)
