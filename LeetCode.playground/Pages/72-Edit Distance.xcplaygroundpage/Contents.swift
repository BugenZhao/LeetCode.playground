//: Dynamic programming.

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let c1 = word1.count
        let c2 = word2.count

        if c1 == 0 { return c2 }
        if c2 == 0 { return c1 }

        var dp = (0...c1).map { $0 }

        for j in 1...c2 {
            var newDP = [Int]()
            newDP.append(dp[0] + 1)

            for i in 1...c1 {
                newDP.append(min(
                    newDP[i - 1] + 1, //: insert in `word1`
                    dp[i] + 1, //: insert in `word2`
                    dp[i - 1] + (word1[i - 1] == word2[j - 1] ? 0 : 1 //: match or replace
                    )))
            }

            dp = newDP
        }

        return dp.last!
    }
}


class SolutionOn2 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let c1 = word1.count
        let c2 = word2.count

        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: c2 + 1), count: c1 + 1)

        func worker(_ i: Int, _ j: Int) -> Int {
            guard memo[i][j] == nil else { return memo[i][j]! }
            if i == 0 { return j }
            if j == 0 { return i }

            var minCost = Int.max

            if i >= 1 && j >= 1 {
                //: match or replace
                let cost = worker(i - 1, j - 1) + ((word1[i - 1] == word2[j - 1]) ? 0 : 1)
                minCost = min(cost, minCost)
            }
            if i >= 1 {
                //: insert in `s1`
                let cost = worker(i - 1, j) + 1
                minCost = min(cost, minCost)
            }
            if j >= 1 {
                //: insert in `s2`
                let cost = worker(i, j - 1) + 1
                minCost = min(cost, minCost)
            }

            memo[i][j] = minCost
            return minCost
        }

        return worker(c1, c2)
    }
}


let f = Solution().minDistance
f("horse", "ros")
f("intention", "execution")
f("ddd", "sss")
f("", "")
f("", "abc")
