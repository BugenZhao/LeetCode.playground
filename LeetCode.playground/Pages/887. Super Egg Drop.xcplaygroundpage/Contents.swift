let tags: [Tag] = [.dp, .marked]

class SolutionBruteForceTLE {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        //: `dp[k][n]`: the minimum # of moves to know `F` **with certainty**, in a building with `n` floors using `k` eggs
        var dp = [[Int]](repeating: .init(repeating: 0, count: N + 1), count: K + 1)
        for n in 1...N { dp[1][n] = n }

        for k in 2..<K + 1 {
            for n in 1...N {
                var ans = Int.max
                for i in 1...n { //: if we drop an egg from the `i`-th floor
                    ans = min(ans,
                        1 + max(dp[k - 1][i - 1], //: break! check `1...i-1` floors with `k-1` eggs left
                            dp[k][n - i]) //: instead, check `i+1...n` floors with `k` eggs left
                    )
                }
                dp[k][n] = ans
            }
        }
        return dp[K][N]
    }
}

let f = SolutionBruteForceTLE().superEggDrop

f(3, 14)
f(2, 6)
f(1, 2)
f(1, 10)
f(10, 1)


class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        //: `dp[k][m]`: the maximum # of floors we can check in a `m` moves using `k` eggs
        var dp = [[Int]](repeating: .init(repeating: 0, count: N + 1), count: K + 1)
        for m in 1... {
            for k in 1...K {
                dp[k][m] = dp[k - 1][m - 1] + 1 + dp[k][m - 1]
            }
            if dp[K][m] >= N { return m }
        }
        return 114_514
    }
}

let g = Solution().superEggDrop

g(3, 14)
g(2, 6)
g(1, 2)
g(1, 10)
g(10, 1)


class SolutionSpace {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        var dp = [Int](repeating: 0, count: K + 1)
        for m in 1... {
            for k in (1...K).reversed() { dp[k] += dp[k - 1] + 1 }
            if dp[K] >= N { return m }
        }
        return 114_514
    }
}

let h = SolutionSpace().superEggDrop

h(3, 14)
h(2, 6)
h(1, 2)
h(1, 10)
h(10, 1)
