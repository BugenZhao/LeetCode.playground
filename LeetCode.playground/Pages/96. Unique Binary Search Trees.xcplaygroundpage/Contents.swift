let tags: [Tag] = [.tree]

class Solution {
    func numTrees(_ n: Int) -> Int {
        var memo = [1]
        for r in 1...n {
            var num = 0 //: compiler is not good at `reduce` !!!
            (1...r).forEach { i in num += memo[i - 1] * memo[r - i] }
            memo.append(num)
        }
        return memo.last!
    }
}

let f = Solution().numTrees

f(3)
f(1)
