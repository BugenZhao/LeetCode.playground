let tags: [Tag] = [.ON, .dp]

class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        if A.count <= 2 { return 0 }
        var dp = A.map { _ in (0, 0) }
        dp[1] = (2, A[1] - A[0])

        for i in 2..<A.count {
            let diff = A[i] - A[i - 1]
            if diff == dp[i - 1].1 {
                dp[i] = (dp[i - 1].0 + 1, diff)
            } else {
                dp[i] = (2, diff)
            }
        }

        return dp.map { (l, _) in max(l - 2, 0) }.reduce(0, +)
    }
}


let f = Solution().numberOfArithmeticSlices

f([1, 2, 3, 4]) == 3
f([1, 2, 3, 5, 7, 9, 10, 11, 12]) == 7
