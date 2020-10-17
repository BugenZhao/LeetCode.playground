class Solution {
    func numberOfSets(_ N: Int, _ K: Int) -> Int {
        var memo = [[Int?]](repeating: .init(repeating: nil, count: K + 1), count: N + 1)
        var sum = [[Int?]](repeating: .init(repeating: nil, count: K + 1), count: N + 1)
        memo[2][1] = 1

        func sumWorker(_ n: Int, _ k: Int) -> Int {
            if let s = sum[n][k] { return s }
            if n == 1 {
                sum[n][k] = worker(n, k)
            } else {
                sum[n][k] = (sumWorker(n - 1, k) + worker(n, k)) % (10_0000_0007)
            }
            return sum[n][k]!
        }

        func worker(_ n: Int, _ k: Int) -> Int {
            if n <= k { return 0 }
            if n <= 1 { return 1 }
            if k == 0 { return 1 }
            if let m = memo[n][k] { return m }

            let ans = (worker(n - 1, k) + sumWorker(n - 1, k - 1)) % (10_0000_0007)

            memo[n][k] = ans
            return ans
        }

        return worker(N, K)
    }
}
